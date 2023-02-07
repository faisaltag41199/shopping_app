import 'package:flutter/material.dart';
import 'package:shopping_app/constance.dart';

class CustomButton extends StatelessWidget {

  final Widget text;
  final Function()? onPressed;
  const CustomButton({Key? key,this.text=const Text('button'),this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed:onPressed,
        child:text,
        style: TextButton.styleFrom(backgroundColor: primaryColor),
      ),
    );
  }
}
