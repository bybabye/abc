import 'package:clone_facebook/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomDecoratedBox extends StatelessWidget {
  const CustomDecoratedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.kLinearBGfirst,
            AppColor.kLinearBGSecond,
          ],
        ),
      ),
    );
  }
}
