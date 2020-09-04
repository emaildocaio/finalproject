class AddParticipantsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :participants, :integer, default: 1
  end
end
