class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|

      t.float :ano
      t.string :abrangencia
      t.string :local
      t.string :Rede
      t.float :ap_1
      t.float :ap_2
      t.float :ap_3
      t.float :ap_4
      t.float :ap_5
      t.float :ap_6
      t.float :ap_7
      t.float :ap_8
      t.float :ap_9
      t.float :ap_1_5
      t.float :ap_6_9
      t.float :total_ap_fun
      t.float :ap_1_m
      t.float :ap_2_m
      t.float :ap_3_m
      t.float :ap_4_m
      t.float :ap_total_m_n_s
      t.float :total_ap_m
      t.float :rp_1
      t.float :rp_2
      t.float :rp_3
      t.float :rp_4
      t.float :rp_5
      t.float :rp_6
      t.float :rp_7
      t.float :rp_8
      t.float :rp_9
      t.float :rp_1_5
      t.float :rp_6_9
      t.float :rp_total_fun
      t.float :rp_1_m
      t.float :rp_2_m
      t.float :rp_3_m
      t.float :rp_4_m
      t.float :total_rp_m_n_s
      t.float :total_rp_m
      t.float :ab_1
      t.float :ab_2
      t.float :ab_3
      t.float :ab_4
      t.float :ab_5
      t.float :ab_6
      t.float :ab_7
      t.float :ab_8
      t.float :ab_9
      t.float :ab_1_5
      t.float :ab_6_9
      t.float :total_ab_fun
      t.float :ab_1_m
      t.float :ab_2_m
      t.float :ab_3_m
      t.float :ab_4_m
      t.float :total_ab_n_s
      t.float :total_ab_m

      t.timestamps
    end
  end
end
