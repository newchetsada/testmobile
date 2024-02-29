class Person {
  final String name;
  final String citizen;
  final String tel;
  final String address;
  final String tambon;
  final String amphur;
  final String province;
  final String postcode;

  Person(
      {required this.name,
      required this.citizen,
      required this.tel,
      required this.address,
      required this.tambon,
      required this.amphur,
      required this.province,
      required this.postcode});
}

class Province {
  final int id;
  final String? name_th;

  const Province({
    required this.id,
    required this.name_th,
  });

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id: json['id'],
      name_th: json['name_th'],
    );
  }
}
