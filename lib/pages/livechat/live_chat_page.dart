import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telemedicine_app/app/theme.dart';
import 'package:telemedicine_app/widgets/base_appbar.dart';

import '../../app/constant.dart';
import '../../app/routes.dart';
import '../../widgets/card_consultation.dart';
import '../chat/room_chat/provider/room_provider.dart';

class LiveChatPage extends HookConsumerWidget {
  const LiveChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listDataDokter = [
      {
        'id': 'dokter1',
        'username': 'Dokter 1',
        'image': 'assets/images/female.png'
      },
      {
        'id': 'dokter2',
        'username': 'Dokter 2',
        'image': 'assets/images/male.png'
      },
    ];
    return Scaffold(
      appBar: const BaseAppbar(title: "Live Chat"),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: getActualX(x: defaultMargin, context: context)),
        children: [
          SizedBox(
            height: getActualY(y: defaultMargin, context: context),
          ),
          Text(
            "Tanya Dokter Kami Sekarang",
            style: textLargeMedium(context: context),
          ),
          SizedBox(
            height: getActualY(y: 12, context: context),
          ),
          Text(
            "Senin - Jumat (08.00 - 17.30)",
            style: textMediumReguler(context: context),
          ),
          SizedBox(
            height: getActualY(y: 4, context: context),
          ),
          Text(
            "Sabtu(08.00 - 21.00)",
            style: textMediumReguler(context: context),
          ),
          SizedBox(
            height: getActualY(y: 24, context: context),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...listDataDokter.map(
                  (e) => CardConsultation(
                    doctor: e,
                    onTap: () {
                      ref.read(currentRoomIdProvider.notifier).state = e['id'];
                      Navigator.pushNamed(context, roomChatRoute);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
