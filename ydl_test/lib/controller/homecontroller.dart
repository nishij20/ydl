
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ydl_test/modal/teams_modal.dart';
import 'package:ydl_test/view/api_manager.dart';

class HomeController extends ChangeNotifier {
  final ApiManager _service = ApiManager();

  TeamModal? teamsModal;

  List<Data> dataResponse = [];

  Data? highestPointParticipant;
  fetchChallenge() async {
    try {
      var response = await _service.post(
          "https://yourdigitallift.com/api/v1/app_challenge/view-team-participants/",
          data: FormData.fromMap({"TeamID": 30, "Type": "ALL"}));
      if (response.statusCode == 200) {
        teamsModal = TeamModal.fromJson(response.data);
       
        dataResponse = List<Data>.from(teamsModal!.data!);

        if (dataResponse.isNotEmpty) {
          highestPointParticipant = dataResponse.reduce((current, next) =>
              current.participantPoints > next.participantPoints
                  ? current
                  : next);
        }

        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
