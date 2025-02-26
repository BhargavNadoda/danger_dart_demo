import 'dart:io';

import 'package:danger_core/danger_core.dart';

void main() {
  if (danger.github.pr.title.contains('WIP')) {
    warn('PR is considered WIP');
  }
  final formatResult = Process.runSync(
    'dart',
    ['format', '--output=none', '--set-exit-if-changed', '.'],
  );

  if (formatResult.exitCode != 0) {
    fail('Please format your code by running `dart format .`.');
  }
}