#!/usr/bin/env bash

OUT=./redmine_omg_essence.css

CUSTOMER_BG=c9ffc9
CUSTOMER_BORDER=40a94c
SOLUTION_BG=ff9
SOLUTION_BORDER=ea7502
ENDEAVOR_BG=c6d9f1
ENDEAVOR_BORDER=4b6ec6

function mkSvg {
  NAME=$1
  SVG=$(svgo --output - ../images/${NAME}.svg | sed 's/width="20"//' | sed 's/height="20"//' | tr -s ' ')
  echo "${SVG}"
}

function mkGeneric {
  NAME=$1
  SVG=$(mkSvg "${NAME}" | base64 --wrap=0)
  cat >> "${OUT}" << EOF
.es.es-${NAME} {
  background-image: url('data:image/svg+xml;base64,${SVG}');
}
EOF
}

function mkColoredSvg {
  NAME=$1
  BG=$2
  BORDER=$3
  SVG=$(mkSvg "${NAME}" | sed "s/\"#f2f2f2\"/\"#${BG}\"/g" | sed "s/\"#6e6e6e\"/\"#${BORDER}\"/g")
  echo "${SVG}"
}

function mkColored {
  NAME=$1
  SUFFIX=$2
  BG=$3
  BORDER=$4
  SVG=$(mkColoredSvg "${NAME}" "${BG}" "${BORDER}" | base64 --wrap=0)
  cat >> "${OUT}" << EOF
.es.es-${NAME}-${SUFFIX} {
  background-image: url('data:image/svg+xml;base64,${SVG}');
}
EOF
}

function mkCss {
  NAME=$1

  echo "process ${NAME}.svg"

  mkGeneric ${NAME}
  mkColored ${NAME} customer ${CUSTOMER_BG} ${CUSTOMER_BORDER}
  mkColored ${NAME} solution ${SOLUTION_BG} ${SOLUTION_BORDER}
  mkColored ${NAME} endeavor ${ENDEAVOR_BG} ${ENDEAVOR_BORDER}
}

cat ./src.css > ${OUT}
mkCss activity
mkCss activity_space
mkCss alpha
mkCss area
mkCss competency
mkCss pattern
mkCss practice
mkCss resource
mkCss state
mkCss work_product

