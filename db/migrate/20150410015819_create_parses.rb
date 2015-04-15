class CreateParses < ActiveRecord::Migration
  def change
    create_table :parses do |t|

    	t.float :ID_SAEB
    	t.float :ID_REGIAO
    	t.string :SIGLA_UF
    	t.float :ID_UF
    	t.float :ID_SERIE
    	t.float :ID_TIPO_REDE
    	t.float :ID_LOCALIZACAO
    	t.float :ID_CAPITAL
    	t.float :NU_PARTICIPANTES
    	t.float :MEDIA_LP
    	t.float :MEDIA_MT
    	t.float :ERRO_PADRAO_LP
    	t.float :ERRO_PADRAO_MT
    	t.float :A
    	t.float :B
    	t.float :C
    	t.float :D

      t.timestamps
    end
  end
end
