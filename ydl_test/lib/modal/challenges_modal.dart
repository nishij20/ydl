

class ChallengesModal {
  String isactive;
  String title;
  String image;

  ChallengesModal(
      {required this.image, required this.isactive, required this.title});
}

class ExpiredChallenges {
  String activestatus;
  String title;
  String image;
  ExpiredChallenges(
      {required this.activestatus, required this.image, required this.title});
}
