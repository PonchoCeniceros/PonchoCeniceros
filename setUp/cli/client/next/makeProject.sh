#!/bin/bash
appName=$1
npx create-next-app@13.3.0 $appName --js --use-npm --src-dir --eslint --tailwind --no-experimental-app --import-alias "@/*" &> /dev/null
cd ./$appName
npm i -D eslint-plugin-storybook @storybook/addon-styling postcss-loader storybook@7.0.12 &> /dev/null
npx storybook init &> /dev/null
cd ..
