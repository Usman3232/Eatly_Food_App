import 'package:flutter/cupertino.dart';

class FoodDetailIngrediantsModal {
  final Color color;
  final String image;

  FoodDetailIngrediantsModal({required this.color, required this.image});
}

List<FoodDetailIngrediantsModal> fooddetailingredients_modal = [
  FoodDetailIngrediantsModal(
    color: Color(0xffEDCFDD),
    image: "assets/images/Redonion.png",
  ),
  FoodDetailIngrediantsModal(
    color: Color(0xffF7D3B2),
    image: "assets/images/Carrot.png",
  ),
  FoodDetailIngrediantsModal(
    color: Color(0xffF7B4A9),
    image: "assets/images/Tomato.png",
  ),
  FoodDetailIngrediantsModal(
    color: Color(0xffB9DCAB),
    image: "assets/images/Сucumber.png",
  ),
];
