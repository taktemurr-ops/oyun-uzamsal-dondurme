import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_uzamsal_dondurme/oyun_uzamsal_dondurme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dondurmeConfig.title.length, 33);
    expect(dondurmeConfig.tagline.length, 33);
    for (final s in dondurmeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dondurmeConfig.gameId, dondurmeId);
    expect(dondurmeRules.gameId, dondurmeId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dondurmeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dondurmeId, optionalMechanics: dondurmeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dondurmeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
