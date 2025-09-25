class ChangeExpectedTypeInPackages < ActiveRecord::Migration[7.1]
  def change
    change_column :packages, :expected, :date
  end
end
