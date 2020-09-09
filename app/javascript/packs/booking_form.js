// const minusBtn = document.querySelector('.minus');
// const plusBtn = document.querySelector('.actions a:last-child');
// const bookingCount = document.getElementById('booking_participants');


// const updateValues = (counterN) => {
//   const span_price_element = document.getElementById('product-price')
//   const unit_price = parseInt(span_price_element.innerText, 10)
//   const total_price = counterN * unit_price;
//   document.getElementById('price-input').innerText = `Total R$ ${total_price}`;
// };

// const updateMinusBtn = (counterN) => {
//   if (counterN > 1) {
//     minusBtn.setAttribute('href', 'javascript:void(0)');
//   } else minusBtn.removeAttribute('href');
// };

// const changeCounter = (event) => {
//   const counter = document.getElementById('counter');
//   let counterN = parseInt(counter.dataset.count, 10);
//   counterN += parseInt(event.currentTarget.dataset.offset, 10);
//   counter.dataset.count = counterN;
//   counter.innerText = counter.dataset.count;
//   updateMinusBtn(counterN);
//   updateValues(counterN);
//   bookingCount.value = counterN
// };

// plusBtn.addEventListener('click', changeCounter);

// minusBtn.addEventListener('click', (event) => {
//   if (event.currentTarget.attributes.href) {
//     changeCounter(event);
//   }
// });



const guestBtn = document.getElementById('add-guest-btn')


const guestDynamicPrice = () => {
  if (guestBtn) {
    const productPrice = document.getElementById('product-price')
    const totalPrice = document.getElementById('price-input')
    let price = parseInt(productPrice.innerText)
    guestBtn.addEventListener('click', (event) => {
      event.preventDefault()
      price += parseInt(productPrice.innerText)
      document.getElementById('price-input').innerText = `Total R$ ${price}`; 
    });
    $('#form-container').on('cocoon:after-remove', function(e, insertedItem, originalEvent) {
      price -= parseInt(productPrice.innerText)
      document.getElementById('price-input').innerText = `Total R$ ${price}`; 
    });
  }
  

  //guardar numa variaval o preco, e o total
  // guardar numa variavel o add guest
  // add event listener no guest, click (soma o valor da trip no total). Depois
  // achar o último botao remove e botar eventlistener click nele (e subtrai o valor
  // da trip).
}
export { guestDynamicPrice }