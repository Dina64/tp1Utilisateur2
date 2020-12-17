cd /home/dina/src/gererUtilisateur
while [ true ]
do
	cd /home/dina/src/Tp1
	code="$(ls)"
	fichier="infoUtls.csv "

	if [[ "$code" == "*$fichier*" ]]
	then
		cd /home/dina/src/gererUtilisateur
		xls2csv infoUtls.xls > infoUtls.csv 
	else
                touch /home/dina/src/gererUtilisateur/infoUtls.csv 
		cd /home/dina/src/gererUtilisateur
		xls2csv infoUtls.xls > infoUtls.csv 
	fi
	liste="/home/dina/src/gererUtilisateur/infoUtls.csv "

	array=($(awk -F: '{ print $1 }' /etc/passwd))

	i=0

	while IFS= read -r line
	do
		i=0

		for person in ${array[*]}
		do
			if [[ "$line" = "\"$line\"" ]]
			then
				i=$((i+1))
			fi
		done

		if [[ "$i" = 0 ]]
		then
			nom="$(echo $line | sed 's/\"//g')"

			useradd $nom

			mkhomedir_helper $nom
		fi

	done < $liste
done