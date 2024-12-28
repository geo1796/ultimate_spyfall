import 'dart:math';

class RandomIntGenerator {
  final _random = Random();

  int randomInRange(int min, int max) {
    return min + _random.nextInt(max - min + 1);
  }
}
