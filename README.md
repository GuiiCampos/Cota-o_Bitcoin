# BTC Cotação Script
Este script exibe a cotação atual do Bitcoin em USD ou BRL, conforme definido em um arquivo de configuração. Ele utiliza outros dois arquivos auxiliares: um arquivo de configuração e um script de parsing.

## Arquivos do Projeto
btcCotacao.sh: O script principal que obtém e exibe a cotação do Bitcoin.
parse.sh: Um arquivo genérico utilizado para tratar e formatar os dados de saída.
configuracao.cf: Arquivo de configuração onde você define qual moeda será exibida (USD ou BRL).
## Funcionamento
O script verifica se o programa figlet está instalado para exibir a cotação em um formato estilizado. Se não estiver instalado, o script pergunta ao usuário se deseja instalá-lo.
O arquivo configuracao.cf determina se a cotação exibida será em BTC/USD ou BTC/BRL.
O arquivo parse.sh é usado para tratamento genérico de dados de saída.
