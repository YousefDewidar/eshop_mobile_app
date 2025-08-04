import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/data/models/offer_model.dart';
import 'package:rfaye3/features/main/presentation/view_model/offers_cubit/offers_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_widgets/offer_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OfferListView extends StatelessWidget {
  const OfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        if (state is OffersSuccess) {
          return CarouselSlider(
            options: CarouselOptions(
              height: 165,
              viewportFraction: 1,
              autoPlay: true,
            ),
            items:
                state.offers.map((off) {
                  return Builder(
                    builder: (BuildContext context) {
                      return OfferCard(offer: off);
                    },
                  );
                }).toList(),
          );
        } else if (state is OffersLoading) {
          Skeletonizer(
            enabled: true,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 158,
                viewportFraction: 0.9,
                autoPlay: true,
              ),
              items: [
                ...List.generate(
                  3,
                  (index) => Builder(
                    builder: (BuildContext context) {
                      return OfferCard(
                        offer: OfferModel(
                          id: "id",
                          name: "name",
                          description: "description",
                          coverUrl: "coverUrl",
                          createdAt: DateTime(2000),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: Text("لا يوجد عروض", textAlign: TextAlign.center),
        );
      },
    );
  }
}
