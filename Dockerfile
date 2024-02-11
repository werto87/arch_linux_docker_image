FROM archlinux/archlinux:multilib-devel as BUILD

RUN sudo useradd -m build_user &&\
 sudo echo ' build_user ALL=(ALL)   NOPASSWD:ALL' >> /etc/sudoers
USER build_user
RUN sudo pacman-key --init &&\
    sudo pacman -Syu &&\
    sudo pacman -S git cmake --noconfirm &&\
    cd /home/build_user &&\
    git clone https://aur.archlinux.org/yay.git &&\
    cd yay && \
    makepkg -si --noconfirm --syncdeps &&\
    yay -S conan --noconfirm
