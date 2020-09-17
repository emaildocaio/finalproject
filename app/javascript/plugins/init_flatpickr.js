import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#search_start_date", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#search_end_date" })]
  });
  flatpickr(".datepicker", {
    altInput: true
  });
};

export { initFlatpickr };
