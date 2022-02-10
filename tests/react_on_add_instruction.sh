

function test_react_on_add_instruction () {
    test_statement="Should add the numbers in the cell numbers mentioned after instruction."
    index=0
    cells=(1 0 0 0 )
    expected_output="2 0 0 0"

    actual_output=`react_on_add_instruction ${index} "${cells[*]}"`
    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}
