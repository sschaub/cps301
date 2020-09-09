#######################################################################################
# This file will be run from main.sh. Create test results by calling the following function:
# TestOutput <categoryName [string]> <testName [string]> <result[boolean]> <log[string]>
###################################################################################### 

function pdf_report_check {
  if file $1 | grep "PDF document"; then
    result=true
  else
    result=false  
  fi
  TestOutput "Must Pass" "PDF Report" $result "$(file $1)"

}

function sql_check {
  
    if [ -n "$QUERYDIR" ]; then
      echo Running in local Docker... skip this check
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

    service mysql start &>/dev/null
    while ! mysql ordentry -e "show tables" &>/dev/null
    do
      sleep 1
    done

    python3 $SQL_TEST/$SQL_TEST.py

}

# If TestOutput function not defined, define it here for local testing purposes
if ! type TestOutput &>/dev/null
then
function TestOutput {
  echo "$*"
}
fi