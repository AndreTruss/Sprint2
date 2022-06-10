const fs = require('fs/promises');

async function readText() {
  try {
    const data = await fs.readFile('./restaurants.json', { encoding: 'utf8' })
    console.log (data.split({}))
  } catch (err) {
    console.log(err)
  }
}
//readText()

/*   fs.appendFile(
    'images.json', JSON.stringify(JSON.parse(data),null,2), (err) => {
      if (err) throw err;
      console.log(`The ${file} has been saved!`);
    }
  ); */


  async function writeText(text) {
    try {
      await fs.writeFile('./text.txt', text)
    } catch (err) {
      console.log(err)
    }
  }
  writeText(readText) 