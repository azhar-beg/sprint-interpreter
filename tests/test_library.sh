#! /bin/bash
source ../sprint.sh

function declare_global_var (){
        RED="\033[1;31m"
        GREEN="\033[0;32m"
        WHITE="\033[1;37m"
        NORMAL="\033[0m"

        FAILED_RECORDS[0]=""
        TEST_COUNT=0
        FAIL_COUNT=0
        PASS="${GREEN}✔${NORMAL}"
}

function save_fail_records (){
        local FAIL_RECORD=$1
        local test_statement=$2

        FAIL_COUNT=$(( ${FAIL_COUNT} + 1 ))
        FAILED_RECORDS+=( "${RED}${TEST_COUNT}.\n${NORMAL}${FAIL_RECORD}" )
        echo -e "\t${RED}${TEST_COUNT}.${NORMAL}\t${test_statement}"
}

function assert_expectation (){
        local actual_output=$1
        local expected_output=$2
        local test_statement=$3

        TEST_COUNT=$(( ${TEST_COUNT} + 1 ))

        local outputs="  actual output:\n${actual_output}\n  expected output:\n${expected_output}"

        local test_result="✗"
        if [[ ! "${actual_output}" == "${expected_output}" ]] ; then
                save_fail_records "${outputs}" "${test_statement}"
                return
        fi

        test_result="${PASS}"
        echo -e "\t${test_result}\t${test_statement}"
}

function test_report (){
        echo -e "\nFAILING TESTS\n=>"

        for i in `seq 1 ${FAIL_COUNT}` ; do
                echo -e "\n${FAILED_RECORDS[$i]}"
        done

        echo -ne "\n\t${WHITE}Tests passes : ${GREEN}$(( ${TEST_COUNT}-${FAIL_COUNT} ))/${TEST_COUNT}${NORMAL}"
        echo -e "\t${WHITE}Tests failed : ${RED}${FAIL_COUNT}/${TEST_COUNT}\n"
}

function all_test_cases () {
    echo -e "\n${WHITE}React on add instruction${NORMAL}"
    source react_on_add_instruction.sh
    test_react_on_add_instruction

    echo -e "\n${WHITE}React on compare instruction${NORMAL}"
    source react_on_compare_instruction.sh
    test_react_on_compare_instruction
}

declare_global_var