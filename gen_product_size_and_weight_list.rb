require 'csv'

csv_header = ["Handle","Title","Body (HTML)","Vendor","Type","Tags","Published","Option1 Name","Option1 Value","Option2 Name","Option2 Value","Option3 Name","Option3 Value","Variant SKU","Variant Grams","Variant Inventory Tracker","Variant Inventory Qty","Variant Inventory Policy","Variant Fulfillment Service","Variant Price","Variant Compare At Price","Variant Requires Shipping","Variant Taxable","Variant Barcode","Image Src","Image Position","Image Alt Text","Gift Card","SEO Title","SEO Description","Google Shopping / Google Product Category","Google Shopping / Gender","Google Shopping / Age Group","Google Shopping / MPN","Google Shopping / AdWords Grouping","Google Shopping / AdWords Labels","Google Shopping / Condition","Google Shopping / Custom Product","Google Shopping / Custom Label 0","Google Shopping / Custom Label 1","Google Shopping / Custom Label 2","Google Shopping / Custom Label 3","Google Shopping / Custom Label 4","Variant Image","Variant Weight Unit","Variant Tax Code","Cost per item"]

CORBO_BASE_PATH = "/Users/michi/tmp/corbo/"
RESULT_FOLDER_NAME = CORBO_BASE_PATH + "result_item_list/"
#SOURCE_FILE_NAME = CORBO_BASE_PATH + "CORBO items gen csv source.csv"
SOURCE_FILE_NAME = CORBO_BASE_PATH + "CORBO Items List4.csv"
DEST_FILE_NAME = RESULT_FOLDER_NAME + "CORBO items dst.csv"


table = CSV.table(SOURCE_FILE_NAME)
p table.headers

table.each do |row|
  if 'Y' == row[:update] then
    if 'f' == row[:flag] then
      handle = row[:sku]
      weight_g = row[:net_weight]
      weight_o = row[:weight_oz]
      h_cm = row[:h_cm]
      w_cm = row[:w_cm]
      d_cm = row[:d_cm]
      h_in = row[:h_in]
      w_in = row[:w_in]
      d_in = row[:d_in]

      dimension = "<ul><li>Size #{h_cm}cm H x #{w_cm}cm W x #{d_cm}cm D | #{h_in}in H x #{w_in}in W x #{d_in}in D</li>"
      weight = "<li>Weight #{weight_g}g | #{weight_o}oz</li></ul>"
      print "#{handle}\t#{row[:product_display_name]}\t#{dimension}#{weight}\tCORBO.\t#{row[:category]}\n"
    end
  end
end
