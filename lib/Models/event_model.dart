class EventModel {
  String titel;
  String desc;
  int date;
  String id;
  String category;
  bool isFavorite;
  String userid;

  EventModel({
    required this.titel,
    required this.desc,
    required this.date,
    this.id = "",
    required this.category,
    this.isFavorite = false,
    required this.userid,
  });

 static EventModel fromjeson(Map<String, dynamic> json) {
    return EventModel(
      titel: json["titel"],
      desc: json["desc"],
      date: json["date"],
      id: json["id"],
      category: json["category"],
      isFavorite: json["isFavorite"],
      userid: json["userid"],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "titel": titel,
      "desc": desc,
      "date": date,
      "id": id,
      "category": category,
      "isFavorite": isFavorite,
      "userid": userid,
    };
  }
}
