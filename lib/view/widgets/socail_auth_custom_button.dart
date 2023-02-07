import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialAuthCustomButton extends StatelessWidget {

  final Widget? icon;
  final Widget text;
  final void Function()? onClick;


  SocialAuthCustomButton({Key? key,this.text=const Text(''),this.icon,this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child:TextButton(onPressed:onClick,child:Row(
        children: [
          Expanded(flex: 1,child:Icon==null?Text(''):icon!),
          Expanded(flex: 9,child:text)
        ],
      ),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(5))
      ),
      ),
    );
  }
}
