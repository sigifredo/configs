# Configurar repositorios de git

## Configurar prettier

```console
me@land:~$ npm i prettier husky eslint
```

Agrega al archivo **package.json** lo siguiente:

```json
"scripts": {
    ...
},
"lint-staged": {
    "{,**/}*.{md,json,html,js,ts,scss,java,vue}": "prettier --write",
    "*.{js,css,md}": "prettier --write",
    "*.js": "eslint --cache --fix"
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