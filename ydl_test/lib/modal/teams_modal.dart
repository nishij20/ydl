class TeamModal {
  String? extraParam;
  String? message;
  String? statusCode;
  List<Data>? data;
  String? status;

  TeamModal(
      {this.extraParam, this.message, this.statusCode, this.data, this.status});

  TeamModal.fromJson(Map<String, dynamic> json) {
    extraParam = json["extra_param"];
    message = json["message"];
    statusCode = json["status_code"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["extra_param"] = extraParam;
    _data["message"] = message;
    _data["status_code"] = statusCode;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["status"] = status;
    return _data;
  }
}

class Data {
  int? participantUserId;
  String? participantName;
  String? participantProfileImage;
  String? participantType;
  String? participantLevel;
  dynamic? participantPoints;

  Data(
      {this.participantUserId,
      this.participantName,
      this.participantProfileImage,
      this.participantType,
      this.participantLevel,
      this.participantPoints});

  Data.fromJson(Map<String, dynamic> json) {
    participantUserId = json["ParticipantUserID"];
    participantName = json["ParticipantName"];
    participantProfileImage = json["ParticipantProfileImage"];
    participantType = json["ParticipantType"];
    participantLevel = json["ParticipantLevel"];
    participantPoints = json["ParticipantPoints"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ParticipantUserID"] = participantUserId;
    _data["ParticipantName"] = participantName;
    _data["ParticipantProfileImage"] = participantProfileImage;
    _data["ParticipantType"] = participantType;
    _data["ParticipantLevel"] = participantLevel;
    _data["ParticipantPoints"] = participantPoints;
    return _data;
  }
}
