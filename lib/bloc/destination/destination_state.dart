// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:log_in_form_flutter/models/models.dart';

enum DestinationStateStatus {
  initial,
  loading,
  loadedSuccess,
  loadedError,
}

class DestinationState {
  DestinationStateStatus? status;
  List<TravelOffer>? destinations;

  DestinationState({
    this.status,
    this.destinations,
  });

  DestinationState copyWith({
    DestinationStateStatus? status,
    List<TravelOffer>? destinations,
  }) =>
      DestinationState(
        status: status ?? this.status,
        destinations: destinations ?? this.destinations,
      );
}
