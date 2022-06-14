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
    inbox
      ? resolve(readdir(inbox))
      : reject(new Error ("Error: Folder inaccessible"))
    });
}

const promiseReadFile = (inbox, file) => {
  return new Promise((resolve, reject) => {
    file
      ? resolve(readFile( join(inbox, file), "utf8"))
      : reject(new Error ("Error: File error"))
    }); 
}

const promiseWriteFile = (outbox, file, data) => {
  return new Promise((resolve, reject) => {
    data
      ? resolve(writeFile( join(outbox, file), reverseText(data)))
      : reject(new Error ("Error: File could not be saved!"))
      });
  }
  
  async function result(inbox, outbox) { 
    let files = await promiseReadDir(inbox);
    files.forEach(file => {
      let data =  promiseReadFile(inbox, file)
       promiseWriteFile(outbox, file, data)
    })
  }

  result(inbox, outbox)