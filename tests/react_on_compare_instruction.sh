
function test_react_on_compare_instruction_for_small_first_number () {
    test_statement="Should return the cell of next instruction which is mention after the second number."
    index=0
    cells="2 5 6 0 99 1 2"
    expected_output=0

    actual_output=`react_on_compare_instruction ${index} "${cells}"`
    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"

}

function test_react_on_compare_instruction_for_small_second_number () {
    test_statement="Should return the number of cell which is after the cell next to the second number."
    index=0
    cells="2 5 6 0 99 3 3"
    expected_output=4

    actual_output=`react_on_compare_instruction ${index} "${cells}"`
    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"

}

test_react_on_compare_instruction () {
    test_react_on_compare_instruction_for_small_first_number
    test_react_on_compare_instruction_for_small_second_number
}