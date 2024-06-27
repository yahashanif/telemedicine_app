import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zego_zim/zego_zim.dart';

import '../../../app/constant.dart';
import '../../../app/routes.dart';
import '../../../app/theme.dart';
import '../../../widgets/base_appbar.dart';
import '../../../widgets/card_consultation.dart';
import '../room_chat/provider/room_provider.dart';
import 'conver_list_cell.dart';

class ListPageChat extends HookConsumerWidget {
  const ListPageChat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _converList = useState<List<ZIMConversation>>([]);
    final _converWidgetList = useState<List<ConverListCell>>([]);
    final count = useState(0);

    final listDataDokter = [
      {'id': 'dokter1', 'username': 'Dokter 1'},
      {'id': 'dokter2', 'username': 'Dokter 2'},
    ];

    getMoreConverWidgetList() async {
      ZIMConversationQueryConfig queryConfig = ZIMConversationQueryConfig();
      queryConfig.count = 20;
      print("queryConfig");
      print(queryConfig);
      try {
        queryConfig.nextConversation = _converList.value.last;
      } on StateError {
        queryConfig.nextConversation = null;
      }
      try {
        print("CEKCEKCEK");
        print(queryConfig.nextConversation);
        ZIMConversationListQueriedResult result =
            await ZIM.getInstance()!.queryConversationList(queryConfig);
        _converList.value.addAll(result.conversationList);
        List<ConverListCell> newConverWidgetList = [];
        for (ZIMConversation newConversation in result.conversationList) {
          ConverListCell newConverListCell = ConverListCell(newConversation);
          newConverWidgetList.add(newConverListCell);
        }
        _converWidgetList.value.addAll(newConverWidgetList);
      } on PlatformException catch (onError) {
        print("onError");
        print(onError);
        return null;
      }
      count.value++;
    }

    registerConverUpdate() {
      ZIMEventHandler.onConversationChanged =
          (zim, conversationChangeInfoList) {
        for (ZIMConversationChangeInfo changeInfo
            in conversationChangeInfoList) {
          print("changeInfo.event");
          print(changeInfo.event);
          switch (changeInfo.event) {
            case ZIMConversationEvent.added:
              _converList.value.insert(0, changeInfo.conversation!);
              ConverListCell newConverListCell =
                  ConverListCell(changeInfo.conversation!);
              _converWidgetList.value.insert(0, newConverListCell);

              break;
            case ZIMConversationEvent.updated:
              print(_converList.value);
              ZIMConversation oldConver = _converList.value.singleWhere(
                  (element) =>
                      element.conversationID ==
                      changeInfo.conversation?.conversationID);
              int oldConverIndex = _converList.value.indexOf(oldConver);
              _converList.value[oldConverIndex] = changeInfo.conversation!;
              ConverListCell oldConverListCell = _converWidgetList.value
                  .singleWhere((element) => element.conversation == oldConver);
              int oldConverListCellIndex =
                  _converWidgetList.value.indexOf(oldConverListCell);
              ConverListCell newConverListCell =
                  ConverListCell(changeInfo.conversation!);
              _converWidgetList.value[oldConverListCellIndex] =
                  newConverListCell;
              count.value++;

              break;
            case ZIMConversationEvent.disabled:
              ZIMConversation oldConver = _converList.value.singleWhere(
                  (element) =>
                      element.conversationID ==
                      changeInfo.conversation?.conversationID);
              int oldConverIndex = _converList.value.indexOf(oldConver);
              _converList.value.removeAt(oldConverIndex);
              ConverListCell oldConverListCell = _converWidgetList.value
                  .singleWhere((element) => element.conversation == oldConver);
              int oldConverListCellIndex =
                  _converWidgetList.value.indexOf(oldConverListCell);
              _converWidgetList.value.removeAt(oldConverListCellIndex);
              break;
            default:
          }
        }
        count.value++;
      };
    }

    useEffect(() {
      print("_converWidgetList.value");
      print(_converWidgetList.value);
      if (_converWidgetList.value.isEmpty) getMoreConverWidgetList();
      registerConverUpdate();
      return () {};
    }, []);

    return Scaffold(
      backgroundColor: netralColor10,
      appBar: BaseAppbar(title: "Chat"),
      body: Scrollbar(
        // controller: scrollController,
        child: SingleChildScrollView(
          // controller: scrollController,
          child: Center(
            child:
                // _converWidgetList.value.isEmpty
                //     ?
                Container(
              child: Column(children: [
                ...listDataDokter
                    .map((e) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getActualX(x: 10, context: context),
                              vertical: getActualY(y: 10, context: context)),
                          child: CardConsultation(
                              doctor: e,
                              onTap: () {
                                ref.read(currentRoomIdProvider.notifier).state =
                                    e['id'];
                                Navigator.pushNamed(context, roomChatRoute);
                              }),
                        ))
                    .toList(),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: primaryMainColor),
                  padding: EdgeInsets.symmetric(
                      horizontal: getActualX(x: 10, context: context),
                      vertical: getActualY(y: 10, context: context)),
                  child: Center(
                      child: Text(
                    "Ongoing Chat",
                    // style: Constant.stylewhiteSmallMedium(context: context),
                  )),
                ),
                Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: _converWidgetList.value)),
              ]),
            ),
            // ? TextButton(
            //     onPressed: () {
            // ref.read(currentRoomIdProvider.notifier).state = "121";
            // Navigator.pushNamed(context, roomChatRoute);
            //     },
            //     child: Text("New CHAT"))
            // :
          ),
        ),
      ),
    );
  }
}