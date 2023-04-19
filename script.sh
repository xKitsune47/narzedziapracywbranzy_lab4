#!/bin/bash
#czytaj typ operacji i wartosc
type=$1
number=$2
today=$(date)
#wybierz operacje
case $1 in
	"--date")echo "$today";;
	"--logs");;
esac
