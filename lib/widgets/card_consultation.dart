// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ic.dart';

import '../app/constant.dart';
import '../app/theme.dart';
import 'custom_small_button.dart';

class CardConsultation extends StatelessWidget {
  final Map doctor;
  final Function() onTap;

  const CardConsultation({
    Key? key,
    required this.doctor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: getActualY(y: 12, context: context)),
      decoration: BoxDecoration(
          color: netralColor10,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: netralColor30)),
      padding: EdgeInsets.symmetric(
          horizontal: getActualY(y: 12, context: context),
          vertical: getActualY(y: 8, context: context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getActualY(y: 88, context: context),
            width: getActualX(x: 64, context: context),
            decoration: BoxDecoration(
                // color: primaryMainColor,
                image: DecorationImage(
                    image: AssetImage(doctor['image']), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(
            width: getActualX(x: 12, context: context),
          ),
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor['username'],
                  // style: styleBlackSmallMedium(context: context),
                ),
                SizedBox(
                  width: getActualX(x: 4, context: context),
                ),
                Text(
                  "Doctor Spesialis",
                  // style: styleGreySmallReguler(context: context),
                ),
                SizedBox(
                  height: getActualY(y: 12, context: context),
                ),
                Row(
                  children: [
                    Iconify(
                      Bx.briefcase,
                      color: primaryMainColor,
                      size: getActualY(y: 16, context: context),
                    ),
                    SizedBox(
                      width: getActualX(x: 4, context: context),
                    ),
                    Text(
                      "2 years",
                      // style: styleGreySmallReguler(context: context),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: getActualX(x: 4, context: context)),
                      child: Container(
                        color: netralColor40,
                        width: getActualX(x: 2, context: context),
                        height: getActualY(y: 13, context: context),
                      ),
                    ),
                    Iconify(
                      Ic.thumb_up,
                      color: primaryMainColor,
                      size: getActualY(y: 16, context: context),
                    ),
                    SizedBox(
                      width: getActualX(x: 4, context: context),
                    ),
                    // Text(
                    //   "${doctor.review}%",
                    //   style: styleGreySmallReguler(context: context),
                    // ),
                  ],
                ),
                SizedBox(
                  height: getActualY(y: 12, context: context),
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Text(
                //         getMoney(money: doctor.price),
                //         // style:
                //         //     styleBlackSmallReguler(context: context),
                //       ),
                //     ),
                CustomSmallButton(
                    textColor: netralColor10,
                    text: "Consultation",
                    onPressed: onTap
                    // () {
                    // Navigator.pushNamed(context, consultationRoute,
                    //     arguments: doctor);
                    // Navigator.pushNamed(context, chatRoomRoute);
                    // }
                    )
                // ],
                // )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
