class Post {
  late int id;
  late String name;
  late String salary;
  late String age;

  Post(
      {required this.id,
        required this.name,
        required this.salary,
        required this.age});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        salary = json['salary'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
    "id": id,
    'name': name,
    'salary': salary,
    'age': age,
  };
}
