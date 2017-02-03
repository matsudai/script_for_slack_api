# Slack API たたくやつ for うちの研究室
ぼくのかんきょうはruby2.3.3だ

# 使い方
標準出力にでるので頑張って取る

## users.list
`ruby slack_api_users_list.rb <token>` で実行するとJson形式の文字列が標準出力される  
↓こんなやつ
 ```
{
  "hoge" : "114514",
  "moge" : "1919893",
  "fugo" : "8101919"
    }
```

## users.getPresence
`ruby slack_api_users_getPresence.rb <token> <user_id>` で実行すると"active"か"away"が標準出力される  
例外処理はしてないのでやばいものが帰ってくるかもしれない
