import 'package:ecommerce_task/features/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_task/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import 'widget/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            return _onCartLoadedState(state.cart, context);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Column _onCartLoadedState(Cart cart, BuildContext context) {
    return Column(
      children: [
        ProductList(
          items: cart.items,
        ),
        Container(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: Text('Total: \ ',
                    style: context.textTheme.headline6!
                        .copyWith(color: Colors.red)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.secondary,
                ),
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
