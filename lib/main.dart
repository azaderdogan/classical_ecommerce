import 'package:ecommerce_task/core/client/api_client.dart';
import 'package:ecommerce_task/core/network/dio_network_manager.dart';
import 'package:ecommerce_task/features/home/home_screen.dart';
import 'package:ecommerce_task/features/main/main_screen.dart';
import 'package:ecommerce_task/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'features/cart/bloc/cart_bloc.dart';
import 'repositories/local_repository.dart';
import 'repositories/remote_repository.dart';

void main() {
  Hive.registerAdapter(CartAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => LocalRepository(),
        ),
        RepositoryProvider(
          create: (context) => RemoteRepository(ApiClient(DioNetworkManager())),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) =>
                CartBloc(RepositoryProvider.of<LocalRepository>(context))
                  ..add(CartEventLoadCart()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MainScreen(),
        ),
      ),
    );
  }
}
