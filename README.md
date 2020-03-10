# CORBO_Shopify_data_util
CORBO. Global EC登録用データ作成ツール

## Files
1. **gen_folders.rb**

SKUのリストから個々のフォルダ階層（作業用）を生成する。

2. **gen_product_list.rb**

商品データリストからShopifyへの登録（インポート）用データを生成する。出力は標準出力に出るので、それをエディタに貼り付けCSVとして保存する。
```
[:rnum, :flag, :update, :series, :category, :code1, :code2, :sku, :price_usd_105, :product_display_name, :h_cm, :w_cm, :d_cm, :weight_oz, :h_in, :w_in, :d_in, :colvariant, :col1, :col2, :col3, :col4, :col5, :col6, :col7, :col8, :col_name1, :col_name2, :col_name3, :col_name4, :col_name5, :col_name6, :col_name7, :col_name8, :total_weight, :net_weight]
1LD-spare	face-Bridle Leather - Zipper Pull		CORBO.	Maintenance		True	Color	Hazel					1LD-spare-HZL	12	shopify		deny	manual	10		TRUE	TRUE
```
3. **gen_product_size_and_weight_list.rb**

商品データから重量およびサイズの登録データ（PDPへの掲載用HTML）を生成する。出力は標準出力に出るので、それをエディタに貼り付けCSVとして保存する。
```
[:rnum, :flag, :update, :series, :category, :code1, :code2, :sku, :price_usd_105, :product_display_name, :h_cm, :w_cm, :d_cm, :weight_oz, :h_in, :w_in, :d_in, :colvariant, :col1, :col2, :col3, :col4, :col5, :col6, :col7, :col8, :col_name1, :col_name2, :col_name3, :col_name4, :col_name5, :col_name6, :col_name7, :col_name8, :total_weight, :net_weight, nil, :"1usd", :"105"]
1LE-0305	equines - Folding Wallet	<ul><li>Size 11cm H x 12.3cm W x 3cm D | 4.330708661in H x 4.842519685in W x 1.181102362in D</li><li>Weight 190g | 6.70205277oz</li></ul>	CORBO.	Wallet
```
