class CreateDistortions < ActiveRecord::Migration
  def change
    create_table :distortions do |t|

      t.integer :year
      t.integer :state_id
      t.string :local
      t.string :test_type
      t.float :distortion
      t.integer :grade_id
      
      t.timestamps
    end
  end
end
