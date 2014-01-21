Logger = require('../src/logger.coffee')

exports.logger = (test) ->
  console.log 123
  test.expect 3
  logger = new Logger()
  logger.log.logger = "WARNING"
  test.equal(logger.log.debug("logger", "sdf"), `undefined`, "logger level 1")
  logger.log.logger = "INFO"
  logger.log.quiet = true
  test.equal(logger.log.error("logger", "sdf").split(" ").slice(-3).join(" "), "ERROR logger sdf", "logger level 2")
  controller2 = new Logger({logger:'DEBUG', quiet: true})
  test.notEqual(logger.log.history.length, controller2.log.history.length, 'one string, two string')
  test.done()

exports.extendLogger = (test) ->

  class MyApp extends Logger

    constructor: (@options) ->
      super
      @func()

    func: () ->
      @log.warn('this is warning!') # -> [Tue, 21 Jan 2014 13:15:51 GMT] WARNING this is warning!


  class MyApp2 extends Logger

    constructor: (@options) ->
      super
      @func()

    func: () ->
      @log.warn('this is warning!!') # -> [Tue, 21 Jan 2014 13:15:51 GMT] WARNING this is warning!!

  myApp2 = new MyApp2({logger:'DEBUG', quiet: false})
  myApp = new MyApp({logger:'DEBUG', quiet: false})
  myApp.log.info('this is info!') # -> [Tue, 21 Jan 2014 13:22:14 GMT] INFO this is info!
  myApp2.log.info('this is info!!') # -> [Tue, 21 Jan 2014 13:22:14 GMT] INFO this is info!!

  console.log myApp.log.history, myApp2.log.history
  test.done()
