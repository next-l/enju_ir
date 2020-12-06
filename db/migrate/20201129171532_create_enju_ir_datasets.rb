class CreateEnjuIrDatasets < ActiveRecord::Migration[5.2]
  def change
    create_table :enju_ir_datasets, id: :uuid do |t|
      t.jsonb :json_attributes, default: {}, null: false
      t.references :user, foreign_key: true, null: false
      t.references :manifestation, foreign_key: true, null: false

      t.timestamps
    end
  end
end
