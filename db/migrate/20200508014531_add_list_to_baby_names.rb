class AddListToBabyNames < ActiveRecord::Migration[6.0]
  def change
    add_reference :baby_names, :list, null: false, foreign_key: true
  end
end
