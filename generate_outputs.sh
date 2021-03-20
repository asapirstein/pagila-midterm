#!/bin/bash
rm sql/*~
failed=false

mkdir -p results

for problem in sql/*; do
    printf "$problem "
    problem_id=$(basename ${problem%.sql})
    result="results/$problem_id.out"
    psql < $problem > $result
done


