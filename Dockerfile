
FROM archlinux

RUN echo "123" > /passTMP
RUN pacman -Syu --noconfirm
RUN pacman -S git --noconfirm
run git clone https://github.com/marnyg/arch
run ls arch
run cd arch && git checkout docker
run ls arch
RUN source /arch/docker && set_timezone_info
RUN source /arch/docker && cd arch && install_personal_software_2
RUN source /arch/docker && cd arch && install_personal_software_1
run pacman -S base-devel --noconfirm


run ls
add . /arch2
RUN cd arch2 && source ./docker && create_main_user
###run useradd -mg users -p 123 -G wheel,storage,power -s /bin/bash mar
#RUN /arch/configUser
RUN source /arch2/docker && start_gnome_keyring_at_login

# Replace 1000 with your user / group id
#RUN export uid=1000 gid=1000 && \
    #mkdir -p /home/developer && \
    #echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    #echo "developer:x:${uid}:" >> /etc/group && \
    #echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    #chmod 0440 /etc/sudoers.d/developer && \
    #chown ${uid}:${gid} -R /home/developer

USER mar
run /arch2/configUser

USER root
run cd /home/mar/git/st2 && make install
run cd /home/mar/git/dwm2 && make install
#run cp /home/mar/.xinitrc /usr/bin/docker-init


user mar
cmd /usr/local/bin/dwm
