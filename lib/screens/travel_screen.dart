import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:log_in_form_flutter/bloc/destination/destination_bloc.dart';
import 'package:log_in_form_flutter/bloc/destination/destination_event.dart';
import 'package:log_in_form_flutter/bloc/destination/destination_state.dart';
import 'package:log_in_form_flutter/models/models.dart';

import '../models/travel_offer_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DestinationBloc()..add(DestinationLoadEvent()),
      child: Scaffold(
        appBar: AppBar(elevation: 0, leading: const Icon(Icons.search), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.flag_circle),
            onPressed: () {},
          ),
        ]),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 28.0,
                bottom: 10,
              ),
              child: Text(
                'Hey Andrea!',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 28.0,
                bottom: 20.0,
              ),
              child: Text(
                'Where would you like \nto travel today?',
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(30),
                          child: Container(
                            color: Colors.grey.shade100,
                            child: const Icon(
                              Icons.airplanemode_active,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Flight'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(30),
                          child: Container(
                            color: Colors.grey.shade100,
                            child: const Icon(
                              Icons.train,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Train'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(30),
                          child: Container(
                            color: Colors.grey.shade100,
                            child: const Icon(
                              Icons.directions_boat,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Cruise'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 28.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(30),
                          child: Container(
                            color: Colors.grey.shade100,
                            child: const Icon(
                              Icons.bus_alert,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Bus'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(
                left: 28.0,
                bottom: 20,
              ),
              child: Text(
                'Top Destinations:',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            const GridCount(),
          ],
        ),
      ),
    );
  }
}

class GridCount extends StatelessWidget {
  const GridCount({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: masonryLayout(context),
    );
  }
}

Widget masonryLayout(BuildContext context) {
  return BlocBuilder<DestinationBloc, DestinationState>(
    builder: (context, destinationState) {
      if (destinationState.status == DestinationStateStatus.loading) {
        return const Center(child: CircularProgressIndicator());
      }
      return MasonryGridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisSpacing: 10,
        mainAxisSpacing: 8,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: destinationState.destinations?.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => OfferDetails(
                    model: destinationState.destinations?[index] ?? TravelOffer(),
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    destinationState.destinations?[index].image ?? 'Image',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          destinationState.destinations?[index].title ?? 'Title',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.my_location_outlined,
                              color: Colors.white,
                            ),
                            Flexible(
                              child: Text(
                                destinationState.destinations?[index].location ?? 'Description',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Chip(
                      backgroundColor: Colors.white,
                      label: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            destinationState.destinations?[index].rating ?? 'Rating',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
