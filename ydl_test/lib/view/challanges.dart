import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../modal/challenges_modal.dart';

class Challenges extends StatefulWidget {
  const Challenges({super.key});

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  List<ChallengesModal> ofchallenges = [
    ChallengesModal(
        image: "assets/images/fitness.png",
        isactive: "Active",
        title: "21-days Fitness Challenge"),
    ChallengesModal(
        image: "assets/images/fitness_one.jpeg",
        isactive: "Inactive",
        title: "Healthy Heroes Challenge"),
    ChallengesModal(
        image: "assets/images/fitness_two.jpeg",
        isactive: "Active",
        title: "21-days Fitness Challenge"),
  ];

  List<ExpiredChallenges> ofExpiredchallenges = [
    ExpiredChallenges(
        activestatus: "Expired",
        image: "assets/images/fitness.png",
        title: "Fit Hour Challenge"),
    ExpiredChallenges(
        activestatus: "Expired",
        image: "assets/images/fitness.png",
        title: "10 Days Challenge"),
    ExpiredChallenges(
        activestatus: "Expired",
        image: "assets/images/fitness.png",
        title: "Fit Hour Challenge"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              width: 500,
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ofchallenges.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Card(
                            elevation: 5,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 25,
                                  width: 70,
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(10))),
                                  child: Text(
                                    ofchallenges[index].isactive,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        flex: 4,
                                        child: Text(ofchallenges[index].title)),
                                    const Icon(Icons.more_vert_outlined)
                                  ],
                                ),
                                Container(
                                  height:
                                      MediaQuery.sizeOf(context).height / 10,
                                  width: MediaQuery.sizeOf(context).width / 2.1,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                    ofchallenges[index].image,
                                  ))),
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.calendar_month),
                                    Flexible(
                                        child: Text(
                                      "12 Aug 2023 - 02 Sep 2023",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Expired Challenges",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.more_vert_outlined)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 2.4,
              child: ListView.builder(
                  itemCount: ofExpiredchallenges.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      width: MediaQuery.sizeOf(context).width / 1.7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Card(
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                ofExpiredchallenges[index].activestatus,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                ofExpiredchallenges[index].title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 120,
                              width: MediaQuery.sizeOf(context).width,
                              child: Image.asset(
                                ofExpiredchallenges[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Icon(Icons.calendar_month),
                                ),
                                Text("12 Aug 2023 - 02 Sep 2023")
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
