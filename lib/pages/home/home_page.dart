import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telemedicine_app/app/routes.dart';
import 'package:telemedicine_app/pages/home/banner_home.dart';
import 'package:telemedicine_app/pages/home/blok_consultation.dart';

import '../../app/Constant.dart';
import '../../app/theme.dart';
import '../../widgets/card_menu.dart';
import '../../zego_sdk_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryMainColor,
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: primaryMainColor,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: getActualY(y: 40, context: context),
                      width: getActualX(x: 40, context: context),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: netralColor10),
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: getActualX(x: 8, context: context),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Halo",
                              style: textMediumReguler(context: context)
                                  .copyWith(color: netralColor10)),
                          Text(ZEGOSDKManager().currentUser!.userName,
                              style: textMediumMedium(context: context)
                                  .copyWith(color: netralColor10)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: getActualX(x: 12, context: context),
              ),
              // Container(
              //   decoration:
              //       BoxDecoration(color: netralColor10, shape: BoxShape.circle),
              //   padding: EdgeInsets.symmetric(
              //     vertical: getActualY(context: context, y: 4),
              //     horizontal: getActualX(context: context, x: 4),
              //   ),
              //   child: Icon(
              //     Icons.notifications,
              //     color: netralColor90,
              //   ),
              // )
            ],
          )),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            BannerHome(),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getActualX(x: defaultMargin, context: context)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getActualY(y: 24, context: context),
                      ),
                      Text(
                        "Menu Link Sehat",
                        style: textLargeReguler(context: context),
                      ),
                      SizedBox(
                        height: getActualY(y: 24, context: context),
                      ),
                      Row(
                        children: [
                          CardMenuUtama(
                            onTap: () {
                              Navigator.pushNamed(context, livechatRoute);
                            },
                            url: "assets/menu/livechat.png",
                            title: "Live Chat",
                          ),
                          SizedBox(
                            width: getActualX(x: 24, context: context),
                          ),
                          CardMenuUtama(
                            onTap: () {},
                            url: "assets/menu/appoinment.png",
                            title: "Appoinment",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getActualY(y: 24, context: context),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: netralColor10,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: netralColor30)),
                        padding: EdgeInsets.symmetric(
                            horizontal: getActualX(x: 20, context: context),
                            vertical: getActualY(y: 18, context: context)),
                        child: Row(children: [
                          Text(
                            "Connect Your Health Benefit With Us",
                            style: textMediumMedium(context: context)
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: getActualX(x: 8, context: context),
                          ),
                          const Icon(
                            Icons.share,
                            color: primaryMainColor,
                          )
                        ]),
                      ),
                      SizedBox(
                          height:
                              getActualY(y: defaultMargin, context: context)),
                      BlokConsultation()
                    ]))
          ],
        ),
      ),
    );
  }
}
