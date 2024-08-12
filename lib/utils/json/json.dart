// Fixes AI JSON outpu
import 'dart:developer';
import 'dart:math' as math;

String sanitiseAiJsonText(String text) {
  final start = text.indexOf('{');
  final end = text.lastIndexOf('}');

  if (start == -1 || end == -1) return text;
  return text.substring(start, end + 1);
}

/// Function to fix List issues in a JSON string.
String fixJsonLists(String jsonString) {
  final labelRegex = RegExp(r'"[a-zA-Z0-9_]+"\s*:');

  int end = jsonString.lastIndexOf(labelRegex) - 1;
  if (end < 10) return jsonString;
  int start = jsonString.lastIndexOf(labelRegex, end - 5);
  while (start > 5) {
    final test = jsonString.substring(start, end);
    final trimmmedTest = test.trim();
    if (trimmmedTest.length > 5 && !(trimmmedTest.contains('{') || trimmmedTest.contains('}'))) {
      final valueStart = trimmmedTest.indexOf(':') + 1;
      final valueEnd = trimmmedTest[trimmmedTest.length - 1] == ',' ? trimmmedTest.length - 1 : trimmmedTest.length;
      String trimmedValue = trimmmedTest.substring(valueStart, valueEnd).trim();

      final trimmedValueStart = test.indexOf(trimmedValue);
      final trimmedValueEnd = trimmedValueStart + trimmedValue.length;

      if (trimmedValue.startsWith('[')) {
        if (!trimmedValue.endsWith(']')) {
          final fixedValue = '$trimmedValue]';
          final fixedMatchString = test.replaceRange(trimmedValueStart, trimmedValueEnd, fixedValue);
          jsonString = jsonString.replaceRange(start, end, fixedMatchString);

          log('Fixed List: $trimmedValue --> $fixedValue');
          log('Fixed List: $test --> $fixedMatchString');
        }
      } else if (trimmedValue.endsWith(']')) {
        if (!trimmedValue.startsWith('[')) {
          final fixedValue = '[$trimmedValue';
          final fixedMatchString = test.replaceRange(trimmedValueStart, trimmedValueEnd, fixedValue);
          jsonString = jsonString.replaceRange(start, end, fixedMatchString);

          log('Fixed List: $trimmedValue --> $fixedValue');
          log('Fixed List: $test --> $fixedMatchString');
        }
      }
    }

    end = start;
    start = jsonString.lastIndexOf(labelRegex, math.max(1, end - 5));
  }

  return jsonString;
}

/// Function to fix quote issues in a JSON string.
String fixJsonQuotes(String jsonString) {
  final valueRegex = RegExp(r'"\s*:\s*".*",?[\n\r]?');
  final replaceRegex = RegExp(r'(?<!\\)"');

  final matches = valueRegex.allMatches(jsonString).toList().reversed;
  for (final match in matches) {
    final matchString = jsonString.substring(match.start, match.end);
    final valueStart = matchString.indexOf('"', 1);
    final valueEnd = matchString.length - (matchString[matchString.length - 2] == ',' ? 3 : 2);
    final value = matchString.substring(valueStart + 1, valueEnd);

    // check if we have just one doule quote and remove it
    final count = '"'.allMatches(value).length;
    if (count == 0) continue;
    if (count == 1) {
      final fixedValue = value.replaceAll('\\"', '').replaceAll('"', '');
      final fixedMatchString = matchString.replaceRange(valueStart + 1, valueEnd, fixedValue);
      jsonString = jsonString.replaceRange(match.start, match.end, fixedMatchString);

      log('Fixed Quotes: $value --> $fixedValue');
      continue;
    }

    // fix all double quotes without escaping
    final fixedValue = value.replaceAllMapped(replaceRegex, (match) => '\\"');
    if (fixedValue == value) continue;

    final fixedMatchString = matchString.replaceRange(valueStart + 1, valueEnd, fixedValue);
    jsonString = jsonString.replaceRange(match.start, match.end, fixedMatchString);

    log('Fixed Quotes: $value --> $fixedValue');
  }

  return jsonString;
}
