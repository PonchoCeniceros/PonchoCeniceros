projectFolder=$1

mkdir ${projectFolder}/src/database/
mkdir ${projectFolder}/src/models/
touch ${projectFolder}/src/database/db.js

echo "import Sequelize from \"sequelize\";
import dotenv from \"dotenv\";

dotenv.config();

/**
 * instancia del ORM conectado a la DB
 */
const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PSWR, {
  host: process.env.DB_HOST,
  dialect: \"mysql\",
  logging: false,
});

export default db;" >> ${projectFolder}/src/database/db.js
