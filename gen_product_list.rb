require 'csv'

csv_header = ["Handle","Title","Body (HTML)","Vendor","Type","Tags","Published","Option1 Name","Option1 Value","Option2 Name","Option2 Value","Option3 Name","Option3 Value","Variant SKU","Variant Grams","Variant Inventory Tracker","Variant Inventory Qty","Variant Inventory Policy","Variant Fulfillment Service","Variant Price","Variant Compare At Price","Variant Requires Shipping","Variant Taxable","Variant Barcode","Image Src","Image Position","Image Alt Text","Gift Card","SEO Title","SEO Description","Google Shopping / Google Product Category","Google Shopping / Gender","Google Shopping / Age Group","Google Shopping / MPN","Google Shopping / AdWords Grouping","Google Shopping / AdWords Labels","Google Shopping / Condition","Google Shopping / Custom Product","Google Shopping / Custom Label 0","Google Shopping / Custom Label 1","Google Shopping / Custom Label 2","Google Shopping / Custom Label 3","Google Shopping / Custom Label 4","Variant Image","Variant Weight Unit","Variant Tax Code","Cost per item"]

CORBO_BASE_PATH = "/Users/michi/tmp/corbo/"
RESULT_FOLDER_NAME = CORBO_BASE_PATH + "result_item_list/"
#SOURCE_FILE_NAME = CORBO_BASE_PATH + "CORBO items gen csv source.csv"
SOURCE_FILE_NAME = CORBO_BASE_PATH + "CORBO Items List3.csv"
DEST_FILE_NAME = RESULT_FOLDER_NAME + "CORBO items dst.csv"


table = CSV.table(SOURCE_FILE_NAME)
p table.headers

table.each do |row|
  if 'Y' == row[:update] then
    if 'f' == row[:flag] then
  #    handle = row[:code1] + "-" + row[:code2].to_s
    handle = row[:sku]
  #    p handle
      variantColors = [row[:col1], row[:col2], row[:col3], row[:col4], row[:col5], row[:col6], row[:col7], row[:col8]]
      variantColNames = [row[:col_name1], row[:col_name2], row[:col_name3], row[:col_name4], row[:col_name5], row[:col_name6], row[:col_name7], row[:col_name8]]
  #    p variantColors
      i = 0
      first = true
  #    print row[:colvariant].to_s + "\n"
      line = ""
      while i < row[:colvariant] do
        line = String.new(handle)
        if true == first then
          line << "\t"
          line << row[:product_display_name]
          line << "\t"
          line << "\t"
          line << "CORBO."
          line << "\t"
          line << row[:category]
          line << "\t"
          line << "\t"
          line << "True"
          line << "\t"
          line << "Color"
          line << "\t"
  #        line << variantColNames[i]
  #        line << "\t"
          first = false
        else
          line << "\t\t\t\t\t\t\t\t"
        end
        line << variantColNames[i]

        line << "\t\t\t\t\t"
  #      variantSKU = row[:code1] + "-" + row[:code2].to_s + "-" + variantColors[i]
        variantSKU = row[:sku] + "-" + variantColors[i]
        line << variantSKU
        line << "\t"
        line << row[:total_weight].to_s
        line << "\t"
        line << "shopify"
        line << "\t"
        line << "\t"
        line << "deny"
        line << "\t"
        line << "manual"
        line << "\t"
        line << row[:price_usd_105].to_s
        line << "\t"
        line << "\t"
        line << "TRUE"
        line << "\t"
        line << "TRUE"
        print line + "\n"
        i += 1
      end
  #    print "\n"
    end
  end
end

#csv_header_row = CSV::Row.new(csv_header)
#generatedTable = CSV::Table.new(csv_header_row)
#if false == Dir.exist?(RESULT_FOLDER_NAME) then
#  Dir.mkdir(RESULT_FOLDER_NAME)
#end
#print DEST_FILE_NAME + "\n"
#File.write(DEST_FILE_NAME, generatedTable)
