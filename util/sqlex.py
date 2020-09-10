from subprocess import run, check_output, STDOUT, PIPE, Popen
from os.path import exists
import os.path, os
import re
import math
import random

BASEDIRNAME=os.path.dirname(os.path.realpath(__file__))

EXPDIR='.'
QUERYDIR = os.environ.get('QUERYDIR', '/') 

FAIL, OK = 'FAIL', 'OK'

DBPATH='ordentry'
POINTS_COLS_CORRECT = 1
POINTS_QUERY_RUNS = 1
POINTS_MAX_CORRECT = 4
MAX_OUTPUT_DISPLAY_ROWS = 15
POINTS_SORT_DEDUCT = -.5
TESTS = ['q1', 'q2', 'q3', 'q4', 'q5']

def runCmd(cmd, **kwargs):
    result = run(cmd, stdout=PIPE, stderr=STDOUT, shell=True, universal_newlines=True, **kwargs)
    return result

def runsql(testname):

  logfile = testname + '.log'
  result = runCmd('mysql --column-names ordentry', stdin=open(os.path.join(QUERYDIR, testname + '.sql')))

  output = result.stdout.strip()

  # print("Read: " + output + ", returncode:" + str(result.returncode))
  points = 0

  if 'ERROR' in output or result.returncode != 0:
    testresult = FAIL
  else:
    points = POINTS_QUERY_RUNS
    testresult = OK

  with open(logfile, 'w') as f:
    f.write(output)

  return makeResult('Execute Query', testresult, points, output)

def makeResult(testName, result, points, output):
  return { 'test': testName, 'result': result, 'points': points, 'output': output }

def getRows(output):
  #print(output)
  return output[1:]

def checkresult(testname, output):
  ACTUAL = [row.strip() for row in output.split('\n')]
  EXPECTED = open(os.path.join(EXPDIR, testname + '.exp')).readlines()
  EXPECTED = [row.strip() for row in EXPECTED]
  
  EXPECTED_COLS = EXPECTED[0]
  ACTUAL_COLS = ACTUAL[0]
  if EXPECTED_COLS == ACTUAL_COLS:
    result = OK
    points = POINTS_COLS_CORRECT
    output = ''
  else:
    result = FAIL
    points = 0
    output = 'Expected Columns: ' + ','.join(col.strip() for col  in EXPECTED[0].split('\t'))

  CHK_COL = makeResult('Column Check', result, points, output)

  EXPECTED_ROWS = getRows(EXPECTED)
  ACTUAL_ROWS = getRows(ACTUAL)
  # print(f"EXPECTED_ROWS = {EXPECTED_ROWS}, ACTUAL_ROWS = {ACTUAL_ROWS}")
  result = FAIL
  if len(EXPECTED_ROWS) == len(ACTUAL_ROWS):
    result = OK

    for i in range(len(EXPECTED_ROWS)):
      if EXPECTED_ROWS[i].strip() != ACTUAL_ROWS[i].strip():
        result = FAIL
        #print('Different:\n', repr(EXPECTED_ROWS[i]), '\n', repr(ACTUAL_ROWS[i]))
        break
    
    if result == OK:
      points = POINTS_MAX_CORRECT
      output = ''

  if result == FAIL:
    num_match = 0
    for row in EXPECTED_ROWS:
      if row in ACTUAL_ROWS:
        num_match += 1

    output = (f'Expected {len(ACTUAL_ROWS)} rows.\n' +
             f'{num_match} row(s) matched the expected results.')
    # if num_match == len(ACTUAL_ROWS):
    #   num_match -= SORT_DEDUCT
    # points = math.floor(MAX_CORRECT_POINTS * (num_match / len(ACTUAL_ROWS)))
    if num_match > 0:
      if num_match == len(ACTUAL_ROWS) and len(EXPECTED_ROWS) == len(ACTUAL_ROWS):
        output = (f'Almost! Output rows contain correct data, but are not in the right order.')
        points = POINTS_MAX_CORRECT + POINTS_SORT_DEDUCT
      elif num_match == len(EXPECTED_ROWS):
        output = (f'Almost! Output contains correct rows, but also has extra rows.')
        points = POINTS_MAX_CORRECT / 2
      else:
        points = POINTS_MAX_CORRECT / 2
        
    else:
      output = 'None of your output rows matched the expected output. :('
      points = 0

  CHK_ROW = makeResult('Results Check', result, points, output)  

  return CHK_COL, CHK_ROW

def printReport(results):
  totalPoints = 0
  for result in results:
    id, points = result['id'], result['points']
    totalPoints += points
    print(f'Test {id}: {points:>20} point(s)')
    for subtest in result['results']:
      test, passfail, points = subtest['test'], subtest['result'], subtest['points']
      print(f'   {test:<20}: {passfail:<10} ({points})')


  print(f'\nTotal points: {totalPoints}\n')

  for result in results:
    print('*************************************************')
    id = result['id']
    outstr = f'Test {id} Details\n'
    allpassed = True
    for subtest in result['results']:
      test, passfail, output = subtest['test'], subtest['result'], subtest['output']
      if passfail == FAIL:
        allpassed = False
      if output.strip():
        outstr += f'\n   {test:<20}: {passfail:<10} \n'
        rows = output.split('\n')
        if len(rows) > MAX_OUTPUT_DISPLAY_ROWS:
          rows = rows[:MAX_OUTPUT_DISPLAY_ROWS] + ['... additional output not displayed ...']
        for row in rows:
          outstr += '      ' + row.replace('\t', ' | ') + '\n'

    print(outstr)
    report_result('Query', id, allpassed, outstr)

  return totalPoints

def runTests(tests):

  #results = [{ 'id': 'q1', 'results': [ 
  #              { 'test': 'Syntax Check', 'result': 'OK', 'points': .5, 'output': '...' }, 
  #              { 'columns': 'ok' }, 
  #              { 'rows': 'ok' } ]}]
  results = []

  num_syntax_ok = 0
  num_files_found = 0
  for test in tests:
    
    if exists(os.path.join(QUERYDIR, test + '.sql')):
      num_files_found += 1
      CHK_SYNTAX = runsql(test)
    else:
      CHK_SYNTAX = makeResult('Execute Query', FAIL, 0, f'{test}.sql not submitted')
    
    if CHK_SYNTAX['result'] == OK:
      num_syntax_ok += 1
      CHK_COL, CHK_ROW = checkresult(test, CHK_SYNTAX['output'])
      result = [CHK_SYNTAX, CHK_COL, CHK_ROW]
    else:
      result = [CHK_SYNTAX]

    points = 0
    for subtest in result:
      points += subtest['points']
      
    results.append({ 'id': test, 'results': result, 'points': points })

  #print(result)
  

  if num_files_found > 0:
    totalPoints = printReport(results)
    # if isStudentJob():
    #   recordScore(totalPoints)
    if num_syntax_ok > 0:
      exit(0)
    else:
      exit(1)
  else:
    print('No q*.sql files found.')
    exit(1)

def report_result(category, case, res, logs=''):
  reporter = ("TestOutput \"%s\" \"%s\" %s \"%s\"") % (category, case, "true" if res else "false", logs)
  Popen(['/bin/bash', '-c', reporter])