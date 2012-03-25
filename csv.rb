#!/usr/bin/local/ruby
ARGV.each do |file|
  out = File.open(file, 'r:ascii-8bit').read.gsub(/\$|,/, "").gsub(/\s{2,}/, ",")
  out = out.split("NOTIONAL AMOUNT OF DERIVATIVE CONTRACTS,TOP 25 COMMERCIAL BANK").last
  out = out.split("FX\n").last
  out = out.split(",TOP").first
  csv = "RANK,BANK NAME,TOTAL ASSETS,TOTAL DERIVATIVES,TOTAL FUTURES (EXCH TR),TOTAL OPTIONS (EXCH TR),TOTAL FORWARDS (OTC),TOTAL SWAPS (OTC),TOTAL OPTIONS (OTC),TOTAL CREDIT DERIVATIVES (OTC),SPOT FX\n" + out
  File.open(file.split('.txt').first + '.csv', "w").puts(csv)
end
