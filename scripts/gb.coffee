# Description:
#   Say good bye at the end of the day
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
    ':100:今日もお疲れ様(^^)'
    ':whity:まだ頑張るの？無理はしないようにね！'
    ':whity:お疲れ様！'
    ':whity:家に帰ってご飯を食べよう！'
    ':whity:頑張りすぎはよくないよ'
    ':kuma:明日も頑張ろうね！'
    ':kuma:おつかれー！！'
    ':kuma:ほどほどにね！'
    ':kuma:クマは先に帰るよ！'
    ':kuma:休日のために頑張るんだ！'
  ]

  job = new CronJob
    cronTime: '0 0 19 * * 1-5'
    onTick: () ->
      sendSlack '#general', '定時ですよ！', msgs[Math.floor(Math.random() * msgs.length)]
    start: false
  job.start()
