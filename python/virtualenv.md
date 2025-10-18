# Tutorial Rápido: Crear Entorno Virtual con virtualenv en Debian

## 1. Instalar virtualenv (si no está instalado)

Se instalará la herramienta `virtualenv` desde `pip`:

```bash
pip install virtualenv
```

## 2. Crear el Entorno Virtual

Para creaer un entorno virtual basado en una versión específica de python:

```bash
python -m virtualenv -p /usr/bin/python3.11 venv
```

## 3. Activar el Entorno Virtual

Para activar el nuevo entorno:

```bash
source venv/bin/activate
```

## 4. Desactivar el Entorno

Para desactivar el entorno y volver al shell principal:

```bash
deactivate
```
