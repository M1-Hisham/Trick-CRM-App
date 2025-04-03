import 'package:json_annotation/json_annotation.dart';

part 'create_meeting_request_body.g.dart';

@JsonSerializable()
class CreateMeetingRequestBody {
  String title;
  String location;
  int hostId;
  // List<Participant> participants;
  CreateMeetingRequestBody({
    required this.title,
    required this.location,
    required this.hostId,
    // required this.participants,
  });

  Map<String, dynamic> toJson() => _$CreateMeetingRequestBodyToJson(this);
}

// @JsonSerializable()
// class Participant {
//   String name;
//   int userId;

//   Participant({
//     required this.name,
//     required this.userId,
//   });
//   Map<String, dynamic> toJson() => _$ParticipantToJson(this);
// }
