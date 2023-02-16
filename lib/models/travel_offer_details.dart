import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:log_in_form_flutter/models/models.dart';

class OfferDetails extends StatefulWidget {
  const OfferDetails({super.key, required this.model});
  final TravelOffer model;

  @override
  State<OfferDetails> createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'assets/businessman3.png',
      'assets/businesswoman1.png',
      'assets/man1.png',
      'assets/man2.png',
    ];
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color.fromARGB(255, 0, 250, 17),
              size: 28,
            ),
          )),
      body: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 400.0, viewportFraction: 1),
                items: widget.model.pictures?.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            image: AssetImage(item),
                            fit: BoxFit.cover,
                          ));
                    },
                  );
                }).toList(),
              ),
//kl
              Padding(
                padding: const EdgeInsets.only(top: 350),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                              left: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    widget.model.title ?? '',
                                    style: const TextStyle(
                                      fontSize: 28,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 12.0),
                                      child: Icon(
                                        Icons.location_city,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        widget.model.location ?? '',
                                        style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Chip(
                              backgroundColor: Colors.grey.shade100,
                              label: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    widget.model.rating ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24.0,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.blue,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(widget.model.date ?? ''),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Stack(
                            children: List.generate(
                              imageList.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(
                                  left: 24.0,
                                  top: 8,
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(left: index * 25),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(imageList[index])),
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '+17 others recommend this',
                              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                            ),
                          ),
                        ],
                      ),
                      DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const TabBar(
                              labelColor: Colors.blue,
                              unselectedLabelColor: Colors.grey,
                              tabs: [
                                Tab(text: 'Tour Overview'),
                                Tab(text: 'Tour Plan'),
                              ],
                            ),
                            Container(
                              height: 160,
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: TabBarView(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                                    child: Text(
                                      widget.model.description ?? '',
                                      style: const TextStyle(fontSize: 14, color: Colors.blue, height: 1.5),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                                    child: Text(
                                      widget.model.tourPlan ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 30.0,
                                      left: 14,
                                    ),
                                    child: Text(
                                      'Total:',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 4.0,
                                      left: 14,
                                    ),
                                    child: Text(
                                      widget.model.price ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(flex: 4),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: Text('Reservation Confirmation: ${widget.model.title}:' '\n${widget.model.date}'),
                                    content: Text('Price: ${(widget.model.price ?? 0)}'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'Confirm'),
                                        child: const Text('Confirm'),
                                      ),
                                    ],
                                  ),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 0, 250, 17),
                                  ),
                                ),
                                child: const Text('Book Now'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
