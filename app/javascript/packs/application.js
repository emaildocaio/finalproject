// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("@nathanvda/cocoon")
require("chartkick")
require("chart.js")
require("owl.carousel")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
// import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initStarRating } from '../plugins/init_star_rating';
import { guestDynamicPrice } from '../packs/booking_form';
import { initFlatpickr } from '../plugins/init_flatpickr';
import { initBookingCable } from '../channels/booking_notification_channel';

// import { autocomplete } from "../components/autocomplete"


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // initMapbox();
  // Call your functions here, e.g:
  // initSelect2();
  initAutocomplete();
  initStarRating();
  initFlatpickr();
  initBookingCable();
  guestDynamicPrice();
  // autocomplete();

});
