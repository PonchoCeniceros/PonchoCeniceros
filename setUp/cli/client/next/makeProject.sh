#!/bin/bash
appName=$1
npx create-next-app@13.3.0 $appName --js --use-npm --src-dir --eslint --tailwind --no-experimental-app --import-alias "@/*" &> /dev/null
cd ./$appName
npm i -D eslint-plugin-storybook @storybook/addon-styling postcss-loader &> /dev/null
npx storybook@next init &> /dev/null
cd ..
