#!/bin/bash

clear
while true; do
echo "==========================================================
       	Digite o número do componente a ser instalado: 

		1 - Ubuntu Tweak
		2 - Google Chrome
		3 - Visual Studio Code
		4 - VLC player
                5 - Instalação de pacotes por snap
                6 - Postman
                7 - LibreOffice
                8 - Spotify
                9 - Opera
                10 - NodeJS, NPM, Yarn e React JS
                0 - Sair
        
==========================================================="
echo -n "->OPÇÃO:  "

read opcao

#verificar se foi digitada uma opcao
if [ -z $opcao ]; then
	echo "ERRO: digite uma opcao"
	exit
fi

case $opcao in
	1)
		sudo add-apt-repository universe &&
		sudo apt-get update &&
		sudo apt install gnome-tweak-tool;;
	2)
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
        sudo dpkg -i google-chrome-stable_current_amd64.deb;;
	3)
		sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
        url https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
        sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&
        sudo apt-get update &&
        sudo apt-get install code;;
	4)
		sudo add-apt-repository ppa:videolan/stable-daily &&
		sudo apt-get update &&
		sudo apt-get install vlc;;

    5)  sudo apt update &&
        sudo apt install snapd &&
        sudo snap install hello-world &&
        hello-world;;
 
    6)  sudo snap install postman;;
       
    7)  sudo add-apt-repository -y ppa:libreoffice/ppa &&
        sudo apt-get update &&
        sudo apt-get install libreoffice libreoffice-style-breeze;;
    
    8)  sudo snap install spotify;;

    9)  sudo snap install opera;;

    10)  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - &&
        sudo apt-get install -y nodejs &&
        sudo npm install npm@latest -g &&
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - &&
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list &&
        sudo apt update &&
        sudo apt install yarn &&
        yarn --version &&
        yarn global add create-react-app;;


    
	0)
		echo "Saindo..."
		exit;;
	*)
		echo
		echo "ERRO: opção inválida"
		echo ;;
esac
done