# Variáveis de configuração
$repoUrl   = "https://github.com/Hiemer23/vim-config.git"
$configDir = "$HOME\vim-config"   # Onde o repositório será clonado
$vimfiles  = "$HOME\vimfiles"     # Diretório equivalente a ~/.vim no Linux
$vimrcLink = "$HOME\_vimrc"        # Arquivo de configuração que o Vim usará
$configVimrc = "$configDir\_vimrc" # Arquivo _vimrc dentro do repositório

# 1. Clonar o repositório se ele ainda não existir
if (-not (Test-Path $configDir)) {
    Write-Host "Clonando repositório do GitHub..."
    git clone $repoUrl $configDir
} else {
    Write-Host "Repositório já clonado. Atualizando..."
    Push-Location $configDir
    git pull
    Pop-Location
}

# 2. Criar os diretórios necessários para o Vim
# Diretório "vimfiles" e seus subdiretórios "autoload" e "plugin"
if (-not (Test-Path $vimfiles)) {
    New-Item -ItemType Directory -Path $vimfiles -Force | Out-Null
}
$autoloadDir = Join-Path $vimfiles "autoload"
$pluggedDir  = Join-Path $vimfiles "plugin"
if (-not (Test-Path $autoloadDir)) {
    New-Item -ItemType Directory -Path $autoloadDir -Force | Out-Null
}
if (-not (Test-Path $pluggedDir)) {
    New-Item -ItemType Directory -Path $pluggedDir -Force | Out-Null
}

# 3. Criar ou atualizar o link simbólico para o _vimrc
if (Test-Path $vimrcLink) {
    Write-Host "Removendo link ou arquivo existente em $vimrcLink"
    Remove-Item $vimrcLink -Force
}
Write-Host "Criando link simbólico para o _vimrc do repositório..."
New-Item -ItemType SymbolicLink -Path $vimrcLink -Target $configVimrc

# 4. Baixar o vim-plug para o diretório autoload
$plugUrl    = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
$plugTarget = Join-Path $autoloadDir "plug.vim"
Write-Host "Baixando o vim-plug..."
Invoke-WebRequest -Uri $plugUrl -OutFile $plugTarget

# 5. Instalar os plugins utilizando o vim-plug
# Isso pressupõe que o comando "vim" está no PATH.
Write-Host "Instalando plugins no Vim..."
vim +PlugInstall +qall

Write-Host "Instalação concluída!"
