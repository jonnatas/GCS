class CreateIdebs < ActiveRecord::Migration
  def change
    create_table :idebs do |t|

    	t.float :ideb
    	t.string :uf
    	t.float :ano
    	t.string :tipo
    	
      t.timestamps
    end
  end
end
