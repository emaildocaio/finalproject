import consumer from "./consumer";

const initBookingCable = () => {
  if (consumer.subscriptions.subscriptions.length < 1) {
    consumer.subscriptions.create({ channel: "BookingNotificationChannel" }, {
        received(data) {
          const avatarNavbar = document.querySelector('.dropdown');
          const dropdownMenu = document.querySelector('.dropdown-menu');
          const notificationsLink = document.getElementById('notifications-link');
          avatarNavbar.insertAdjacentHTML('beforebegin', data.html[0]);
          if (!notificationsLink) {
            dropdownMenu.insertAdjacentHTML('afterbegin', data.html[1]);
          }
        }
      });
  };
};

export { initBookingCable };
