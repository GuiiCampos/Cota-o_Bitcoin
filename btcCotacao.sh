#!/usr/bin/env bash

# btcCotação - traz a cotação do bitcoin em real ou dolar.

# GitHub:           https://github.com/GuiiCampos

# Autor:            Guilherme Campos

# Manutenção:       Guilherme Campos

# ------------------------------------------------------------------------ #

# Esse script pega a cotação em tempo real do bitcoin, em dolar ou real, através do html do google finance.

#  Exemplos:
#      $ ./btcCotacao.sh -h

#      Como funciona o programa.

# ------------------------------------------------------------------------ #

# Histórico:
#
#   v1.0 22/10/2024, Guilherme Campos:

#       - Início do programa

# ------------------------------------------------------------------------ #

# Testado em:

#   bash 5.2.21

# ------------------------------- TESTES ----------------------------------------- #
if [[ ! -x "$(which figlet)" ]]
then
    read -p "O figlet não está instalado. Gostaria de instalar agora? (s/n): " resposta
    if [[ "$resposta" == "s" || "$resposta" == "S" ]]; then
        sudo apt-get install figlet
    else
        echo "Figlet não será instalado. Saindo..."
        exit 1
    fi
fi
# ------------------------------- VARIÁVEIS ----------------------------------------- #

HELP="
 -h - help
 
 Esse programa é baseado em um arquivo de configuração, caso queria mudar a exibição basta alterar os valores no arquivo
"

ARQ_CONF="configuracao.cf"
MENSAGEM="$(figlet "bitcoin")"

# ------------------------------- EXECUÇÃO ----------------------------------------- #
case "$1" in
    -h) echo "$HELP" && exit 0  ;;
esac

eval $( ./parse.sh $ARQ_CONF)
echo "$MENSAGEM"
[ "$(echo $FG_BTC_BRL)" = "1" ] && echo "BTC PARA REAL: $(lynx -source https://www.google.com/finance/quote/BTC-BRL | grep -o '"YMlKec fxKbKc">[0-9,.]*' | sed 's/".*>//')"
[ "$(echo $FG_BTC_USD)" = "1" ] && echo "BTC PARA DOLAR: $(lynx -source https://www.google.com/finance/quote/BTC-USD | grep -o '"YMlKec fxKbKc">[0-9,.]*' | sed 's/".*>//')"