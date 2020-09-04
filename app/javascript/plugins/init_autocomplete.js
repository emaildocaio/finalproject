import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('address-new-company');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
