#!/bin/bash
#czytaj typ operacji i wartosc
type=$1
number=$2
today=$(date)
#wybierz operacje
case $1 in
	"--date")echo "$today";;
	"--logs")
		if [ $number -gt 0 ]
		then
			for logs in $(seq 1 $2)
			do
				fileName="log${logs}"
				touch $fileName.txt
				echo "log${logs}">>$fileName.txt
				echo $0>>$fileName.txt
				echo $today>>$fileName.txt
			done
		else
			for logs in {0..100};
			do
				fileName="log${logs}"
				touch $fileName.txt
				echo "log${logs}">>$fileName.txt
				echo $0>>$fileName.txt
				echo $today>>$fileName.txt
			done
		fi;;
esac

touch .gitignore
echo "*log*">.gitignore
