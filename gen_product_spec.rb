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
csv_header = ["Handle","Note","Coin","Card","Card Num","Flat Bills","Material"]

CORBO_BASE_PATH = "/Users/michi/tmp/corbo/"
RESULT_FOLDER_NAME = CORBO_BASE_PATH + "result_item_list/"
SOURCE_FILE_NAME = CORBO_BASE_PATH + "product_spec_data.csv"
DEST_FILE_NAME = RESULT_FOLDER_NAME + "pdp_specs.csv"

table = CSV.table(SOURCE_FILE_NAME)
p table.headers

specs = []

table.each do |row|
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
spec_html << "</ul>\n"

if true == note then
  spec_html << "<li>Stores #{bills_form} bills</li>\n"
end
if true == card then
  spec_html << "<li>Holds #{card_num} cards</li>\n"
end
spec_html << "<li>Premium, #{material}</li>\n</ul>"


puts spec_html

specs << [row[:handle], spec_html]

end

# ファイルへ書き込み
puts DEST_FILE_NAME

CSV.open(DEST_FILE_NAME, "wb") do |csv|
  csv << ["Handle", "Body"]
  specs.each do |spec|
    csv << [spec[0], spec[1]]
  end
#  csv << ["row", "of", "CSV", "data"]
#  csv << ["another", "row"]
  # ...
end

puts 'done'
