/// logs the outputs in the terminal if the
/// debugging value is set to [true]
class Logger {
  final bool _debug;
// logs the outputs in the terminal if the
  /// debugging value is set to [true]
  Logger(this._debug);

  /// simply prints parsed message to the terminal
  displayLog(String message) {
    if (_debug) {
      print(message);
    }
  }
}
