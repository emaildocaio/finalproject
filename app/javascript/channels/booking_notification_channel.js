import consumer from "./consumer";

const initBookingCable = () => {
  consumer.subscriptions.create({ channel: "BookingNotificationChannel" }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });
};

export { initBookingCable };
