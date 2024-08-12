import 'package:string_similarity/string_similarity.dart';

String getMostSimilarString(String value, List<String> options) {
  if (options.isEmpty) return value;

  num maxSimilarity = 0;
  String mostSimilar = options.first;
  for (final option in options) {
    final optionSimilarity = value.similarityTo(option);
    if (optionSimilarity > maxSimilarity) {
      maxSimilarity = optionSimilarity;
      mostSimilar = option;
    }
  }

  return mostSimilar;
}
