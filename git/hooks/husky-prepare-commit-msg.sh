#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

MSG_FILE="$1"
SOURCE="${2-}"

# No tocar si el mensaje viene con -m/-F o si es merge/squash
case "$SOURCE" in
  message|commit|merge|squash) exit 0 ;;
esac

# 1) Usa GIT_PREFIX que Git expone a los hooks si el commit se lanzó desde una subcarpeta
prefix="${GIT_PREFIX-}"

# 2) Fallback por si tu Git no la setea: calcula a partir de PWD vs toplevel
if [ -z "$prefix" ]; then
  toplevel="$(git rev-parse --show-toplevel)"
  cwd="$PWD"
  case "$cwd/" in
    "$toplevel/"*) prefix="${cwd#"$toplevel"/}/" ;;
    *) prefix="$(git rev-parse --show-prefix)" ;; # último intento
  esac
fi

# En raíz -> no pre-cargar nada
[ -z "$prefix" ] && exit 0

# Quita la barra final
rel="${prefix%/}"

# Evitar duplicados (p.ej. --amend)
first_line="$(sed -n '1p' "$MSG_FILE" 2>/dev/null || true)"
[ "$first_line" = "$rel" ] && exit 0

# Prepend la ruta + línea en blanco
tmp="${MSG_FILE}.tmp"
{ printf "%s\n\n" "$rel"; cat "$MSG_FILE"; } > "$tmp" && mv "$tmp" "$MSG_FILE"
