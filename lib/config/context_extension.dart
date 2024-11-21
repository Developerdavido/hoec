
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

extension ContextExtensions on  BuildContext {

  Size get size => MediaQuery.sizeOf(this);
  double get width => size.width;
  double get height => size.height;
  Orientation get orientation => MediaQuery.orientationOf(this);
  bool get portraitOrientation => orientation == Orientation.portrait;
  bool get landScapeOrientation => orientation == Orientation.landscape;
}