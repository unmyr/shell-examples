ADD_RESULT=
add() {
    ADD_RESULT=$(($1 + $2))
}

add 2 3
echo $ADD_RESULT
