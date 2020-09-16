import consumer from "./consumer";

const initBookingCable = () => {
  if (consumer.subscriptions.subscriptions.length < 1) {
    consumer.subscriptions.create({ channel: "BookingNotificationChannel" }, {
        received(data) {
          const avatarNavbar = document.querySelector('.dropdown');
          avatarNavbar.insertAdjacentHTML('beforebegin', data);
        }
      });
  };
};

export { initBookingCable };
