import 'dart:developer' as developer;

class LogLevel {
  static const DEBUG = 0;
  static const INFO = 1;
  static const WARNING = 2;
  static const ERROR = 3;
  static const EXCEPTION = 4;

  final int level;
  final String name;
  const LogLevel._(this.level, this.name);

  factory LogLevel.debug() {
    return LogLevel._(DEBUG, "DEBUG");
  }

  factory LogLevel.info() {
    return LogLevel._(INFO, "INFO");
  }

  factory LogLevel.warning() {
    return LogLevel._(WARNING, "WARNING");
  }

  factory LogLevel.error() {
    return LogLevel._(ERROR, "ERROR");
  }

  factory LogLevel.exception() {
    return LogLevel._(EXCEPTION, "EXCEPTION");
  }
}

class Logger {
  final String name;
  const Logger(this.name);

  _log(LogLevel logLevel, String message, {error, StackTrace stackTrace}) {
    final level = logLevel.name;
    final time = DateTime.now().toString();

    final nameFormat = "$level $name";
    final messageFormat = "$time| $message";

    developer.log(messageFormat,
        name: nameFormat,
        error: error,
        level: logLevel.level,
        stackTrace: stackTrace);
  }

  debug(String message, {error}) {
    _log(LogLevel.debug(), message, error: error);
  }

  info(String message, {error}) {
    _log(LogLevel.info(), message, error: error);
  }

  warning(String message, {error}) {
    _log(LogLevel.warning(), message, error: error);
  }

  error(String message, {error}) {
    _log(LogLevel.error(), message, error: error);
  }

  exception(String message, {error, StackTrace stackTrace}) {
    _log(LogLevel.exception(), message, error: error, stackTrace: stackTrace);
  }
}
