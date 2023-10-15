class Offer {
  String type;
  int value;
  int? sliceValue;

  Offer({
    required this.type,
    required this.value,
    this.sliceValue,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        type: json["type"],
        value: json["value"],
        sliceValue: json["sliceValue"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
        "sliceValue": sliceValue,
      };
}
