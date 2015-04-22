class CreateProvaBrasils < ActiveRecord::Migration
  def change
    create_table :prova_brasils do |t|

    	t.integer :id_test
    	t.integer :id_grade
    	t.integer :total_students
    	t.float :portuguese_score
    	t.float :math_score
    	t.integer :year
    	t.integer :id_state
    	
      t.timestamps
    end
  end
end
