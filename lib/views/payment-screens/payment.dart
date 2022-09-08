import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../modals/addnewcard.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import '../../utils/style.dart';
import 'addnewcard.dart';
class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: [
             SizedBox(
              height: 3*SizeConfig.heightMultiplier,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier*6,
                  width: SizeConfig.widthMultiplier*13,
                  child: Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20)),
                          depth: 4,
                          lightSource: LightSource.topLeft,
                          color: Colors.white),
                      child: Center(
                        child: IconButton(
                          icon: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child:  Icon(
                                Icons.arrow_back_ios,
                                size: SizeConfig.imageSizeMultiplier*6,
                                color: Colors.black87,
                              )),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    print(Get.arguments[3]);
                  },
                  child: Text(
                    'Payment',
                    style: tileStyle,
                  ),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 5,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose Card',
                  style: titleStyle,
                )),
            SizedBox(
              height: SizeConfig.heightMultiplier * 4,
            ),
            Row(
              children: [
                Container(
                  height: SizeConfig.heightMultiplier * 11,
                  width: SizeConfig.widthMultiplier * 16.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.8),
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: Center(
                    child: IconButton(
                      splashRadius: 50,
                      icon: Icon(
                        Icons.add,
                        size: SizeConfig.imageSizeMultiplier*6,
                      ),
                      onPressed: () {
                        Get.to(AddNewCard());
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 20 * SizeConfig.heightMultiplier,
                    width: double.infinity,
                    child: Scrollbar(
                      showTrackOnHover: true,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // itemCount: Get.arguments?[2].length,
                        itemCount: addnewCardList.length,
                        itemBuilder: (context, index) {
                          return AddCard1(CardHolderName: addnewCardList[index].CardHolderNumber, CardHolderNumber: addnewCardList[index].CardHolderName,);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class AddCard extends StatefulWidget {
//   AddCard({
//     Key? key,
//     required String CardHolderName,
//     required String CardHolderNumber,
//   }) : super(key: key);
//
//   @override
//   State<AddCard> createState() => _AddCardState(CardHolderNumber: '', CardHolderName: '');
// }

// class _AddCardState extends State<AddCard> {
//   // String name = Get.arguments[1];
//    final String? CardHolderName;
//   final String? CardHolderNumber;
//
//   _AddCardState({required this.CardHolderName,required this.CardHolderNumber});
//
//   @override
//   void initState() {
//     CardHolderName;
//     CardHolderNumber;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int? visibleCharacters = 4;
//     return Container(
//       margin: EdgeInsets.only(left: 15),
//       width: 50 * SizeConfig.widthMultiplier,
//       decoration: BoxDecoration(
//           color: Color(0xff323142), borderRadius: BorderRadius.circular(20)),
//       child: Column(
//         children: [
//           Container(
//             height: SizeConfig.heightMultiplier * 6,
//             decoration: BoxDecoration(
//                 color: AppColors.primarycolor,
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20))),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(
//                     Icons.wallet_rounded,
//                     color: Colors.white,
//                   ),
//                   Text(
//                     '${'••••  ' + CardHolderName.toString().split(' ').last}',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Card Holder",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13),
//                         ),
//                         SizedBox(
//                           height: SizeConfig.heightMultiplier * 0.5,
//                         ),
//                         Container(
//                           width: SizeConfig.widthMultiplier * 20,
//                           margin: EdgeInsets.only(
//                               left: SizeConfig.widthMultiplier * 1),
//                           child: Text(
//                             // "${Get.arguments[0]}",
//                             '${CardHolderNumber}',
//                             overflow: TextOverflow.ellipsis,
//                             softWrap: true,
//
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16),
//                           ),
//                         )
//                       ],
//                     ),
//                     Image.asset(
//                       'assets/images/CardImages/mastercard.png',
//                       height: SizeConfig.heightMultiplier * 5,
//                     )
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class AddCard1 extends StatelessWidget {
   AddCard1({Key? key,required this.CardHolderName,required this.CardHolderNumber}) : super(key: key);
   final String? CardHolderName;
   final String? CardHolderNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      width: 50 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          color: Color(0xff323142), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 6,
            decoration: BoxDecoration(
                color: AppColors.primarycolor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.wallet_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    '••••  ${CardHolderName!.split(' ').last}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Card Holder",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 0.5,
                        ),
                        Container(
                          width: SizeConfig.widthMultiplier * 20,
                          margin: EdgeInsets.only(
                              left: SizeConfig.widthMultiplier * 1),
                          child: Text(
                            // "${Get.arguments[0]}",
                            '${CardHolderNumber}',
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,

                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    Image.asset(
                      'assets/images/CardImages/mastercard.png',
                      height: SizeConfig.heightMultiplier * 5,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

