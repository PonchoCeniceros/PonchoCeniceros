projectFolder=$1
name=$2

touch ${projectFolder}/src/controllers/${name}.js
touch ${projectFolder}/src/routes/${name}.js

echo "import { Router } from \"express\";

const ${name}Routes = new Router();

/**
 * Middlewares de la ruta
 */


/**
 * Endpoints de la ruta
 */


export default ${name}Routes;" >> ${projectFolder}/src/routes/${name}.js

echo "export {};" >> ${projectFolder}/src/controllers/${name}.js

base1="import express from \"express\";"
object1="import ${name}Routes from \".\/routes\/${name}\";"
sed -i "" "s/${base1}/${base1}\n${object1}/" ${projectFolder}/src/api.js

base2="\/\*\* Rutas raíz de la API \*\/"
object2="api.use(\"\/${name}\/\", ${name}Routes);"
sed -i "" "s/${base2}/${base2}\n${object2}/" ${projectFolder}/src/api.js
