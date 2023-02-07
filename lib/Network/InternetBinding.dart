import 'package:get/get.dart';

import 'NetworkManager.dart';

class InternetBinding extends Bindings{

  // dependence injection attach our class.
  @override
  void dependencies() {
    // TODO: implement dependencies
    NetworkManager fdfd= Get.put(NetworkManager());

    // Get.lazyPut< NetworkManager>(() =>  NetworkManager());
  }

}
