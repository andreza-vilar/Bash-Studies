#!/usr/bin/env bash

[[ $# -ne 1 ]] && echo "Digite o nome de apenas um arquivo! Saindo..." &&
exit 1

[[ -f $1 ]] && echo "Arquivo já existe! Saindo..." && exit 1

echo '#!/usr/bin/env bash' >> $1
chmod + x $1
vim $1
