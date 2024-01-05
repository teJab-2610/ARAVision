class Exercise {
  final String image;
  final String description;
  final String name;

  Exercise(
      {required this.image, required this.name, required this.description});

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
        image: json['image'],
        name: json['name'],
        description: json['description']);
  }
}
