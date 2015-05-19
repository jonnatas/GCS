class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|

      t.integer :year
      t.integer :state_id
      t.string :local
      t.string :test_type
      t.float :peformance
      t.float :disapproval
      t.float :evasion
      t.integer :grade_id

      t.timestamps
    end
  end
end
