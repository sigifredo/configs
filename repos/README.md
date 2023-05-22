# Configurar repositorios de git

## Configurar prettier

```console
me@land:~$ npm i -D prettier husky eslint
```

Agrega al archivo **package.json** lo siguiente:

```json
"scripts": {
    ...
    "prettier": "prettier --write \"{,**/}*.{md,json,html,js,ts,scss,java}\"",
},
"lint-staged": {
    "{,**/}*.{md,json,html,js,ts,scss,java,vue}": "prettier --write",
    "*.{js,css,md}": "prettier --write",
},
"dependencies": {
    ...
},
```

Agrega a la raiz del proyecto los archivos:

* .prettierignore
* .prettierrc

Finalmente, ejecuta el siguiente comando:

```console
me@land:~$ npx mrm lint-staged
```
