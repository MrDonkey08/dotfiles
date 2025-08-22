#!/usr/bin/env bash

ln -s ~/Drives/github/new-cursos ~/Desktop/new-cursos
ln -s ~/Drives/github/blog ~/Desktop/blog
ln -s ~/Drives/github/blog/_posts ~/Desktop/blog/_posts

ln -s ~/Drives/github/escuela ~/Desktop/escuela
ln -s ~/Drives/github/escuela/4to ~/Desktop/4to
ln -s ~/Drives/github/escuela/5to ~/Desktop/5to
ln -s ~/Drives/github/escuela/6to ~/Desktop/6to

ln -s ~/Drives/google/Recursos/ ~/Desktop/recursos
ln -s ~/Drives/google/Classroom/ ~/Desktop/classroom
ln -s ~/Drives/google/Classroom/4to ~/Desktop/drive-4to
ln -s ~/Drives/google/Classroom/5to ~/Desktop/drive-5to
ln -s ~/Drives/google/Classroom/6to ~/Desktop/drive-6to

sudo su

ln -s /opt/lampp/htdocs /home/donkey/htdocs

# Root User

ln -s /home/donkey/.config/ /root/.
ln -s /home/donkey.zshenv /root/.
ln -s /home/donkey/powerlevel10k/ /root/.
ls -s /home/donkey/.p10k.zsh /root/.
ls -s /home/donkey/.cargo/ /root/.
