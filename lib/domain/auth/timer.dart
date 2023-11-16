class SetTimer {
  static Stream<int> timer(int seconds) async* {
    for (int i = seconds + 1; i >= 0; i--) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
