// import places from 'places.js';

// const initAutocomplete = () => {
//   const addressInput = document.getElementById('address-new-company');
//   if (addressInput) {
//     places({ container: addressInput });
//   }
// };

// export { initAutocomplete };



function initAutocomplete() {
    var companyAddress = document.getElementById('address-new-company');

    if (companyAddress) {
      var initAutocomplete = new google.maps.places.Autocomplete(companyAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(companyAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
}

export { initAutocomplete };
