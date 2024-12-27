#!/bin/env bash
INPUT_STR='Hello\world'
read LINE < <(echo $INPUT_STR)
echo $LINE  # output: Helloworld

read -r LINE < <(echo $INPUT_STR)
echo $LINE  # output: Hello\world
