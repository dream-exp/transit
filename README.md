# What's this ?
Yahoo!乗換案内からWebスクレイピングでゴニョゴニョするサンプルです．

# How to use ?
```sh
	$ ruby transit.rb [出発地点] [到着地点] now #現在時刻で検索
	$ ruby transit.rb [出発地点] [到着地点] [時間指定] #時間指定フォーマットはyyyymmddhhmm
```
# Sample
```sh
	$ ruby transit.rb 新山口 高専正門 now
		検索条件 新山口->高専正門: 2016年6月10日23時25分 出発
		"07:15発→08:25着（1時間10分）"

	$ ruby transit.rb 新山口 高専正門 201606151234	
		検索条件 新山口->高専正門: 2016年06月15日12時34分 出発
		"14:20発→16:12着（1時間52分）"
```