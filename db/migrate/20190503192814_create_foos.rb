class CreateFoos < ActiveRecord::Migration[5.2]
  def change
    create_table :foos do |t|
      t.string :bar
      t.integer :foobar

      t.timestamps
    end
  end
end
