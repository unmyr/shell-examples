#!/usr/bin/env bash -x
./getopt_ex.sh
./getopt_ex.sh --namespace n1
./getopt_ex.sh --namespace n1 aaa bbb
./getopt_ex.sh aaa bbb --dry-run
./getopt_ex.sh aaa --namespace n1 bbb --dry-run
