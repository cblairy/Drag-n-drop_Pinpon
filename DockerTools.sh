#!/bin/bash
declare -a vol_src;
declare -a vol_trg;
################################################################################
#@                                Configurations
################################################################################

#* Distro
dtr_name="node:lts-alpine";  #* Distro name (FROM node:lts-alpine)

#* Image
img_name="my_react_node";  #* Image name (teambuilder_node)
img_ver="lts-alpine";  #* Image version (lts-alpine)

#* Container
ctn_name="my_react_ctn";  #* Container name (teambuilder_ctn)

#* Publish To
host_ip="127.0.0.1";  #* Host IP (127.0.0.1 or localhost)
host_port="80";  #* Docker host port (80)       http://localhost:80
ctn_port="3000";  #* Container port (8080)      Exposed 8080 (http-server)

#* Volume(s) binding (none: Production Version)
vol_src+=("/app");  #* Local/Windows directory (/folder_in_project_directory)
vol_trg+=("/app");  #* Container directory (/path/to/container/folder)

# vol_src+=("/src");  #* Local/Windows directory (/folder_in_project_directory)
# vol_trg+=("/trg");  #* Container directory (/path/to/container/folder)

################################################################################
#@                                   Functions
################################################################################

askyesno () {
    local answer="";

    echo -e -n "\033[0;31m"; echo -n "$1 [y/n] ?"; echo -e -n "\033[0m";
    while [ "${answer,,}" != "y" ] && [ "${answer,,}" != "n" ]; do
        read -n1 -s answer;
    done
    echo "";

    if [ "${answer,,}" = "y" ]; then
        return 0;  # It's true
    fi

    return 1;  # It's false
}

#------------------------------------------------------------

pause () {
    echo -e "\033[1;32m";
    read -p "Press any key to continue..." -n1 -s;
    echo -e "\033[0m";
}

#------------------------------------------------------------

shwCfgInfo () {
    echo -e "\n---- Configuration Informations ----";
    echo -e "Distro    : \033[1;34m$dtr_name\033[0m";
    echo -e "Image     : \033[1;34m$img\033[0m";
    echo -e "Container : \033[1;34m$ctn_name\033[0m";
    echo -e "Publish   : \033[1;34m$publish\033[0m";
    echo -e "Volume(s) : \033[1;34m${#vol_src[@]}\033[0m";
    for i in "${!vol_src[@]}"; do
        echo -e "    [\033[0;33m$i\033[0m]:";
        echo -e "        Source: \033[1;32m$(pwd)${vol_src[$i]}\033[0m";
        echo -e "        Target: \033[1;32m${vol_trg[$i]}\033[0m\n";
    done
}

################################################################################
#@                                Docker Commands
################################################################################
# cmdBuild ()   #* Build Image
# cmdRun ()     #* Create Container
# cmdShwImg ()  #* Show Images List
# cmdShwCtn ()  #* show Running Containers List
# cmdStop ()    #* Stop Container
# cmdRmCtn ()   #* Remove Container
# cmdRmImg ()   #* Remove Image
# cmdStartD ()  #* Start Detached Container
# cmdStartI ()  #* Start Interactive Container
# cmdShell ()   #* Open Container Shell
#------------------------------------------------------------

cmdBuild () {
    local cmd="docker build -t $img .";  #* Build Image
    echo -e "\n---- Building Image ----";
    echo -e "CMD: \033[1;35m$cmd\033[0m";
    $cmd;
}

cmdRun () {
    local cmd="docker run -d --name $ctn_name -p $publish$vols $img";  #* Create Container
    echo -e "\n---- Creating Container ----";
    echo -e "CMD: \033[1;35m$cmd\033[0m";
    $cmd;
}

cmdShwImg () {
    local cmd="docker images";  #* Show Images List
    echo -e "\n---- Images List ----";
    echo -e "CMD: \033[1;35m$cmd\033[0m";
    $cmd;
}

cmdShwCtn () {
    local cmd="docker ps";  #* show Running Containers List
    echo -e "\n---- Running Containers List ----";
    echo -e "CMD: \033[1;35m$cmd\033[0m";
    $cmd;
}

