require 'csv'

CORBO_BASE_PATH = "/Users/michi/tmp/corbo/"
RESULT_FOLDER_NAME = CORBO_BASE_PATH + "result"
SKU_FILE_NAME = CORBO_BASE_PATH + "SKUs.csv"

Dir.chdir(CORBO_BASE_PATH)
# Dir.getwd

Dir.mkdir(RESULT_FOLDER_NAME)
Dir.chdir(RESULT_FOLDER_NAME)

CSV.foreach(SKU_FILE_NAME) do |sku|
  Dir.chdir(RESULT_FOLDER_NAME)
  p sku
  print sku[0]
  print sku[1]
  code1 = sku[0]
  code2 = sku[1]
  if false == Dir.exist?(code1) then
      Dir.mkdir(code1)
      print code1
  end
  Dir.chdir(code1)
  if false == Dir.exist?(code2) then
      Dir.mkdir(code2)
      print code2
  end

  print code1 + "-" + code2 + "\n"
end




#folder_names = ["1", "2", "3", "4", "5", "6"]
#folder_names.each {|name|
#if false == Dir.exist?(name) then
#    Dir.mkdir(name)
#    print name
#end
#}
