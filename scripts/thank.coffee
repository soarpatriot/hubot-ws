# Description:
#   Hubot responds any thank message politely. Phrases from:
#   http://www.macmillandictionary.com/thesaurus-category/british/Ways-of-accepting-someone-s-thanks
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot thank[s] [you] - Hubot accepts your thanks
#
# Author:
#   github.com/delucas
#

response = [
  "不用谢",
  "这没什么",
  "您太客气了！",
  "这点小事还用谢。",
  "为您服务，是我的荣幸！",
  "客气，小事一桩！"
]

module.exports = (robot) ->
  robot.respond /(谢谢|多谢|十分感谢).*/i, (msg) ->
    msg.send msg.random response
