ARQ_CONF="configuracao.cf"

MENSAGEM_LEITURA=" 
    \033[31mERRO
    O arquivo de configuração não tem acesso a leitura
"
MENSAGEM_N_EXISTE="
    \033[31mERRO
    O arquivo de configuração não existe, verifique e tente novamente.
"

[ ! -r $ARQ_CONF ] && echo "$MENSAGEM_LEITURA" && exit 0
[ ! -e $ARQ_CONF ] && echo "$MENSAGEM_N_EXISTE" && exit 0

while read -r line
do
    [ "$(echo $line | cut -c1)" = "#" ] && continue
    [ ! "$line" ] && continue

    chave=$( echo $line | cut -d = -f 1 )
    valor=$( echo $line | cut -d = -f 2 )
    echo "FG_$chave=$valor"
done < $ARQ_CONF