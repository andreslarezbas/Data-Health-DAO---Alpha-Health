Pasos para tener tu despliegue de DATA HEALTH DAO. Basado en ARAGON + 3box + AlphaHelathSurvey.sol 


Primero debes instalar el cliente de Aragon.

`npm install -g @aragon/cli`

`git clone https://github.com/andreslarezbas/Data-Health-DAO---Alpha-Health.git`

cd src || cd node_modules

Descarga y descomprime los archivos ubicados en las carpetas node_modules/node.txt (url de drive) y src/src.txt (url de drive)

Luego debes correr de forma local el nodo "IPFS" y la blockchain local "devchain" 

`sudo aragon ipfs start`

`sudo aragon devchain` 

Despliega tu propio DAO

`dao new`

Despliega el token de mebresia 

`dao token new "Alpha-Member" "AMBR" 0`

Instala el manager de dicho token

`dao install <dao-address> token-manager --app-init none`

Setea el manager en tu token de mebresia

`dao token change-controller <token-address> <token-manager-address>`

Sumale los permisos necesarios

`dao acl create <dao-address> <token-manager-address> MINT_ROLE <your-address> <your-address>`

`dao exec <dao-address> <token-manager-address> initialize [token-address] false 1`
  
Agrega la instancia de votacion

`dao install <dao-address> voting --app-init-args [token-address] 600000000000000000 250000000000000000 604800`

`dao acl create <dao-address> <voting-app-address> CREATE_VOTES_ROLE <token-manager-address> <voting-app-address>`

Agrega el Vault de finanzas

`dao install <dao-address> vault`

`dao install <dao-address> finance --app-init-args [vault-address] 2592000`

crea y agrega los permisos al vault. (Solo por medio de votacion pueden ser tranferidos los tokens)

`dao acl create <dao-address> <vault-address> TRANSFER_ROLE <finance-address> <voting-address>`

`dao acl create <dao-address> <finance-address> CREATE_PAYMENTS_ROLE <voting-address> <voting-address>`

`dao acl create <dao-address> <finance-address> EXECUTE_PAYMENTS_ROLE <voting-address> <voting-address>`

`dao acl create <dao-address> <finance-address> MANAGE_PAYMENTS_ROLE <voting-address> <voting-address>`


Despliega el token Reward NFT
  
`dao token new "Alpha-NFT-Reward" "ANFT" 0`

Instala el manager de dicho token

`dao install <dao-address> token-manager --app-init none`

Setea el manager en tu token de mebresia

`dao token change-controller <token-address> <token-manager-address>`

Sumale los permisos necesarios

`dao acl create <dao-address> <token-manager-address> MINT_ROLE <your-address> <your-address>`

`dao exec <dao-address> <token-manager-address> initialize [token-address] false 0`   

Compila via REMIX (https://remix.ethereum.org) el Archivo : AlphaHealthSurvey.sol Usando: 0xb4124cEB3451635DAcedd11767f004d8a28c6eE7 desde metamask (default en `aragon devchain` ahi encontraras el PrivateKey)

Busca el archivo AlphaCovidSurvey.js y remplaza el address del contrato por el que te arroje la compilacion de REMIX (no olvides hacerlo en localhost:8545 (o donde tengas el devchain corriendo))

No olvides setear tu perfil de usuario/organizacion en

3box.io/hub

LISTO.

`cd Data-Health-DAO---Alpha-Health`

`sudo yarn start:local `

Disfruta, aprende, construye <3
