#! /bin/bash

function react_on_add_instruction () {
    index=$1
    cells=( $2 )
    
    first_index=$(( ${index} + 1 ))
    second_index=$(( ${index} + 2 ))
    third_index=$(( ${index} + 3 ))

    n1_index=${cells[${first_index}]}
    n2_index=${cells[${second_index}]}

    target_cell_index=${cells[${third_index}]}
    
    number_1=${cells[$n1_index]}
    number_2=${cells[$n2_index]}

    sum=$(( ${number_1} + ${number_2} ))

    cells[${target_cell_index}]=${sum}

    echo ${cells[@]}
}

function react_on_compare_instruction () {
    index=$1
    cells=( $2 )

    first_index=$(( ${index} + 1 ))
    second_index=$(( ${index} + 2 ))
    third_index=$(( ${index} + 3 ))

    n1_index=${cells[${first_index}]}
    n2_index=${cells[${second_index}]}

    number_1=${cells[${n1_index}]}
    number_2=${cells[${n2_index}]}


    index=$(( ${index} + 4 ))
    if [[ ${number_1} -lt ${number_2} ]] ; then
        index=${cells[${third_index}]}
    fi

    echo ${index}
}

function main () {
    cells=( $1 )

    index=0

    while true
    do
        if [[ ${cells[${index}]} == 1 ]]
        then
            cells=( `react_on_add_instruction ${index} "${cells[*]}"` )
            index=$(( ${index} + 4 ))
            continue
        elif [[ ${cells[${index}]} == 2 ]]
        then
            index=`react_on_compare_instruction ${index} "${cells[*]}"`
        elif [[ ${cells[index]} == 99 ]] ; then
            break
        fi

    done

    echo ${cells[@]}
}
