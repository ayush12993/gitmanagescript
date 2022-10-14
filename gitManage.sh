#!/bin/bash
checkgitUseremail(){
    git config --global user.email 2>&1 >/dev/null # improvement by tripleee
GITUSERNAME_IS_AVAILABLE=$?
# ...
if [ $GITUSERNAME_IS_AVAILABLE -eq 0 ]; 
then
echo "email is $GITUSERNAME_IS_AVAILABLE"
else
read -p "Enter your git email 
 " useremail
 git config --global user.email "$useremail"
 fi
}

checkgitUsername(){
    git config --global user.name 2>&1 >/dev/null # improvement by tripleee
GITUSERNAME_IS_AVAILABLE=$?
# ...
if [ $GITUSERNAME_IS_AVAILABLE -eq 0 ]; 
then
echo "username is $GITUSERNAME_IS_AVAILABLE"
else
read -p "Enter your git username
 " useremail
 git config --global user.name "$useremail"
 fi
}


newmaster(){
echo 'Checking & Making sure git already installed'
git --version 2>&1 >/dev/null # improvement by tripleee
GIT_IS_AVAILABLE=$?
# ...
if [ $GIT_IS_AVAILABLE -eq 0 ]; 
then
echo "git is installed"
echo "We are checking whether you have configured git username and email "
sleep 4
checkgitUsername
checkgitUseremail
git init
 read -p "pass the git url to push the codebase to git -: 
 " giturl
git remote add origin $giturl

git add .
read -p "pass your commit message -: -a 
 " comtms
 git commit -m "$comtms"

 git push -u origin master

 else
    echo "Please install the github "
fi
# if condition 
# then
    
# fi
echo 'checking whether git is installed or not'



}
read -p "Enter option to choose one- " VAR
case $VAR in
     0)  ;;
    1) echo "Push your code to repo"
    newmaster
    ;;
    2) rm -rf .git
    ;;
    *) echo default
    ;;
esac
