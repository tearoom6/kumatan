# Description:
#   Say good bye at the end of the day
#
# Commands:
#   hubot <something> - <reply somewhat friendly>
#
# Author:
#   tearoom6
#
module.exports = (robot) ->
  robot.respond /(.*)/i, (res) ->
    phrase = encodeURIComponent res.match[0]
    replies = ['うん？', 'なんか言った？？', '気分がいいね！', 'わーい！！', 'やったね！']
    res.send res.random replies
