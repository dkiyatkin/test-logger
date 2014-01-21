test-logger
=============

Simple logger class for client and server js. Debug, info, warning, error messages with timestamp, history and quiet mode support.

#Install via package manager

##npm
```bash
npm install test-logger
```

##bower
```bash
bower install test-logger
```

##component
```bash
component install dkiyatkin/test-logger
```

#Example coffeescript and node.js

```coffee
Logger = require('test-logger')

class MyApp extends Logger

  constructor: (@options) ->
    super
    @func()

  func: () ->
    @log.warn('this is warning!') # -> [Tue, 21 Jan 2014 13:15:51 GMT] WARNING this is warning!

myApp = new MyApp({logger:'DEBUG', quiet: false})
myApp.log.info('this is info!') # -> [Tue, 21 Jan 2014 13:15:51 GMT] INFO this is info!
console.log(myApp.log.history) # -> all logs
```

#API

##new Logger(options)
- `options` Object, Optional, Default: {} - values by default.
- `options.logger` String, Optional, Default: 'WARNING' - logger by default, available: 'ERROR', 'WARNING', 'INFO', 'DEBUG'.
- `options.quiet` Boolean, Default: false - quiet mode.

###log.debug(msg...)
- `msg` String - Message to output.
- Return: String - Message.

Any text for debug output.

###log.info(msg...)
- `msg` String - Message to output.
- Return: String - Message.

Any text for info output.

###log.warn(msg...)
- `msg` String - Message to output.
- Return: String - Message.

Any text for warning output.

###log.error(msg...)
- `msg` String - Message to output.
- Return: String - Message.

Any text for error output.

###log.history
- String

Get log history.

###log.logger
- String

Set/Get log level. Available: 'ERROR', 'WARNING', 'INFO', 'DEBUG'.

###log.quiet
- Boolean

Set/Get log quiet mode.
