import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_task/repositories/remote_repository.dart';
import 'package:meta/meta.dart';

import '../../../model/product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RemoteRepository _remoteRepository;
  HomeBloc(this._remoteRepository) : super(HomeInitial()) {
    on<HomeEventLoadProducts>(_onHomeEventLoadProducts);
  }

  Future<FutureOr<void>> _onHomeEventLoadProducts(
      HomeEventLoadProducts event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      final products = await _remoteRepository.getProducts();
      emit(HomeLoaded(products));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
