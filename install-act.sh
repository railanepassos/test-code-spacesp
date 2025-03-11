#!/bin/bash

# Atualiza o sistema e instala dependências
sudo apt update && sudo apt install -y curl jq

# Baixa a versão mais recente do 'act' diretamente do GitHub
ACT_VERSION="v0.2.0"
ACT_URL="https://github.com/nektos/act/releases/download/$ACT_VERSION/act_Linux_x86_64.tar.gz"

# Baixa o arquivo tar.gz
echo "Baixando o $ACT_URL"
curl -Lo act.tar.gz $ACT_URL

# Verifica se o download foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "Erro ao baixar o arquivo. Verifique o link de download."
    exit 1
fi

# Descompacta o arquivo
tar -xvzf act.tar.gz

# Verifica se o binário 'act' foi extraído com sucesso
if [ ! -f act ]; then
    echo "Erro ao extrair o arquivo. Verifique o conteúdo."
    exit 1
fi

# Move o binário para o diretório correto
sudo mv act /usr/local/bin/

# Verifica se o 'act' foi instalado corretamente
act --version
