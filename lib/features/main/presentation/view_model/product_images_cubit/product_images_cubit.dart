import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/product_images_cubit/product_images_state.dart';

class ProductImagesCubit extends Cubit<ProductImagesState> {
  ProductImagesCubit(this.homeRepo) : super(ProductImagesInitial());

  final HomeRepo homeRepo;

  Future<void> getAllProductImages({required String productId}) async {
    emit(ProductImagesLoading());
    final data = await homeRepo.getAllProductImages(pId: productId);
    data.fold(
      (failuer) {
        emit(ProductImagesFailure(message: failuer.message));
      },
      (images) {
        log(images.toString());
        emit(ProductImagesSuccess(images: images));
      },
    );
  }
}
