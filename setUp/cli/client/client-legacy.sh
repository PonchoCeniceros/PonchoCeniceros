client=$1
srcDir=${client}/src

echo "instalando react"
npx create-react-app ${client} &> /dev/null
echo "instalando tailwind"
cd ${client}
npm install -D tailwindcss postcss autoprefixer &> /dev/null
npx tailwindcss init -p &> /dev/null

echo "creando ficheros"
cd ../
rm -f ${srcDir}/App.css
rm -f ${srcDir}/App.js
rm -f ${srcDir}/App.test.js
rm -f ${srcDir}/index.css
rm -f ${srcDir}/index.js
rm -f ${srcDir}/logo.svg
rm -f ${srcDir}/reportWebVitals.js
rm -f ${srcDir}/setupTests.js
touch ${srcDir}/index.js

touch ${client}/jsconfig.json
echo "{" >> ${client}/jsconfig.json
sed -i '' 's/{/{"compilerOptions": {"baseUrl": "src", "paths": {"*": ["src\/*"]}}}/' ./${client}/jsconfig.json

mkdir ${srcDir}/assets
mkdir ${srcDir}/assets/styles
touch ${srcDir}/assets/styles/index.css
touch ${srcDir}/assets/styles/layout.css
rm -f ${client}/tailwind.config.js
touch ${client}/tailwind.config.js
echo "{content['tailwind_config']}" >> ${client}/tailwind.config.js
echo "{content['index_css']}" >> ${srcDir}/assets/styles/index.css
mkdir ${srcDir}/components && touch ${srcDir}/components/.keep
mkdir ${srcDir}/hooks && touch ${srcDir}/hooks/.keep
mkdir ${srcDir}/helpers && touch ${srcDir}/helpers/.keep

mkdir ${srcDir}/views
mkdir ${srcDir}/views/modals && touch ${srcDir}/views/modals/.keep
mkdir ${srcDir}/views/pages && touch ${srcDir}/views/pages/.keep
touch ${srcDir}/views/app.js
echo "{content['app']}" >> ${srcDir}/views/app.js

cd ${client}
# pwd
# sudo rm -d -r .git
git init --initial-branch=develop &> /dev/null
