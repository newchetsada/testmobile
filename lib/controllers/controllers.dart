import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:testmobile/models/person.dart';
import 'package:http/http.dart' as Http;

class personController extends GetxController {
  RxList person = [].obs;
  RxList province = [].obs;

  @override
  void onInit() {
    super.onInit();
    getProvince();
    fetchExample();
  }

  void fetchExample() {
    var data = [
      Person(
          name: 'สายหยุด สมใจ',
          citizen: '1234567890123',
          tel: '0987654321',
          address: '123 หมู่ 1',
          tambon: 'จัตุจักร',
          amphur: 'จัตุจักร',
          province: 'กรุงเทพมหานคร',
          postcode: '10200'),
      Person(
          name: 'ยอดรัก ใจดี',
          citizen: '1234567890123',
          tel: '0987654321',
          address: '123 หมู่ 1',
          tambon: 'จัตุจักร',
          amphur: 'จัตุจักร',
          province: 'กรุงเทพมหานคร',
          postcode: '10200')
    ];
    person.addAll(data);
  }

  void addPerson(
      name, citizen, tel, address, tambon, amphur, province, postcode) {
    person.add(Person(
        name: name ?? '',
        citizen: citizen ?? '',
        tel: tel ?? '',
        address: address ?? '',
        tambon: tambon ?? '',
        amphur: amphur ?? '',
        province: province ?? '',
        postcode: postcode ?? ''));
  }

  void delPerson(id) {
    person.removeAt(id);
  }

  Future getProvince() async {
    final response = await Http.get(
      Uri.parse(
          'https://raw.githubusercontent.com/kongvut/thai-province-data/master/api_province.json'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      province.value = jsonResponse.map((m) => Province.fromJson(m)).toList();
      // print(province);

      return response;
    }
  }
}
