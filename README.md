# Slack API たたくやつ for うちの研究室
ruby実行環境が必要です  
ぼくのかんきょうはruby2.3.3だ

コアなところをrubyで書いてますがCoffeeScript用のラッパを書いてあるのでそっちを使いましょう

# CoffeeScript
`SlackAPI.coffee` をrequireすれば使えるようになる
```
SlackAPI = require('SlackAPI').SlackAPI
```
いちおー命名規則的なのは作ってる↓    
`https://slack.com/api/users.list?token=<token>` みたいなのがあったとすると  
`SlackAPI.users.list <token>` で結果が帰るようになってる（はずです）  

## users.list
ユーザ一覧を連想配列で取得
```
SlackAPI = require('SlackAPI').SlackAPI

user_list = SlackAPI.users.list '<token>'
```
戻り値は
```
{
  "name1" : "ID1",
  "name2" : "ID2",
  "name3" : "ID3"
}
```
って感じのハッシュになります

## users.getPresence
指定したユーザIDをもつユーザが出席状態かを確認する
```
SlackAPI = require('SlackAPI').SlackAPI

presence = SlackAPI.users.getPresence '<token>', '<user_id>'
```
戻り値は
```
"active"
```
または
```
"away"
```
になると思う
