/// logs the outputs in the terminal if the
/// debugging value is set to [true]
class Logger {
  final bool _debug;

  Logger(this._debug);
  displayLog(String message) {
    _debug ? print(message) : print(']');
  }
}