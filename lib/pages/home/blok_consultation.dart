import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/constant.dart';
import '../../app/routes.dart';
import '../../app/theme.dart';
import '../../widgets/card_consultation.dart';
import '../chat/room_chat/provider/room_provider.dart';

class BlokConsultation extends HookConsumerWidget {
  const BlokConsultation({
    super.key,
  });

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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Consultation",
            style: textMediumMedium(context: context),
          ),
          SizedBox(
            height: getActualY(y: 4, context: context),
          ),
          Text(
            "Live Chat Consultation",
            style: textSmallMedium(context: context)
                .copyWith(color: netralColor70),
          ),
          SizedBox(
            height: getActualY(y: 8, context: context),
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
