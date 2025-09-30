class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.string :description
      t.timestamp :expected
      t.string :details
      t.boolean :status

      t.timestamps
    end
  end
end
