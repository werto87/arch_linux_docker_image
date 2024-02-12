FROM archlinux/archlinux:multilib-devel as BUILD

RUN sudo useradd -m build_user &&\
 sudo echo ' build_user ALL=(ALL)   NOPASSWD:ALL' >> /etc/sudoers
USER build_user
RUN    sudo pacman-key --init
RUN    sudo pacman -Syu --noconfirm
RUN    sudo pacman -S git cmake --noconfirm
WORKDIR /home/build_user
RUN    git clone https://aur.archlinux.org/yay.git
WORKDIR /home/build_user/yay
RUN    makepkg -si --noconfirm --syncdeps
RUN    yay -S conan --noconfirm
