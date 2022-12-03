import 'package:ecommerce_task/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../model/product.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc _homeBloc;
  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(HomeEventLoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<HomeBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  BlocBuilder<HomeBloc, HomeState> _buildBody() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return _onHomeLoadingState(context);
        } else if (state is HomeLoaded) {
          return _onHomeLoadedState(context, state);
        } else if (state is HomeError) {
          return _onHomeErrorState();
        } else {
          return Container();
        }
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Welcome to Ecommerce'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        Padding(
          padding: context.paddingLow,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _onHomeLoadedState(BuildContext context, HomeLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(title: 'Categories'),
        Categories(),
        TitleText(title: 'Latest'),
        BannerCard(),
        _buildProductList(context, state.products),
      ],
    );
  }

  Widget _onHomeErrorState() {
    return const Center(
      child: Text('Error'),
    );
  }

  Widget _onHomeLoadingState(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.dynamicWidth(0.1),
        height: context.dynamicWidth(0.1),
        child: const CircularProgressIndicator(),
      ),
    );
  }

  _buildProductList(BuildContext context, List<Product> products) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      child: Padding(
        padding: context.paddingLow,
        child: ListView.separated(
          itemCount: products.length,
          padding: context.horizontalPaddingLow,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
        ),
      ),
    );
  }
}
