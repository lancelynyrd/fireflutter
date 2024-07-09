import 'package:fireflutter/fireflutter.dart';

extension TranslationServiceExtensionMap on String {
  /// Translate the string
  ///
  /// Example:
  /// ```dart
  /// 'version'.t
  /// ```
  String get t => TranslationService.instance.tr(this);

  /// Translate with replacement
  String tr({Map<String, dynamic>? args, int? form}) =>
      TranslationService.instance.tr(
        this,
        args: args,
        form: form,
      );
}
