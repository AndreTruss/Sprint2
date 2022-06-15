const {
  readdir,
  readFile,
  writeFile
} = require("fs/promises");
const {
  join
} = require("path");
const inbox = join(__dirname, "/inbox");
const outbox = join(__dirname, "/outbox");

const reverseText = str =>
  str
  .split("")
  .reverse()
  .join("");

// Read and reverse contents of text files in a directory
/* readdir(inbox, (error, files) => {
  if (error) return console.log("Error: Folder inaccessible");
  files.forEach(file => {
    readFile(join(inbox, file), "utf8", (error, data) => {
      if (error) return console.log("Error: File error");
      writeFile(join(outbox, file), reverseText(data), error => {
        if (error) return console.log("Error: File could not be saved!");
        console.log(`${file} was successfully saved in the outbox!`);
      });
    });
  });
}); */




const promiseReadDir = (inbox) => {
  return new Promise((resolve, reject) => { 
    readdir(inbox, (error, files) => {
      error
      ? reject(new Error ("Error: Folder inaccessible"))
      : resolve(files)
    });
  })
}

const promiseReadFile = (inbox, file) => {
  return new Promise((resolve, reject) => {
    readFile(join(inbox, file), "utf8", (error, data) => {
      return error
      ? reject(new Error ("Error: File error"))
      : resolve(data)
    }); 
  })
}

const promiseWriteFile = (outbox, file, data) => {
  return new Promise((resolve, reject) => {
    writeFile(join(outbox, file), reverseText(data), error => {
      return error
      ? reject(new Error ("Error: File could not be saved!"))
      : resolve(`${file} was successfully saved in the outbox!`)
      });
    })
}

  async function result(inbox, outbox) { 
    let files = await promiseReadDir(inbox);
    files.forEach(file => {
      let data =  promiseReadFile(inbox, file)
       promiseWriteFile(outbox, file, data)
    })
  }

  console.log (promiseReadDir(inbox))