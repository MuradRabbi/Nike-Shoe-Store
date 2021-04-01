class NikeShoes{
  final String model;
  final double oldPrice;
  final double currentPrice;
  final int modelNumber;
  final List<String> images;
  final int color;

  NikeShoes({
    this.model,
    this.oldPrice,
    this.currentPrice,
    this.modelNumber,
    this.images,
    this.color
});
}


final shoes = <NikeShoes> [
  NikeShoes(
    model: "AIR MAX 90 EZ BLACK",
    oldPrice: 299,
    currentPrice: 149,
    images: [
      "assets/images/shoes1_1.png",
      "assets/images/shoes1_2.png",
      "assets/images/shoes1_3.png",
    ],
    modelNumber: 90,
    color: 0xfff6f6f6,
  ),
  NikeShoes(
      model: "AIR MAX 95 RED ",
      oldPrice: 299,
      currentPrice: 349,
      images: [
        "assets/images/shoes2_1.png",
        "assets/images/shoes2_2.png",
        "assets/images/shoes2_3.png",
      ],
      modelNumber: 95,
      color: 0xfffeefef,
  ),
  NikeShoes(
      model: "AIR MAX 270 GOLD",
      oldPrice: 599,
      currentPrice: 349,
      images: [
        "assets/images/shoes3_1.png",
        "assets/images/shoes3_2.png",
        "assets/images/shoes3_3.png",
      ],
      modelNumber: 270,
    color: 0xfffef7ed,
  ),
  NikeShoes(
      model: "AIR MAX 98 FREE",
      oldPrice: 299,
      currentPrice: 149,
      images: [
        "assets/images/shoes4_1.png",
        "assets/images/shoes4_2.png",
        "assets/images/shoes4_3.png",
      ],
      modelNumber: 98,
      color: 0xffedf3ef,
  )
];