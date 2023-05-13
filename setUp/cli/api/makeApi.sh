#!/bin/bash
projectFolder=$1
projectName=$1
projectDescription="api project"
projectVersion="0.0.1"

mkdir ${projectFolder} ${projectFolder}/src ${projectFolder}/src/routes ${projectFolder}/src/controllers ${projectFolder}/src/middlewares
touch ${projectFolder}/package.json ${projectFolder}/.babelrc ${projectFolder}/.env
touch ${projectFolder}/src/index.js ${projectFolder}/src/api.js

echo "{
  \"name\": \"${projectName}\",
  \"version\": \"${projectVersion}\",
  \"description\": \"${projectDescription}\",
  \"main\": \"src/index.js\",
  \"scripts\": {
    \"start\": \"babel-node src/index.js\",
    \"start:dev\": \"nodemon --exec babel-node src/index.js\"
  },
  \"keywords\": [],
  \"author\": \"\",
  \"license\": \"ISC\",
  \"devDependencies\": {
    \"@babel/cli\": \"^7.18.6\",
    \"@babel/core\": \"^7.18.6\",
    \"@babel/node\": \"^7.18.6\",
    \"@babel/preset-env\": \"^7.18.6\"
  },
  \"dependencies\": {
    \"dotenv\": \"^16.0.1\",
    \"express\": \"^4.18.1\",
    \"helmet\": \"^6.0.0\"
  }
}" >> ${projectFolder}/package.json

echo "{
  \"presets\": [[\"@babel/preset-env\", { \"targets\": { \"node\": true } }]]
}" >> ${projectFolder}/.babelrc

echo "NODE_ENV=development
PORT=3000
" >> ${projectFolder}/.env

echo "import dotenv from \"dotenv\";
import api from \"./api\";

dotenv.config();

const PORT = process.env.PORT || 8080;

api.listen(PORT, async () => {
  const ONE_SEC = 1000;

  await new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log(\`API is running on port \${PORT}\`);
      resolve(true);
    }, ONE_SEC);
  });
});" >> ${projectFolder}/src/index.js

echo "import express from \"express\";
import helmet from \"helmet\";

const api = express();

api.get('/api/', (request, response) => {
  response.status(200).json({
    date: {
      string: new Date().toISOString(),
      timestamp: Date.now(),
      version: \"${projectVersion}\",
      environment: process.env.NODE_ENV
    },
  });
});

api.use(helmet());
api.use(express.json());

/** Rutas raíz de la API */

export default api;
" >> ${projectFolder}/src/api.js

cd ${projectFolder} && npm i &> /dev/null
