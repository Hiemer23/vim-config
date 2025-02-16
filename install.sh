#!/bin/bash
# Variáveis
INSTALL_DIR=$(pwd)
echo "Instalando configurações do Vim a partir de: $INSTALL_DIR"

# 1. Criar links simbólicos para o vimrc (e outros arquivos se necessário)
echo "Criando link simbólico para ~/.vimrc..."
ln -sf "$INSTALL_DIR/.vimrc" "$HOME/.vimrc"

# Se você também tiver um diretório com configurações adicionais (ex: .vim), faça:
# ln -sf "$INSTALL_DIR/.vim" "$HOME/.vim"

# 3. Instalar vim-plug, se necessário
VIM_PLUG="$HOME/.vim/autoload/plug.vim"
if [ ! -f "$VIM_PLUG" ]; then
  echo "Instalando vim-plug..."
  mkdir -p "$(dirname "$VIM_PLUG")"
  curl -fLo "$VIM_PLUG" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# 4. Instalar plugins do Vim
echo "Instalando plugins com vim-plug..."
vim +PlugInstall +qall

echo "Instalação do vimrc concluída!"

