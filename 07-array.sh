#!/bin/bash

MOVIES=("HIT3" "#SINGLE" "PUSHPA2" "HAI" "MAD2")

echo "First movie name:  ${MOVIES[0]}"
echo "second movie name:  ${MOVIES[1]}"
echo " All Movie names: ${MOVIES[@]}"
echo " All Movie names: ${MOVIES[*]}"
