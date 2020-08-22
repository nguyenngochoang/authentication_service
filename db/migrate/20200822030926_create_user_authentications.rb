class CreateUserAuthentications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_authentications do |t|
      t.string :username

      t.timestamps
    end
  end
end
