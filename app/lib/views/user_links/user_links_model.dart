import 'dart:convert';

AcceptedInvites invitesFromJson(String str) => AcceptedInvites.fromJson(json.decode(str));

String invitesToJson(AcceptedInvites data) => json.encode(data.toJson());

class AcceptedInvites {
    List<Invitee> invitees;

    AcceptedInvites({
        required this.invitees,
    });

    factory AcceptedInvites.fromJson(Map<String, dynamic> json) => AcceptedInvites(
        invitees: List<Invitee>.from(json["invitees"].map((x) => Invitee.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "invitees": List<dynamic>.from(invitees.map((x) => x.toJson())),
    };
}

class Invitee {
    String name;
    String number;
    String id;

    Invitee({
        required this.name,
        required this.number,
        required this.id,
    });

    factory Invitee.fromJson(Map<String, dynamic> json) => Invitee(
        name: json["name"],
        number: json["number"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "number": number,
        "_id": id,
    };
}