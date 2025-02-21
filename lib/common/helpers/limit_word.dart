String limitWords(String text, int maxWords) {
  List<String> words = text.split(' ');
  return words.length > maxWords ? '${words.take(maxWords).join(' ')}...' : text;
}