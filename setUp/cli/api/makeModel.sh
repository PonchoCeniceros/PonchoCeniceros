projectFolder=$1
model=$2
modelName=$3

touch ${projectFolder}/src/models/${modelName}.js

echo "import db from \"../database/db\";
import Sequelize, { Model } from "sequelize";

/**
 * Intancia del modelo
 */
class ${model} extends Model {};

/**
 * Campos o atributos del modelo
 */
const attributes = {
  ${modelName}Id: {
    type: Sequelize.DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
};

/**
 * Configuración del modelo
 */
const options = {
  sequelize: db,
  modelName: \"${model}\",
};

/**
 * Inicializar modelo
 */
${model}.init(attributes, options);

/** asociaciones */

export default ${model};" >> ${projectFolder}/src/models/${modelName}.js
