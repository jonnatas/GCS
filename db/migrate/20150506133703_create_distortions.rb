class CreateDistortions < ActiveRecord::Migration
  def change
    create_table :distortions do |t|

    	t.string :ano
    	t.string :regiao
    	t.string :uf
    	t.string :local
    	t.string :Rede
    	t.float :di_1
    	t.float :di_2
    	t.float :di_3
    	t.float :di_4
    	t.float :di_5
    	t.float :di_6
    	t.float :di_7
    	t.float :di_8
    	t.float :di_9
    	t.float :di_1_5
    	t.float :di_6_9
    	t.float :total_fun
    	t.float :di_1_m
    	t.float :di_2_m
    	t.float :di_3_m
    	t.float :di_4_m
    	t.float :total_med

      t.timestamps
    end
  end
end
