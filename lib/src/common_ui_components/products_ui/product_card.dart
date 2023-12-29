import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final double cardWidth;
  final String offPercentage;
  final String productName;
  final String imageURL;
  final bool isLiked;
  final String price;
  final Function() onAdd;
  final Function() onLike;

  const ProductCard(
      {super.key,
      required this.id,
      required this.cardWidth,
      required this.offPercentage,
      required this.productName,
      required this.imageURL,
      required this.isLiked,
      required this.price,
      required this.onAdd,
      required this.onLike});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3.0),
      width: cardWidth,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green.withOpacity(.1)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(
                  "assets/images/oil3.jpg",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5, top: 5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.lightGreen.shade100,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "$offPercentage % OFF",
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(2),
            child: LayoutBuilder(
              builder: (_, constraints) {
                double availableWidth = constraints.maxWidth / 2;
                double iconWidth = availableWidth - (availableWidth / 2);
                double textWidth = availableWidth + (availableWidth / 2);
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: textWidth,
                      child: Text(
                        productName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      width: iconWidth,
                      child: IconButton(
                        onPressed: onLike,
                        icon: const Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 2),
            child: Row(
              children: [
                Text(
                  "\$$price",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "\$${int.parse(price) * 2}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          // LayoutBuilder(
          //   builder: (_, constrains) {
          //     return ElevatedButton(
          //       onPressed: onAdd,
          //       style: ButtonStyle(
          //           // backgroundColor:
          //           //     MaterialStateProperty.all(Colors.lightGreen),
          //           minimumSize: MaterialStateProperty.all(
          //               Size(constrains.maxWidth - 10, 30))),
          //       child: const Text("Add"),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
