import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:intl/intl.dart";

class UpcomingBanner extends ConsumerWidget {
  const UpcomingBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final now = DateTime.now();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: height / 5,
            width: width / 3,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 230, 105),
                border: Border.all(color: Colors.white10),
                borderRadius: BorderRadius.circular(width / 20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat("EE").format(now).toString()),
                  Text(
                    DateFormat("d").format(now).toString(),
                    style: const TextStyle(
                        fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  Text(DateFormat("MMM").format(now).toString()),
                ],
              ),
            ),
          ),
          Container(
            height: height / 5,
            width: width / 1.7,
            decoration: BoxDecoration(
                color: const Color.fromARGB(8, 105, 188, 255),
                border: Border.all(color: Colors.white10),
                borderRadius: BorderRadius.circular(width / 20)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Upcoming Events",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.white30))),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Meow meow event",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "4 days",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.white30))),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tech",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "30 days",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
