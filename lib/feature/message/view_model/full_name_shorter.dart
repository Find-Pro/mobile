final class FullNameShorter {
  String cut(String name) {
    return name.length > 13 ? '${name.substring(0, 13)}..' : name;
  }
}
