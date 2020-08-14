import 'package:flutter/material.dart';


class RouterStruct{
  final Widget widget;
  final int entrancePageIndex;
  final List<String> params;
///constructor
 const RouterStruct(this.widget, this.entrancePageIndex, this.params);

}