a=(foo bar baz)
a=(${a[@]/bar})

for v in "${a[@]}"; do
    echo "$v"
done
