import 'package:flutter/material.dart';

import '../../app/constant.dart';
import '../../app/theme.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getActualX(x: 20, context: context)),
      decoration: const BoxDecoration(color: primaryMainColor),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "Teman Sehat\nHidup Anda",
                  textAlign: TextAlign.center,
                  style: textLargeMedium(context: context)
                      .copyWith(color: netralColor10),
                ),
                Image.asset(
                  "assets/images/logo_putih.png",
                  height: getActualY(y: 32, context: context),
                )
              ],
            ),
          ),
          SizedBox(
            width: getActualX(x: 16, context: context),
          ),
          Expanded(
            child: Image.asset(
              "assets/images/home_bg_appbar.png",
              height: getActualY(y: 114, context: context),
            ),
          )
        ],
      ),
    );
  }
}
