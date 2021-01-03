FROM archlinux:base-devel

RUN pacman -Syu --noconfirm git xorg-server emacs

RUN git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
RUN ~/.emacs.d/bin/doom -y install

CMD emacs