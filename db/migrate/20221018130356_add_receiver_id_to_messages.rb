class AddReceiverIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :receiver, foreign_key: { to_table: :users }
  end
end
