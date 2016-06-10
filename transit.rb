require 'open-uri'
require 'nokogiri'
require 'addressable/uri'

srcStation = ARGV[0].to_s #第一引数は出発地を指定
dstStation = ARGV[1].to_s #第二引数は到着地を指定

if ARGV[2] == 'now' #第三引数にnowが入ると現在時刻で検索
	day = Time.now
	year = day.year
	month = day.month
	date = day.day
	hour = day.hour
	min = format("%2d", day.min).to_s
	m2 = min[1].chr
	m1 = min[0].chr
else # yyyymmddhhmm形式で時間指定可能
	day = ARGV[2].to_s
	year = day.slice(0, 4)
	month = day.slice(4, 2)
	date = day.slice(6, 2)
	hour = day.slice(8, 2)
	min = day.slice(10, 2)
	m2 = min[1].chr
	m1 = min[0].chr

end

puts "検索条件 " + srcStation.to_s + '->' + dstStation.to_s + ': ' + year.to_s + '年' + month.to_s + '月' + date.to_s + '日' + hour.to_s + '時' + min.to_s + '分 出発'

url = Addressable::URI.parse('http://transit.yahoo.co.jp/search/result?flatlon=&from=' + srcStation.to_s + '&tlatlon=&to=' + dstStation.to_s + '&via=&via=&via=&y=' + year.to_s + '&m=' + format("%02d", month) + '&d=' + format("%02d", date) + '&hh=' + format("%02d", hour) + '&m2=' + m2.to_s + '&m1=' + m1.to_s + '&type=1&ticket=ic&lb=1&sr=1&s=0&expkind=1&ws=2&kw=' + dstStation.to_s).normalize

# puts url

charset = nil
html = open(url) do |f|
		charset = f.charset
		f.read
end

page = Nokogiri::HTML.parse(html, nil, charset)

time = page.search('//*[@id="rsltlst"]/li[1]/dl/dd/ul/li[1]')

# time = page.search('//*[@id="route01"]/div[4]')
p time.text