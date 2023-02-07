import 'package:flutter/material.dart';
import 'package:shopping_app/view/auth/login_view/loginview.dart';

import '../../../constance.dart';
import '../../widgets/respnsive_layout.dart';

class ResponsiveLoginView extends StatelessWidget {
  const ResponsiveLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: LoginView(),
      tablet: Row(
        children: [
          Expanded(
              child: Container(
            height: double.infinity,
                color:primaryColor,
          )),
          Expanded(child: LoginView())
        ],
      ),
      web: Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                color:primaryColor,
                height: double.infinity,
              )),
          Expanded(flex: 4, child: LoginView()),
          Expanded(
            flex: 3,
            child: Container(
              height: double.infinity,
              color: primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
