import 'package:flutter/material.dart';

class NonGlowScrollable extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;
}
