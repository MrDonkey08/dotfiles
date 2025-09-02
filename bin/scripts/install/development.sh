#!/usr/bin/env bash

sudo pacman -Syu --needed --noconfirm

# Git

sudo pacman -S --needed --noconfirm \
	git \
	git-lfs

paru -S git-open

## GitHub

### GitHub Pages

#npm install --save-dev --save-exact prettier @shopify/prettier-plugin-liquid
# gem install jekyll bundler

# Languages

## Databases

# sudo pacman -S --needed --noconfirm \
# 	dbeaver

# Xampp
sudo pacman -S --needed --noconfirm \
	libxcrypt-compat \
	net-tools \
	inetutils

# Postgresql
sudo pacman -S --needed --noconfirm \
	postgresql

## Debuggers
sudo pacman -S --needed --noconfirm \
	gdb \
	strace

## Programming

### Compiled

# Arduino
sudo pacman -S --needed --noconfirm \
	arduino-cli

paru -S --needed --noconfirm \
	arduino-ide

# Assembly
sudo pacman -S --needed --noconfirm \
	dosbox \
	nasm

# C/C++
sudo pacman -S --needed --noconfirm \
	clang \
	gcc

# Go
sudo pacman -S --needed --noconfirm \
	go

# Java
sudo pacman -S --needed --noconfirm \
	jdk-openjdk
# Rust
if command -v cargo >/dev/null 2>&1; then
	rustup self update && rustup update
else
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

### Interpreted

# JS
sudo pacman -S --needed --noconfirm \
	deno \
	nodejs-lts-jod

# Lua
sudo pacman -S --needed --noconfirm \
	lua \
	lua51

# PHP
sudo pacman -S --needed --noconfirm \
	php \
	composer

# Python
sudo pacman -S --needed --noconfirm \
	python \
	python3 \
	python-pip

# Python Packages
sudo pacman -S --needed --noconfirm \
	tk \
	python-pandas \
	python-numpy \
	python-sympy \
	python-pytorch \
	python-scikit-learn \
	jupyterlab \
	python-pdftotext

paru -S --needed --noconfirm \
	python-bitvector

# Ruby
sudo pacman -S --needed --noconfirm \
	ruby

# Text Editors

## Docs
sudo pacman -S --needed --noconfirm \
	obsidian

sudo pacman -S --needed --noconfirm \
	texlive \
	texlive-langenglish \
	texlive-langspanish

# Execute to install langs interactively
# sudo pacman -S \
# 	texlive-lang

## IDEs

### Terminal IDEs
sudo pacman -S --needed --noconfirm \
	nano \
	vi \
	vim \
	neovim

### Graphical IDEs
# Vscode
sudo pacman -S --needed --noconfirm \
	code

# Vscodium
paru -S vscodium-bin

## Office Docs

sudo pacman -S --needed --noconfirm \
	libreoffice-still \
	libreoffice-still-es \
	libreoffice-extension-writer2latex

sudo pacman -S --needed --noconfirm \
	zathura \
	zathura-pdf-mupdf

# A office, ebook, md... reader that uses zathura
paru -S zaread-git

## Tools

### Linters, Formatters, Parsers...
sudo pacman -S --needed --noconfirm \
	biome \
	prettier \
	shfmt

sudo npm install -g purgecss

sudo pacman -S --needed --noconfirm \
	markdownlint \
	markdownlint-cli2 \
	markdown-toc

sudo pacman -S --needed --noconfirm \
	tree-sitter \
	tree-sitter-cli \
	tree-sitter-grammars
