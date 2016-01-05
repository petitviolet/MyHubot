cheerio = require 'cheerio'
request = require 'request'

module.exports = (robot) ->
  robot.respond /(sp|sweet-power)$/i, (msg) ->
    root_url = 'http://sp.sweetpowermobile.jp'
    request root_url + '/whatsnew/', (_, res) ->
      $ = cheerio.load res.body
      list = []
      $('.list > li').each ->
        li = $ @
        name = li.find('img').attr('alt')
        link = li.find('a').attr('href')
        x = name + ' ' + li.text() + ' ' + link
        list.push(x)

      msg.send list.join '\n'
