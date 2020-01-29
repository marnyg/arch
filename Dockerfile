
FROM archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S git --noconfirm
RUN git clone https://github.com/marnyg/arch.git
RUN echo "123" > /passTMP
RUN ls arch
RUN cd arch && git checkout docker
RUN source /arch/docker && set_timezone_info && set_hostname_info
RUN source /arch/docker && cd arch && install_personal_software_1
RUN source /arch/docker && cd arch && install_personal_software_2
RUN source /arch/docker && create_main_user
RUN source /arch/docker && start_gnome_keyring_at_login

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
CMD /dwm2/dwm
