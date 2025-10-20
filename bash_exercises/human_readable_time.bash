#!/bin/bash

# I'll admit this is just garbage. I wrote this at 2am
seconds=$1
hours=$(( $seconds / (60 * 60) ))
(( seconds-=hours * (60 * 60)))
mins=$(( $seconds / 60 ))
(( seconds-=mins * 60))
printf "%02d:%02d:%02d" $hours $mins $seconds