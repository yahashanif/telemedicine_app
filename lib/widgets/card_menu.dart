import 'package:flutter/material.dart';

import '../app/constant.dart';
import '../app/theme.dart';

class CardMenuUtama extends StatelessWidget {
  final String url;
  final String title;
  final Function() onTap;

  const CardMenuUtama(
      {super.key, required this.url, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getActualX(x: 159, context: context),
        height: getActualY(y: 96, context: context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: netralColor10,
            border: Border.all(color: netralColor30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              url,
              width: getActualX(x: 40, context: context),
              height: getActualY(y: 40, context: context),
            ),
            SizedBox(
              height: getActualY(y: 8, context: context),
            ),
            Text(
              title,
              style: textSmallReguler(context: context),
            )
          ],
        ),
      ),
    );
  }
}
