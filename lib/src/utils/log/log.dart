import 'package:logger/logger.dart' show DateTimeFormat, Logger, PrettyPrinter;

final log = Logger(printer: PrettyPrinter(dateTimeFormat: DateTimeFormat.none));
