import consumer from "./consumer";

const initBookingCable = () => {
  if (consumer.subscriptions.subscriptions.length < 1) {
    consumer.subscriptions.create({ channel: "BookingNotificationChannel" }, {
        received(data) {
          console.log(data); // called when data is broadcast in the cable
          console.log(consumer.subscriptions.subscriptions)
        },
      });
  }
};

export { initBookingCable };
