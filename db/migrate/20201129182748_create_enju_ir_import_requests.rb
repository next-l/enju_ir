class CreateEnjuIrImportRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :enju_ir_import_requests do |t|
      t.references :user, foreign_key: true, null: false
      t.references :doi_record, foreign_key: true, null: false
      t.string :doi_string, null: false

      t.timestamps
    end
  end
end
