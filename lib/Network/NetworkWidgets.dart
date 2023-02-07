import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'NetworkManager.dart';

final NetworkManager _networkManager = Get.find<NetworkManager>();

Widget networkUI() {
  return GetBuilder<NetworkManager>(
      builder: (builder) => Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          (_networkManager.connectionType == 0)?Icon(Icons.wifi_off,size: 15,color: Colors.red,):Icon(Icons.wifi,size: 15,color: Colors.green,),
          SizedBox(width: 5,),
          Text(
            (_networkManager.connectionType == 0) ? 'You are Offline' : 'You are Online',
            style: TextStyle(fontSize: 10, color: _networkManager.connectionType != 0 ? Colors.green : Colors.red),
            textAlign: TextAlign.center,
          ),

        ],
      ));
}
