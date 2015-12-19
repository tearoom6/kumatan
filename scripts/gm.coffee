# Description:
#   Say good morning at the beginning of the day
#
# Dependencies:
#   "cron"
#
# Author:
#   tearoom6
#
CronJob = require('cron').CronJob

module.exports = (robot) ->
  sendSlack = (channel, title, msg) ->
    data =
      content:
        pretext: title
        text: msg
        fallback: msg
        color: '#a52a2a'
      channel: channel
      username: 'kuma'
    robot.emit 'slack.attachment', data

  msgs = [
    ':blacky:おはよう！'
    ':blacky:あさからレッドブル飲む気かい?'
    ':blacky:うーん、眠いにゃぁ。。'
    ':blacky:ちょっとお疲れ気味?'
    ':blacky:いけー！！'
    ':whity:今日も頑張ろうね！'
    ':whity:ホワイティも頑張るよ！'
    ':whity:ガンバ！'
    ':whity:ガンガンいこうぜ！'
    ':whity:今日はじっくりと。'
    ':kuma:のんびりしたっていいじゃない、人間だもの。'
    ':kuma:朝から飛ばしていこー'
    ':kuma:張り切っていこー！'
    ':kuma:クマも頑張るよ！'
    ':kuma:定時までに終わらせよう！'
    ':kuma:ふぁいと！！'
  ]

  job = new CronJob
    cronTime: '0 0 10 * * 1-5'
    onTick: () ->
      sendSlack '#general', 'GoodMorning', msgs[Math.floor(Math.random() * msgs.length)]
    start: false
  job.start()
