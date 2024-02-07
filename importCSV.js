const fs = require('fs');
const parse = require('csv-parser');
const { Bill } = require('./models/models'); // Замените путь на путь к вашим моделям
const sequelize = require('./db');

const csvFilePath = 'C:\\Users\\user\\Desktop\\course\\projects\\worldskills__proj__2\\backend\\csv_files\\service_usages.csv';

async function importCSV() {
  const data = [];
  try {
    await sequelize.sync();
    fs.createReadStream(csvFilePath)
    .pipe(parse({ delimiter: '\t' })) // Используйте тот разделитель, который используется в вашем CSV файле
    .on('data', (row) => {
      data.push(row);
    })
    .on('end', async () => {
      try {
        await Bill.bulkCreate(data);
        console.log('Импорт завершен успешно!');
      } catch (error) {
        console.error('Ошибка при импорте данных: ', error);
      } 
    });
  } catch (error) {
    console.error('Ошибка при синхронизации с базой данных: ', error);
  }
}

module.exports = { importCSV }