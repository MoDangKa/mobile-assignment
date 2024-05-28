class Fibonacci {
  int index;
  int number;
  String sharp;

  Fibonacci({
    required this.index,
    required this.number,
    required this.sharp,
  });

  factory Fibonacci.fromJson(Map<String, dynamic> json) => Fibonacci(
        index: json["index"],
        number: json["number"],
        sharp: json["sharp"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "number": number,
        "sharp": sharp,
      };
}
