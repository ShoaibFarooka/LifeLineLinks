class Invites {
  List<Invite> invites;

  Invites({
    required this.invites,
  });

  factory Invites.fromJson(List<dynamic> json) {
    List<Invite> invites = json.map((e) => Invite.fromJson(e)).toList();
    return Invites(invites: invites);
  }
}

class Invite {
  String inviteId;
  InvitedBy invitedBy;

  Invite({
    required this.inviteId,
    required this.invitedBy,
  });

  factory Invite.fromJson(Map<String, dynamic> json) {
    return Invite(
      inviteId: json['inviteId'],
      invitedBy: InvitedBy.fromJson(json['invitedBy']),
    );
  }
}

class InvitedBy {
  String id;
  String name;
  String number;

  InvitedBy({
    required this.id,
    required this.name,
    required this.number,
  });

  factory InvitedBy.fromJson(Map<String, dynamic> json) {
    return InvitedBy(
      id: json['_id'],
      name: json['name'],
      number: json['number'],
    );
  }
}
