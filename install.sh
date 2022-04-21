#!/usr/bin/env bash

NEOFETCHDIR="$HOME"/.config/neofetch
NEOFETCHBIN=/usr/bin/neofetch

install_neofetch() {
    if [[ `whereis neofetch` ]]; then
        echo -e "\e[0;32m+---Backup your Neofetch Conf---+\e[0m\n"
        if [[ `ls ~/.config/neofetch` ]]; then
            mv ~/.config/neofetch    ~/.config/NEOFETCH.BAK
            mkdir "$NEOFETCHDIR"
        fi
        echo -e "\e[0;32m Copy the config for .config\e[0m\n"
        cp -r `pwd`/files/config/config.conf   "$NEOFETCHDIR"

        echo -e "\e[0;32m Copy the bin for /usr/bin/\e[0m"
        sudo cp -r `pwd`/files/bin/neofetch       "$NEOFETCHBIN"
        sudo chmod +x "$NEOFETCHBIN"

        echo -e "\n\e[0;32m+-----------Finished!-----------+\e[0m"
    else
        echo -e "\e[0;32m+---Install Neofetch---+\e[0m\n"
        sudo pacman -S neofetch

        echo -e "\e[0;32m Copy the config for .config\e[0m\n"
        cp -r `pwd`/files/config/config.conf   "$NEOFETCHDIR"

        echo -e "\e[0;32m Copy the bin for /usr/bin/\e[0m"
        sudo cp -r `pwd`/files/bin/neofetch       "$NEOFETCHBIN"
        sudo chmod +x "$NEOFETCHBIN"
        echo -e "\n\e[0;32m+------Finished!-------+\e[0m"
    fi
}
install_neofetch
