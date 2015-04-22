class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|

    	t.float :evasion
    	t.float :performance
    	t.float :distortion
    	t.integer :year
    	t.integer :id_grade
    	t.integer :id_state
      t.timestamps
    end
  end
end
