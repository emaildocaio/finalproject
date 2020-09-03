const minusBtn = document.querySelector('.minus');
const plusBtn = document.querySelector('.actions a:last-child');

const updateValues = (counterN) => {
  document.getElementById('price-input').value = (counterN * 150) * 100;
  const price = counterN * 150;
  document.getElementById('submit').value = `Pay ${priceEuros}€`;
};

const updateMinusBtn = (counterN) => {
  if (counterN > 1) {
    minusBtn.setAttribute('href', '#');
  } else minusBtn.removeAttribute('href');
};

const changeCounter = (event) => {
  const counter = document.getElementById('counter');
  let counterN = parseInt(counter.dataset.count, 10);
  counterN += parseInt(event.currentTarget.dataset.offset, 10);
  counter.dataset.count = counterN;
  counter.innerText = counter.dataset.count;
  updateMinusBtn(counterN);
  updateValues(counterN);
};

plusBtn.addEventListener('click', changeCounter);

minusBtn.addEventListener('click', (event) => {
  if (event.currentTarget.attributes.href) {
    changeCounter(event);
  }
});
