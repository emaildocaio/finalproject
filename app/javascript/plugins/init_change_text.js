var text = ["PRAIA", "SOL", "PARAÍSO", "MAERGULHO", "PASSEIO DE BARCO", "TRILHA"];
var counter = 0;
var elem = document.getElementById("change");
var inst = setInterval(change, 1000);

function change() {
  elem.innerHTML = text[counter];
  counter++;
  if (counter >= text.length) {
    counter = 0;
    // clearInterval(inst); // uncomment this if you want to stop refreshing after one cycle
  }
}
