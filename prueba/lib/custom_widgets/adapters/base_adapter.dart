import 'package:flutter/cupertino.dart';

abstract class BaseAdapter {
  Widget small(BuildContext context);
  Widget medium(BuildContext context);
  Widget wide(BuildContext context);
  Widget ultraWide(BuildContext context);

  bool isWideScreen(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= 1024;
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    Widget size;
    //
    if (width >= 1200) {
      size = ultraWide(context);
    } else if (width >= 1024) {
      size = wide(context);
    } else if (width >= 768) {
      size = medium(context);
    } else {
      size = small(context);
    }

    return size;
  }
}
