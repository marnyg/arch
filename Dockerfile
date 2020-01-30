
FROM archlinux

RUN echo "123" > /passTMP
RUN pacman -Syu --noconfirm
ADD ./baseApps /arch/baseApps
ADD ./pkglist.txt /arch/pkglist.txt
ADD ./docker /arch/docker
RUN ls arch
RUN source /arch/docker && set_timezone_info
RUN pacman --noconfirm -S - < /arch/baseApps
RUN pacman --noconfirm -S - < /arch/pkglist.txt
RUN pacman -S base-devel --noconfirm

RUN ls
ADD ./addUser /arch/addUser
RUN cd arch && ./addUser
RUN sed -i \
        '/auth       include      system-local-login/a auth       optional     pam_gnome_keyring.so' /etc/pam.d/login &&\
    sed -i \
        '/session    include      system-local-login/a session    optional     pam_gnome_keyring.so auto_start' /etc/pam.d/login


USER mar
ADD ./configUser /arch/configUser
RUN /arch/configUser

USER root
RUN cd /home/mar/git/st2 && make install
RUN cd /home/mar/git/dwm2 && make install

USER mar
ADD ./profile /home/mar/.profile
RUN ls

CMD [ "./.profile &&" , "./.xinitrc"]
