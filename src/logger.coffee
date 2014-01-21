###! @license
* test-logger
* Copyright (c) 2014 Dmitriy Kiyatkin, http://dkiyatkin.com
* Licensed under the MIT license
* https://github.com/dkiyatkin/test-logger/blob/master/LICENSE
###

class Logger
  ###*
  * List of log levels: 'ERROR', 'WARNING', 'INFO', 'DEBUG'.
  * @type {Array}
  ###
  loggers = ['ERROR', 'WARNING', 'INFO', 'DEBUG']

  ###*
  * Wrapper for the `console` methods.
  * @param {Array} msg Messages.
  * @param {number} logLevel Log level.
  * @param {Object} log Class instance.
  * @protected
  * @return {string} Message.
  ###
  _log = (msg, logLevel, log) ->
    if loggers.indexOf(log.logger) >= logLevel
      msg = '[' + new Date().toGMTString() + '] ' + loggers[logLevel] + ' ' + msg.join(' ')
      if not log.quiet
        console.log msg if logLevel is 3
        console.info msg if logLevel is 2
        console.warn msg if logLevel is 1
        console.error msg if logLevel is 0
      log.history += '\n' + msg
      msg

  ###*
  * @constructor
  * @param {Object=} options (optional).
  * @param {Object=}.logger options.logger (optional).
  * @param {Object=}.quiet options.quiet (optional).
  ###
  constructor: (@options={}) ->
    ###*
    * Object of log methods.
    * @type {Object}
    ###
    @log =
      ###*
      * Get log history.
      * @type {string}
      ###
      history: ''
      ###*
      * Set/Get log level.
      * @type {string}
      ###
      logger: @options.logger || 'WARNING'
      ###*
      * Set/Get log quiet mode.
      * @type {boolean}
      ###
      quiet: @options.quiet || false
      ###*
      * @param {...string} msg Any text for debug output.
      * @return {string}
      ###
      debug: (msg...) -> _log(msg, 3, @)
      ###*
      * @param {...string} msg Any text for info output.
      * @return {string}
      ###
      info: (msg...) -> _log(msg, 2, @)
      ###*
      * @param {...string} msg Any text for warn output.
      * @return {string}
      ###
      warn: (msg...) -> _log(msg, 1, @)
      ###*
      * @param {...string} msg Any text for error output.
      * @return {string}
      ###
      error: (msg...) -> _log(msg, 0, @)

module.exports = Logger
