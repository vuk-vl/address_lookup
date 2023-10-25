extension StringExtension on String {
  String capitalize() {
    List<String> parts = split(' ');
    List<String> result = [];

    for (var e in parts) {
      result.add("${e[0].toUpperCase()}${e.substring(1).toLowerCase()}");
    }
    return result.join(' ');
  }
}
