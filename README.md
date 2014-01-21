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
