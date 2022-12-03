import 'package:ecommerce_task/core/navigation/navigation_constants.dart';
import 'package:ecommerce_task/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    return Scaffold(
      body: PaddingHigh(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome to Ecommerce\n Enter your email for login ',
                textAlign: TextAlign.center,
                style: context.textTheme.headline5!.copyWith(height: 2)),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: context.dynamicHeight(0.05)),
            //submit button
            ElevatedButton(
              onPressed: () {
                context
                    .read<CartBloc>()
                    .add(CartEventRegisterEmail(_emailController.text));
                context.navigation.pushNamedAndRemoveUntil(
                    NavigationConstants.mainScreen, (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.primary,
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
