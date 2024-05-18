import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ydl_test/view/challanges.dart';
import 'package:ydl_test/view/home.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentindex = 0;
  List pages = [const Home(), const Challenges(), const Home()];
  void onTap(int index) {
    currentindex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          elevation: 3,
          onTap: (value) {
            onTap(value);
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_max_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Community"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
      backgroundColor: const Color(0xffCCCCCC),
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.white,
        icon: Icons.add,
        buttonSize: const Size(60, 60),
        children: [
          SpeedDialChild(
              backgroundColor: Colors.green,
              shape: const CircleBorder(),
              visible: true,
              label: "Set as Score Keeper",
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              child: const Icon(
                Icons.person_search,
                color: Colors.white,
              )),
          SpeedDialChild(
              backgroundColor: Colors.green,
              shape: const CircleBorder(),
              visible: true,
              label: "Set as Team Owner",
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              child: const Icon(
                Icons.person_search,
                color: Colors.white,
              )),
          SpeedDialChild(
              backgroundColor: Colors.green,
              shape: const CircleBorder(),
              visible: true,
              label: "Add Participants",
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Team 01"),
        leading: const Icon(Icons.arrow_back_ios),
        automaticallyImplyLeading: true,
        actions: const [
          Icon(
            Icons.search_rounded,
            size: 30,
          ),
          Icon(Icons.more_vert_outlined)
        ],
      ),
      body: pages[currentindex],
    );
  }
}
