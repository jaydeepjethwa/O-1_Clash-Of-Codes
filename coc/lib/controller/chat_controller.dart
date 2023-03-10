import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  late TextEditingController messageC;
  late FirebaseFirestore firestore;

  var arguments = Get.arguments;
  String id1 = "", id2 = "";
  String chatRoomId = "";


  @override
  void onInit() {
    super.onInit();
    fetchAllValues();
    intializeController();
  }

  void intializeController() {
    messageC = TextEditingController();
    firestore = FirebaseFirestore.instance;
    chatRoomId = getRoomId();
  }

  void fetchAllValues() {
    id1 = arguments[0]["id1"];
    id2 = arguments[1]["id2"];
  }

  String getRoomId() {
    if (id1[0].codeUnitAt(0) < id2[0].codeUnitAt(0)) {
      return "$id1/$id2";
    } else {
      return "$id2/$id1";
    }
  }

  Future addMessage() async {
    if (messageC.value.text == "") {
      return;
    }
    Map<String, dynamic> message = {
      "sendBy": id1,
      "message": messageC.value.text,
      "time": FieldValue.serverTimestamp(),
    };

    await firestore
        .collection("chatroom")
        .doc(chatRoomId)
        .collection("chats")
        .add(message);
    messageC.text = "";
  }

  @override
  void onClose() {
    super.onClose();
    disposeController();
  }

  void disposeController() {
    messageC.dispose();
  }
}
