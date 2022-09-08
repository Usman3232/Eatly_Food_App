import 'package:get/get.dart';

import '../modals/addnewcard.dart';

class ListController extends GetxController {
  List updateList = addnewCardList;

  void updateCard(NewCard addcard) {
    updateList.add(addcard);
    update();
  }
}
