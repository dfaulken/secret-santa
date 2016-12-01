class AddSecretSantaIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :secret_santa_id, :integer
  end
end
