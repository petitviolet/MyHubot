# Description:
#   >Prepare for sudden death.<
#
# Dependencies:
#   "eastasianwidth": "~0.1.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot >< <message> - Ascii art generator for sudden death.
#
# Notes:
#   None
#
# Author:
#   saihoooooooo

eastasianwidth = require 'eastasianwidth'

strpad = (str, count) ->
  new Array(count + 1).join str

module.exports = (robot) ->
  robot.respond />< (.*)$/i, (msg) ->
    message = msg.match[1].replace /^\s+|\s+$/g, ''
    return until message.length
    msg.send sudden_death(message)

  robot.hear /突然の(.*)$/i, (msg) ->
    message = "突然の"+msg.match[1].replace /^\s+|\s+$/g, ''
    return until message.length
    msg.send sudden_death(message)

sudden_death = (message) ->
    length = Math.floor eastasianwidth.length(message) / 2
    return "
＿#{strpad '人',  length + 2}＿\n
＞　#{message}　＜\n
￣Y#{strpad '^Y',  length}￣
"

