
import 'package:flutter/material.dart';

class AddToCartItem extends StatelessWidget {
  const AddToCartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 125,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                "https://images.unsplash.com/photo-1648413653877-ade5eefd2f1b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8fA%3D%3D",
                height: 125,
                width: 125,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "CEO Man Luxury Perfume - 100ML",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Text("Eau De Perfume"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  Text("\$499"),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text("\$899"),
                                  )
                                ],
                              ),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.remove),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 22.0),
                                      child: Text("1"),
                                    ),
                                    Icon(Icons.add),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const Icon(Icons.delete)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


