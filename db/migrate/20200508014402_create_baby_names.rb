class CreateBabyNames < ActiveRecord::Migration[6.0]
  def change
    create_table :baby_names do |t|
      t.string :name
      t.boolean :keep

      t.timestamps
    end
  end
end
