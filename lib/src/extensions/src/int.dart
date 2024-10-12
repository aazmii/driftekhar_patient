part of '../extensions.dart';

extension IntExt on int {
  Widget toHeight() => SizedBox(height: double.parse('$this'));
  Widget toWidth() => SizedBox(width: double.parse('$this'));
}
