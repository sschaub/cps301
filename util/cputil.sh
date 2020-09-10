#######################################################################################
# This file will be run from main.sh. Create test results by calling the following function:
# TestOutput <categoryName [string]> <testName [string]> <result[boolean]> <log[string]>
###################################################################################### 

function pdf_report_check {
  if file $1 | grep "PDF document" &>/dev/null; then
    result=true
  else
    result=false  
  fi
  TestOutput "Must Pass" "PDF Report" $result "$(file $1)"

}

function sql_check {
  
    if [ -n "$QUERYDIR" ]; then
      echo Running in local Docker... skipping sql filename check
      return
    fi

    if stdout=$(ls q*.sql); then
        result=true
    else
        result=false
    fi
    TestOutput "Must Pass" "Correct .sql filenames" $result "$stdout"
    if [ $result = false ]; then
      exit 1
    fi
}

function do_sql_test {

    SQL_TEST=$1

    bash /cps301/util/startmysql.sh &>/dev/null

    python3 $SQL_TEST/$SQL_TEST.py

}

# If TestOutput function not defined, define it here for local testing purposes
if ! type TestOutput &>/dev/null
then
function TestOutput {
  echo "TestOutput result: $1 $2 Pass: $3 Log: $4"
}
export -f TestOutput
fi