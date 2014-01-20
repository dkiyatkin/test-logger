(function(root, factory) {
    if(typeof exports === 'object') {
        module.exports = factory();
    }
    else if(typeof define === 'function' && define.amd) {
        define([], factory);
    }
    else {
        factory();
    }
}(this, function() {
/*! @license
* test-logger
* Copyright (c) 2014 Dmitriy Kiyatkin, http://dkiyatkin.com
* Licensed under the MIT license
* https://github.com/dkiyatkin/test-logger/blob/master/LICENSE
*/


(function() {
  var Logger,
    __slice = [].slice;

  Logger = (function() {
    /**
    * List of log levels: 'ERROR', 'WARNING', 'INFO', 'DEBUG'.
    * @type {Array}
    */

    var loggers, _log;

    loggers = ['ERROR', 'WARNING', 'INFO', 'DEBUG'];

    /**
    * Wrapper for the `console` methods.
    * @param {Array} msg Messages.
    * @param {number} logLevel Log level.
    * @param {Object} log Class instance.
    * @protected
    * @return {string} Message.
    */


    _log = function(msg, logLevel, log) {
      if (loggers.indexOf(log.logger) >= logLevel) {
        msg = '[' + new Date().toGMTString() + '] ' + loggers[logLevel] + ' ' + msg.join(' ');
        if (!log.quiet) {
          if (logLevel === 3) {
            console.log(msg);
          }
          if (logLevel === 2) {
            console.info(msg);
          }
          if (logLevel === 1) {
            console.warn(msg);
          }
          if (logLevel === 0) {
            console.error(msg);
          }
        }
        log.history += '\n' + msg;
        return msg;
      }
    };

    /**
    * @constructor
    * @param {Object=} options (optional).
    * @param {Object=}.logger options.logger (optional).
    * @param {Object=}.quiet options.quiet (optional).
    */


    function Logger(options) {
      this.options = options != null ? options : {};
      /**
      * Object of log methods.
      * @type {Object}
      */

      this.log = {
        /**
        * Get log history.
        * @type {string}
        */

        history: '',
        /**
        * Set/Get log level.
        * @type {string}
        */

        logger: this.options.logger || 'WARNING',
        /**
        * Set/Get log quiet mode.
        * @type {boolean}
        */

        quiet: this.options.quiet || false,
        /**
        * @param {...string} msg Anything text for debug output.
        * @return {string}
        */

        debug: function() {
          var msg;
          msg = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
          return _log(msg, 3, this);
        },
        /**
        * @param {...string} msg Anything text for info output.
        * @return {string}
        */

        info: function() {
          var msg;
          msg = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
          return _log(msg, 2, this);
        },
        /**
        * @param {...string} msg Anything text for warn output.
        * @return {string}
        */

        warn: function() {
          var msg;
          msg = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
          return _log(msg, 1, this);
        },
        /**
        * @param {...string} msg Anything text for error output.
        * @return {string}
        */

        error: function() {
          var msg;
          msg = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
          return _log(msg, 0, this);
        }
      };
    }

    return Logger;

  })();

  module.exports = Logger;

}).call(this);

}));
