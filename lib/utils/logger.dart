import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger getLogger(String className) =>
    Logger(printer: SimpleLogPrinter(className));

class SimpleLogPrinter extends LogPrinter {
  final String className;

  SimpleLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    // emoji className -  u must update ur user token
    if (kDebugMode) {
      print(color!('$emoji $className - ${event.message}'));
    }
    throw UnimplementedError();
  }
}

// class AppLogger {
//   static final logger = Logger(
//     printer: PrettyPrinter(
//         methodCount: 0, // number of method calls to be displayed
//         errorMethodCount: 3, // number of method calls if stacktrace is provided
//         lineLength: 50, // width of the output
//         colors: true, // Colorful log messages
//         printEmojis: true, // Print an emoji for each log message
//         printTime: false // Should each log print contain a timestamp
//         ),
//   );

//   // for info, should be used for public calls
//   static void i(dynamic message) {
//     logger.i(message);
//   }

//   //for debug message
//   static void d(dynamic message) {
//     logger.d(message);
//   }

//   // for warnning message
//   static void w(dynamic message) {
//     logger.w(message);
//   }

//   // for err messages
//   static void e(dynamic message) {
//     logger.e(message);
//   }

//   static void wtf(dynamic message) {
//     logger.wtf(message);
//   }
// }
