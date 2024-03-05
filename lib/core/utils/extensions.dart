import 'package:drink_shop/core/utils/pair.dart';
import 'package:flutter/cupertino.dart';

extension IntExtension on int {
  SizedBox asHeight(){
    return SizedBox(height: toDouble());
  }

  SizedBox asWidth(){
    return SizedBox(width: toDouble());
  }

  SliverToBoxAdapter asSliverHeight(){
    return SliverToBoxAdapter(
      child: asHeight(),
    );
  }
}

extension WidgetExtension on Widget {
  Widget fillWidth(){
    return SizedBox(width: double.infinity, child: this);
  }

  Widget expanded(){
    return Expanded(child: this);
  }

  Widget align(Alignment alignment){
    return Align(alignment: alignment, child: this);
  }

  Widget tap(Function() onTap){
    return GestureDetector(onTap: onTap, child: this);
  }
}

extension RichTextExtension on RichText {
  static RichText generate(List<Pair<String, TextStyle>> args, {String sep = " "}){
    return RichText(text: TextSpan(
      children: args.map((e) => TextSpan(text: e.first + sep, style: e.second)).toList()
    ));
  }
}