cmdStop () {
    local cmd="docker stop $ctn_name";  #* Stop Container
    echo -e "\n---- Stopping Container ----";
    echo -e "CMD: \033[1;35m$cmd\033[0m";
    $cmd;
}

cmdRmCtn () {
    local cmd="docker rm $ctn_name";  #* Remove Container
    echo -e "\n---- Removing Container ----";
    echo -e "CMD: \033[1;35m$cmd\033[0m";
    $cmd;
}

cmdRmImg () {
    local cmd="docker rmi $img";  #* Remove Image
    echo -e "\n---- Removing Image ----";
    echo -e "CMD: \033[1;35m$cmd\033[0m";
    $cmd;
}

cmdStartD () {
    local cmd="docker start $ctn_name";  #* Start Detached Container
    echo -e "\n---- Starting Detached Container ----";
    echo -e "CMD: \033[1;35m$cmd\033[0m";
    $cmd;
}

cmdStartI () {
    local cmd="docker start -i $ctn_name";  #* Start Interactive Container
    echo -e "\n---- Starting Interactive Container ----";
    echo -e "CMD: \033[1;35m$cmd\033[0m";
    $cmd;
}

cmdShell () {
    local cmd="docker exec -it $ctn_name /bin/sh";  #* Open Container Shell
    echo -e "\n---- Opening Container Shell ----";
    echo -e "CMD: \033[1;35m$cmd\033[0m";
    $cmd;
}

################################################################################
#@                                     Main
################################################################################

# Useful global variables
img="$img_name:$img_ver";

publish="$host_ip:$host_port:$ctn_port";

vols="";
for i in "${!vol_src[@]}"; do
    vols="$vols -v $(pwd)${vol_src[$i]}:${vol_trg[$i]}";
done

################################################################################

# Main menu
choice="";
while [ "$choice" != "q" ]; do

    clear;
    shwCfgInfo;
    echo -e -n "\033[1;36m";
    echo "-------- MENU --------";
    echo "(C) - Create";
    echo "(R) - Remove";
    echo "(D) - Start detached";
    echo "(I) - Start interactive";
    echo "(S) - Stop";
    echo "(H) - Shell";
    echo "(Q) - Quit";
    echo "----------------------";
    echo -e -n "\033[0m";

    read -n1 -s choice; echo "";

    if [ "$choice" = "c" ]; then

        #! Create
        echo -e -n "\033[0;31m"; echo -n "Create"; echo -e "\033[0m";
        cmdBuild;
        cmdRun;
        cmdShwImg;
        cmdShwCtn;
        pause;

    elif [ "$choice" = "r" ]; then

        #! Remove
        echo -e -n "\033[0;31m"; echo -n "Remove"; echo -e "\033[0m";
        cmdStop;
        cmdRmCtn;
        cmdRmImg;
        cmdShwImg;
        cmdShwCtn;
        pause;

    elif [ "$choice" = "d" ]; then

        #! Start detached
        echo -e -n "\033[0;31m"; echo -n "Start detached"; echo -e "\033[0m";
        cmdStartD;
        pause;

    elif [ "$choice" = "i" ]; then

        #! Start interactive
        echo -e -n "\033[0;31m"; echo -n "Start interactive"; echo -e "\033[0m";
        cmdStartI;
        pause;

    elif [ "$choice" = "s" ]; then

        #! Stop
        echo -e -n "\033[0;31m"; echo -n "Stop"; echo -e "\033[0m";
        cmdStop;
        pause;

    elif [ "$choice" = "h" ]; then

        #! Shell
        echo -e -n "\033[0;31m"; echo -n "Shell"; echo -e "\033[0m";
        cmdShell;
        pause;

    elif [ "$choice" = "q" ]; then

        #! Quit
        choice="";
        if askyesno "Are you sure you want to quit" ; then
            choice="q";
        fi
    fi
done

clear;

################################################################################
################################################################################
################################################################################
exit 0
