#!/bin/bash

MOVIES=("HIT3" "#SINGLE" "PUSHPA2" "HAI" "MAD2")

echo "First movie name:  ${MOVIES[0]}"
echo "second movie name:  ${MOVIES[1]}"
echo "3rd movie name:  ${MOVIES[2]}"
echo "4th movie name:  ${MOVIES[3]}"
echo "5th movie name:  ${MOVIES[4]}"
echo " All Movie names: ${MOVIES[@]}"
echo " All Movie names: ${MOVIES[*]}"
