#!/bin/bash
appName=$1

rm -f ./$appName/src/styles/globals.css
echo "@tailwind base;
@tailwind components;
@tailwind utilities;
" >> ./$appName/src/styles/globals.css

touch ./$appName/src/styles/theme.js
echo "module.exports = {
  screens: {
  /**
   * Responsive
   *
   * sm	 640px  for mobile (default)
   * md	 768px	 for tablets
   * lg	 1024px for laptops
   * xl	 1280px for desktop screens
   * 2xl	1536px for TV screens
   */
  },
  colors: {
    /* Marisol Light Theme */
    msol1l: '#D9B0BF',
    msol2l: '#393073',
    msol3l: '#A3A5D9',
    msol4l: '#89B3D9',
    msol5l: '#F0F2F2',

    /* Marisol Dark Theme */
    msol1d: '#D9436B',
    msol2d: '#BF457E',
    msol3d: '#2B448C',
    msol4d: '#0B368C',
    msol5d: '#082359',
  },
};
" >> ./$appName/src/styles/theme.js

rm -f ./$appName/tailwind.config.js
echo "/** @type {import('tailwindcss').Config} */

const {
  colors,
  screens
} = require(\"./src/styles/theme\");

module.exports = {
  content: [
    \"./src/**/*.{js,ts,jsx,tsx}\",
  ],
  theme: {
    extend: {
      colors,
      screens,
    },
  },
  plugins: [],
};
" >> ./$appName/tailwind.config.js
