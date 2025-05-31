CREATE TABLE `rakamin-kf-analytics-461406.kimia_farma.kf_aggregation` AS
SELECT 
  t.transaction_id,
  t.date,
  t.branch_id,
  c.branch_name,
  c.kota,
  c.provinsi,
  t.rating,
  t.customer_name,
  t.product_id,
  p.product_name,
  t.price,
  t.discount_percentage,
  CASE
      WHEN t.price <= 50000 THEN 0.10
      WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
      WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
      WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
      ELSE 0.30
  END AS persentase_gross_laba,
  
  (t.price * (1 - (t.discount_percentage / 100))) AS nett_sales,
  
  (t.price * (1 - (t.discount_percentage / 100)) * 
    CASE 
        WHEN t.price <= 50000 THEN 0.1
        WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
        WHEN t.price > 100000 AND t.price <= 300000 THEN 0.2
        WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
        ELSE 0.3
    END
  ) AS nett_profit,
  
  t.rating AS rating_transaksi

FROM `rakamin-kf-analytics-461406.kimia_farma.kf_final_transaction` AS t
LEFT JOIN `rakamin-kf-analytics-461406.kimia_farma.kf_inventory` AS i
  ON t.branch_id = i.branch_id AND t.product_id = i.product_id
LEFT JOIN `rakamin-kf-analytics-461406.kimia_farma.kf_kantor_cabang` AS c
  ON t.branch_id = c.branch_id
LEFT JOIN `rakamin-kf-analytics-461406.kimia_farma.kf_product` AS p
  ON t.product_id = p.product_id;
