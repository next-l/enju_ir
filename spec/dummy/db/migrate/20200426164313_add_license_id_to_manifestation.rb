class AddLicenseIdToManifestation < ActiveRecord::Migration[5.2]
  def change
    add_reference :manifestations, :license, null: false, foreign_key: true, default: 1
  end
end
