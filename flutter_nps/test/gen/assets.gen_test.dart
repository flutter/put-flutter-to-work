import 'package:flutter_nps/gen/assets.gen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Assets has icon', () {
    test('check-circle.png', () {
      final checkCircle = Assets.icons.checkCircle;
      expect(checkCircle, isNotNull);
    });
  });
  group('AssetGenImage', () {
    test('path resolves', () {
      const testPath = 'test/test';
      const assetGen = AssetGenImage(testPath);

      expect(assetGen.path, equals(testPath));
    });
  });
}
