# <<Spec Description Example>>
# 103mm x 66mm
# High internal pouch for coins
# Tri-folded bills
# SIM card slot
# Premium, environmentally certified leather
# Backed by our 3 year warranty

# Full-sized note section, coin pocket and card slot
# Stores flat bills
# Holds 4 cards (Horizontal model) | 3 cards (Vertical model)
# Premium, Italian oiled leather
require 'csv'

# [:handle, :note, :coin, :card, :card_num, :flat_bills, :material]
csv_header = ["Handle","Title","Body (HTML)","Vendor","Type","Tags","Published","Option1 Name","Option1 Value","Option2 Name","Option2 Value","Option3 Name","Option3 Value","Variant SKU","Variant Grams","Variant Inventory Tracker","Variant Inventory Qty","Variant Inventory Policy","Variant Fulfillment Service","Variant Price","Variant Compare At Price","Variant Requires Shipping","Variant Taxable","Variant Barcode","Image Src","Image Position","Image Alt Text","Gift Card","SEO Title","SEO Description","Google Shopping / Google Product Category","Google Shopping / Gender","Google Shopping / Age Group","Google Shopping / MPN","Google Shopping / AdWords Grouping","Google Shopping / AdWords Labels","Google Shopping / Condition","Google Shopping / Custom Product","Google Shopping / Custom Label 0","Google Shopping / Custom Label 1","Google Shopping / Custom Label 2","Google Shopping / Custom Label 3","Google Shopping / Custom Label 4","Variant Image","Variant Weight Unit","Variant Tax Code","Cost per item"]

CORBO_BASE_PATH = "/Users/michi/tmp/corbo/"
RESULT_FOLDER_NAME = CORBO_BASE_PATH + "result_item_list/"
SOURCE_FILE_NAME = CORBO_BASE_PATH + "CORBO Items List5.csv"
DEST_FILE_NAME = RESULT_FOLDER_NAME + "pdp_desc.csv"

table = CSV.table(SOURCE_FILE_NAME)
p table.headers

specs = []

table = CSV.table(SOURCE_FILE_NAME)
p table.headers

specs = []

table.each do |row|
  if 'Y' == row[:update] then
    if 'f' == row[:flag] then
      # Specs & Material
      note = false
      coin = false
      card = false
      card_num = 0
      flat_bills = false
      material = row[:material]

      if 'Y' == row[:note] then
        note = true
      end

      if 'Y' == row[:coin] then
        coin = true
      end

      if 'Y' == row[:card] then
        card = true
        card_num = row[:card_num]
      end

      if 'Y' == row[:flat_bills] then
        flat_bills = true
      end

      bills_form = ''
      if true == flat_bills then
        bills_form = "flat"
      else
        bills_form = "folded"
      end

      spec_html = "<ul>\n<li>"
      # Full-sized note section, coin pocket and card slot
      if true == note then
        if true == flat_bills then
          spec_html << "Full-sized note section"
        else
          spec_html << "Note section"
        end
      end

      if true == coin then
        if true == note then
          if true == card then
            spec_html << ", coin pocket"
          else
            spec_html << " and coin pocket"
          end
        else
          spec_html << "Coin pocket"
        end
      end

      if true == card then
        if (true == note) || (true == coin) then
          spec_html << " and card slot"
        else
          spec_html << "Card slot"
        end
      end
      spec_html << "</li>\n"

      if true == note then
        spec_html << "<li>Stores #{bills_form} bills</li>\n"
      end
      if true == card then
        spec_html << "<li>Holds #{card_num} cards</li>\n"
      end
      spec_html << "<li>Premium, #{material}</li>\n</ul>"

      # Dimension & Weight
      handle = row[:sku]
      weight_g = row[:net_weight]
      weight_o = row[:weight_oz].round(1)
      h_cm = row[:h_cm]
      w_cm = row[:w_cm]
      d_cm = row[:d_cm]
      h_in = row[:h_in].round(1)
      w_in = row[:w_in].round(1)
      d_in = row[:d_in].round(1)

      dimension = "<ul>\n<li>Size #{h_cm}cm H x #{w_cm}cm W x #{d_cm}cm D | #{h_in}in H x #{w_in}in W x #{d_in}in D</li>\n"
      weight = "<li>Weight #{weight_g}g | #{weight_o}oz</li>\n</ul>"
      print "#{handle}\t#{row[:product_display_name]}\t#{dimension}#{weight}\tCORBO.\t#{row[:category]}\n"

      specs << [handle, row[:title], "#{spec_html}\n\n#{dimension}#{weight}"]
    end
  end
end

# Write result to file
CSV.open(DEST_FILE_NAME, "wb") do |csv|
  # csv << ["Handle", "Body"]
  csv << csv_header
  specs.each do |spec|
    csv << [spec[0], spec[1], spec[2], "CORBO.", "Wallet"]
  end
end

puts 'done'
