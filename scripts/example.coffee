module.exports = (robot) ->
  robot.hear /@me/i, (res) ->
    res.send "Who am i?"
