import 'package:flutter/material.dart';
import 'package:shopping_app/view/auth/register_view/register_view.dart';
import '../../../constance.dart';
import '../../widgets/respnsive_layout.dart';

class ResponsiveRegisterView extends StatelessWidget {
  const ResponsiveRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: RegisterView(),
      tablet: Row(
        children: [
          Expanded(
              child: Container(
            height: double.infinity,
            color: primaryColor,
          )),
          Expanded(child: RegisterView())
        ],
      ),
      web: Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                height: double.infinity,
                color:primaryColor
              )),
          Expanded(flex: 4, child: RegisterView()),
          Expanded(
            flex: 3,
            child: Container(
              height: double.infinity,
              color:primaryColor
            ),
          )
        ],
      ),
    );
  }
}
