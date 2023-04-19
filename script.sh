#!/bin/bash
#czytaj typ operacji i wartosc
type=$1
number=$2
today=$(date)
#wybierz operacje
case $1 in
	"--date"|"-d")echo "$today";;
	"--logs"|"-l")
		if [[ $number -gt 0 ]]
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
		fi
	;;
	"--help"|"-h")
		echo "--date, -d - aktualna data i godzina"
		echo "--logs, -l - log, mozna wybrac ilosc zapisywanych logow dopisujac liczbe, bazowo jest ich 100"
		echo "--error, -e - to samo co log"
		echo "--help, -h - wyswietla kazda komende"
		echo "--init - klonuje repo do katalogu w ktorym zostal uruchomiony skrypt"
	;;
	"--init")
		git clone https://github.com/xKitsune47/narzedziapracywbranzy_lab3
		newPath=$(pwd)
		echo "export PATH=\$PATH:$newPath">>~/.bashrc
	;;
	"--error"|"-e")
		if [[ $number -gt 0 ]]
		then
			for err in $(seq 1 $2)
			do
				fileName="error${err}"
				touch $fileName.txt
				echo "error${err}">>$fileName.txt
				echo $0>>$fileName.txt
				echo $today>>$fileName.txt
			done
		else
			for err in {0..100};
			do
				fileName="error${err}"
				touch $fileName.txt
				echo "error${err}">>$fileName.txt
				echo $0>>$fileName.txt
				echo $today>>$fileName.txt
			done
		fi
	;;
esac

touch .gitignore
echo "*log*">>.gitignore
echo "*error*">>.gitignore
