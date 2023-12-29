import 'package:flutter/material.dart';
import 'package:rdveda/src/common_ui_components/products_ui/product_card.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 2,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) {
          return ProductCard(
            id: index,
            cardWidth: 200,
            offPercentage: "200",
            productName: "Olive Oil",
            imageURL: "imageURL",
            isLiked: true,
            price: "100",
            onAdd: () {},
            onLike: () {},
          );
        },
      ),
    );
  }
}
