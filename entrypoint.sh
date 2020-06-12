#!/bin/sh -l

set -e

/usr/local/bin/php-cs-fixer --version

IFS='
 '
 CHANGED_FILES=$(git diff --name-only --diff-filter=ACMRTUXB "${COMMIT_RANGE}")
 if ! echo "${CHANGED_FILES}" | grep -qE "^(\\.php_cs(\\.dist)?|composer\\.lock)$"; then EXTRA_ARGS=$(printf -- '--path-mode=intersection\n--\n%s' "${CHANGED_FILES}"); else EXTRA_ARGS=''; fi
 /usr/local/bin/php-cs-fixer fix -v ${EXTRA_ARGS}
