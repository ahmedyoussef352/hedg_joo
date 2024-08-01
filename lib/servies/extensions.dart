import 'package:hedg/servies/helpers.dart';

extension StringExtension on String {
  replaceWithTransTempText(String replacementText) {
    return isRTLLocale() ? replacementText : this;
  }
}

