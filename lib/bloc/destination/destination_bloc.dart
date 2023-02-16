// ignore_for_file: unnecessary_null_comparison

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:log_in_form_flutter/models/models.dart';

import 'dart:async';

import 'destination_event.dart';
import 'destination_state.dart';

List<TravelOffer> offerList = [
  TravelOffer(
    image: 'assets/maldives_1.jpg',
    title: 'Maldives',
    location: 'Medhufushi, Republic of Maldives',
    rating: '4.8',
    pictures: [
      'assets/maldives_1.jpg',
      'assets/maldives_2.jpg',
      'assets/maldives_3.jpg',
      'assets/maldives_4.jpg',
    ],
    description: 'The Maldives is famous for a number of reasons, including its vibrant culture, pristine beaches, sprawling greenery, and fascinating landmarks.',
    tourPlan: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    price: '\$1495',
    date: '13 June - 20 June',
  ),
  TravelOffer(
    image: 'assets/mykonos_1.jpg',
    title: 'Greece',
    location: 'Mykonos, Greece',
    rating: '4.0',
    pictures: [
      'assets/mykonos_1.jpg',
      'assets/mykonos_2.jpg',
      'assets/mykonos_3.jpg',
      'assets/mykonos_4.jpg',
    ],
    description: 'Spend at least seven days in Greece, and you will be able to comfortably explore Athens plus one or two Greek islands—pair Mykonos and Santorini, for example, or stick to the culture and cuisine of Crete.',
    tourPlan: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    price: '\$895',
    date: '13 Sep. - 20 Sep.',
  ),
  TravelOffer(
    image: 'assets/new_zealand_1.jpg',
    title: 'New Zealand',
    location: 'Lake Pukaki, New Zealand',
    rating: '4.2',
    pictures: [
      'assets/new_zealand_1.jpg',
      'assets/new_zealand_2.jpg',
      'assets/new_zealand_3.jpg',
      'assets/new_zealand_4.jpg',
    ],
    description: 'The best time to visit New Zealand is during the summer months of December to March, which bring long, bright and sunny days and temperatures of 16°C to 24°C. They are ideal for visiting the lovely beaches or enjoying the many outdoor activities available, such as hiking and mountain biking.',
    tourPlan: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    price: '\$1095',
    date: '13 Dec. - 20 Dec.',
  ),
  TravelOffer(
    image: 'assets/swiss_alps_1.jpg',
    title: 'Switzerland',
    location: 'Swiss Alps, Switzerland',
    rating: '5.0',
    pictures: [
      'assets/swiss_alps_1.jpg',
      'assets/swiss_alps_2.jpg',
      'assets/swiss_alps_3.jpg',
      'assets/swiss_alps_4.jpg',
    ],
    description: 'The Swiss Alps are home to some of the most dramatic scenery in the world. From mountain tops that is height will crane your neck to so many beautiful, isolated lakes that you will never want to leave.',
    tourPlan: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    price: '\$1295',
    date: '13 Nov. - 20 Nov.',
  ),
];

class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  DestinationBloc() : super(initialState()) {
    on<DestinationLoadEvent>(_load);
  }

  static DestinationState initialState() {
    return DestinationState(
      status: DestinationStateStatus.initial,
      destinations: [],
    );
  }

  Future<void> _load(DestinationLoadEvent event, Emitter<DestinationState> emit) async {
    emit(state.copyWith(status: DestinationStateStatus.loading));

    await Future.delayed(const Duration(milliseconds: 500));
    final result = offerList;

    if (result != null) {
      emit(state.copyWith(
        status: DestinationStateStatus.loadedSuccess,
        destinations: result,
      ));
    } else {
      emit(state.copyWith(status: DestinationStateStatus.loadedError));
    }
  }
}
