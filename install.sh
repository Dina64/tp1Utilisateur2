cd
code="$(ls)"
folder="src"
if [[ "$code" == *"$folder"* ]]
then
        cd src

	Check_content="$(ls)"
	repo="Tp1"
	if [[ "$Check_content" == *"$Tp1"* ]]
	then
		echo "src/Tp1 present"
	else
		git clone https://github.com/Dina64/gererUtilisateur.git
		echo "src/gererUtilisateur successful"
	fi

else
        mkdir ~/src
	cd src
        git clone https://github.com/Dina64/gererUtilisateur.git
        echo "src/gererUtilisateur created"
fi

cd ~/src/gererUtilisateur
sudo cp ~/src/gererUtilisateur/user.service /etc/systemd/system/user.service

sudo sudo systemctl start user.service

sudo sudo systemctl enable user.service

echo "Installation Completed"
