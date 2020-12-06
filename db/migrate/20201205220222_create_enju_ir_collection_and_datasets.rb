class CreateEnjuIrCollectionAndDatasets < ActiveRecord::Migration[5.2]
  def change
    create_table :enju_ir_collection_and_datasets do |t|
      t.references :enju_ir_collection, foreign_key: true, null: false, type: :uuid
      t.references :enju_ir_dataset, foreign_key: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
