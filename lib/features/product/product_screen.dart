import 'package:ecommerce_task/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../model/product.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: context.dynamicHeight(0.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: context.normalRadius,
                      bottomRight: context.normalRadius,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(product.images!.first),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //back button
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.dynamicHeight(0.05)),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        product.title ?? '',
                        style: context.textTheme.headline6,
                      ),
                      SizedBox(
                        width: context.dynamicWidth(0.1),
                      ),
                      Text(
                        '\$${product.price}',
                        style: context.textTheme.headline6,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.01),
                  ),
                  Text(
                    product.description ?? '',
                    style: context.textTheme.headline6,
                  ),
                ],
              ),
            ),

            //add to cart button
            ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(CartEventAddToCart(product));
                },
                child: const Text('Add to Cart'))
          ],
        ),
      ),
    );
  }
}
