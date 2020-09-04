const minusBtn = document.querySelector('.minus');
const plusBtn = document.querySelector('.actions a:last-child');
const bookingCount = document.getElementById('booking_count');

const updateValues = (counterN) => {
  const span_price_element = document.getElementById('product-price')
  const unit_price = parseInt(span_price_element.innerText, 10)
  const total_price = counterN * unit_price;
  document.getElementById('price-input').innerText = `Total R$ ${total_price}`;
};

const updateMinusBtn = (counterN) => {
  if (counterN > 1) {
    minusBtn.setAttribute('href', 'javascript:void(0)');
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
  bookingCount.value = counterN
};

plusBtn.addEventListener('click', changeCounter);

minusBtn.addEventListener('click', (event) => {
  if (event.currentTarget.attributes.href) {
    changeCounter(event);
  }
});
