import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ydl_test/controller/homecontroller.dart';
import 'package:ydl_test/modal/teams_modal.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<HomeController>().fetchChallenge();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 30,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xff116B8E), Color(0xff43B72E)])),
            child: const Text(
              "21 Days Fatloss Challenge",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: ListView(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 80,
                    // width: MediaQuery.sizeOf(context).width / 1.1,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Total Points"),
                              Text(context
                                      .watch<HomeController>()
                                      .highestPointParticipant
                                      ?.participantPoints
                                      .toString() ??
                                  "N/A")
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.sizeOf(context).width / 1.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Text(
                                      "Player of the Day",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Text(context
                                          .watch<HomeController>()
                                          .highestPointParticipant
                                          ?.participantName ??
                                      "N/A"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(context
                                            .watch<HomeController>()
                                            .highestPointParticipant
                                            ?.participantProfileImage ??
                                        'https://www.selectmarket.ae/wp-content/uploads/2016/05/5ed0bc59411f1356d4fdf40b_dummy-person.png'),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 2,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.star),
                                    Text("LEADBOARD")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Card(
                          elevation: 2,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [Icon(Icons.star), Text("POST")],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 200),
                    child: Text(
                      "Team Members",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  context.watch<HomeController>().dataResponse.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: context
                              .watch<HomeController>()
                              .dataResponse
                              .length,
                          itemBuilder: (context, index) {
                            Data teamsResponse = context
                                .watch<HomeController>()
                                .dataResponse[index];
                            return Card(
                              //color: Colors.white,
                              elevation: 2,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(teamsResponse
                                          .participantProfileImage ??
                                      "https://www.selectmarket.ae/wp-content/uploads/2016/05/5ed0bc59411f1356d4fdf40b_dummy-person.png"),
                                ),
                                title: Text(
                                  teamsResponse.participantName ?? 'NA',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    teamsResponse.participantType ?? 'NA',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                    ),
                                    
                                    ),
                                trailing: SizedBox(
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(teamsResponse.participantPoints
                                          .toString(),style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12
                                          ),),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                        const Icon(Icons.chevron_right,)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
