class CreateIdebs < ActiveRecord::Migration
  def change
    create_table :idebs do |t|

    	t.float :score
    	t.integer :state_id
    	t.integer :year
    	t.string :test_type
    	
      t.timestamps
    end
  end
end
