function test_main {
    test_statement="Should return the expected output according to instruction."
    index=0
    cells="1 0 0 0 99"
    expected_output="2 0 0 0 99"

    actual_output=`main "${cells}"`


    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}