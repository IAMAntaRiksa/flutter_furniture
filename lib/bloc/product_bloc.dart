import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecom/repository/model/product_model.dart';
import 'package:flutter_ecom/repository/network/client_api_response.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiClientResponse _apiClientResponse = ApiClientResponse();
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>(_onProduct);
  }

  FutureOr<void> _onProduct(
      GetProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      List<Product>? product = await _apiClientResponse.fetchProduct();

      if (product?.isNotEmpty ?? false) {
        emit(ProductLoaded(product: product ?? []));
      }
    } catch (e) {
      emit(const ProductError('Faild to get Product'));
    }
  }
}
