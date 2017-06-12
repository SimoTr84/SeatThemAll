class CreateOperators < ActiveRecord::Migration[5.0]
  def change
    create_table :operators do |t|
      t.string :name
      t.string :surname
      t.string :image
      t.string :email
      t.text :password_digest

      t.timestamps
    end
  end
end
