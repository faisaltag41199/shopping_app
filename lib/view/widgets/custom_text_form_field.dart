import 'package:flutter/material.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final textSize;
  final hintTextSize;
  final Alignment alignment;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {this.text = "",this.alignment=Alignment.center, this.hintText = "", this.textSize=20.0,this.hintTextSize=15.0,this.onSave,this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(

              child: CustomText(
                alignment: alignment,
            text: text,
            color: Colors.black,
            fontSize: textSize,
          )),
          Expanded(

            child: TextFormField(
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey,fontSize: hintTextSize),
                  fillColor: Colors.black),
              onSaved: onSave,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
