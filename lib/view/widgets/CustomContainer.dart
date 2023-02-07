import 'package:flutter/material.dart';
class CustomContainer extends StatelessWidget {

  final double? height;
  final double? width;
  final double borderRadius;
  final Color? backgroundColor;
  final Color borderColor;
  final Widget? child;
  final Alignment alignment;
  final bool showBorder;

  const CustomContainer({Key? key,this.height,this.width,
    this.showBorder=true,this.alignment=Alignment.centerRight,
    this.borderRadius=30,this.backgroundColor
    ,this.child,this.borderColor=Colors.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(showBorder) {
      return Container(
        height: height,
        width: width,
        alignment: alignment,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor)
        ),
        child: child,
      );
    }else{
      return Container(
      height: height,
      width: width,
      alignment: alignment,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
      ),
      child:child,
    );}


  }
}
