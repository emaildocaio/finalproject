import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#search_start_date", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#search_end_date"})]
});
