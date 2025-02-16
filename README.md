# Meu VimRC

Este repositório contém minha configuração personalizada do Vim, incluindo o meu arquivo `.vimrc` com diversos plugins e um script de instalação que automatiza todo o processo. Com este setup, você terá:

- **NERDTree**: Explorador de arquivos para facilitar a navegação.
- **Gruvbox**: Tema com cores agradáveis.
- **Tagbar**: Navegação por tags e funções do código.
- **vim-indent-guides**: Exibição visual das guias de indentação.
- **vim-airline**: Barra de status aprimorada.
- **vim-buftabline**: Exibição de abas para buffers abertos.

> **Nota:** Sinta-se à vontade para personalizar os plugins e as configurações conforme suas necessidades.

## Como Utilizar

Siga os passos abaixo para instalar e configurar seu Vim com essa configuração:

### 1. Clone o Repositório

Abra o terminal e execute:
```bash
git clone https://github.com/Hiemer23/vim-config.git
```
### 2. Acesse o Diretório Clonado

Entre na pasta do repositório:
```bash
cd vim-config
```

### 3. Execute o Script de Instalação

Torne o script executável e execute-o:
```bash
chmod +x install.sh
./install.sh
```

O script install.sh fará o seguinte:

  * Usará o diretório atual (onde o repositório foi clonado) como base.
  * Criará um link simbólico: O arquivo ~/.vimrc será apontado para o .vimrc deste repositório.
  * Instalará o vim-plug automaticamente (caso não esteja instalado) no diretório ~/.vim/autoload/plug.vim.
  * Instalará os plugins especificados no .vimrc ao executar o comando vim +PlugInstall +qall.

### 4. Atualizar Plugins Futuramente

Para atualizar os plugins instalados, basta abrir o Vim e executar:

```bash
:PlugUpdate
```

### Solução de Problemas

Link Simbólico Existente:
Se já houver um arquivo ~/.vimrc em seu diretório home, remova-o antes de executar o script:

```bash
rm ~/.vimrc
```

### Problemas com o vim-plug:
Certifique-se de ter acesso à internet para que o curl possa baixar o vim-plug corretamente.
