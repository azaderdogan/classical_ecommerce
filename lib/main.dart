import 'package:ecommerce_task/core/client/api_client.dart';
import 'package:ecommerce_task/core/navigation/navigation_constants.dart';
import 'package:ecommerce_task/core/network/dio_network_manager.dart';
import 'package:ecommerce_task/features/home/home_screen.dart';
import 'package:ecommerce_task/features/main/main_screen.dart';
import 'package:ecommerce_task/features/product/product_screen.dart';
import 'package:ecommerce_task/features/welcome/welcome_screen.dart';
import 'package:ecommerce_task/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'features/cart/bloc/cart_bloc.dart';
import 'features/home/bloc/home_bloc.dart';
import 'model/cart_item.dart';
import 'model/product.dart';
import 'repositories/local_repository.dart';
import 'repositories/remote_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(CartAdapter());
  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(ProductAdapter());
  await LocalRepository.openBoxes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          lazy: false,
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
          BlocProvider(
            lazy: false,
            create: (context) =>
                HomeBloc(RepositoryProvider.of<RemoteRepository>(context)),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          initialRoute: NavigationConstants.welcomeScreen,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case NavigationConstants.mainScreen:
                return MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                );
              case NavigationConstants.welcomeScreen:
                return MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                );
              case NavigationConstants.productDetail:
                return MaterialPageRoute(
                  builder: (context) => SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: ModalRoute.of(context)!.animation!,
                        curve: Curves.ease,
                      ),
                    ),
                    child: ProductScreen(
                      product: settings.arguments as Product,
                    ),
                  ),
                );
              default:
                return MaterialPageRoute(
                  builder: (context) => SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: ModalRoute.of(context)!.animation!,
                          curve: Curves.ease,
                        ),
                      ),
                      child: const MainScreen()),
                );
            }
          },
        ),
      ),
    );
  }
}
