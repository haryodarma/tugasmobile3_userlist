import 'dart:convert';

import 'package:c2_haryo_191_userlist/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthC extends GetxController {
  Uri baseUrl = Uri.parse(
      "https://user-list-447dc-default-rtdb.asia-southeast1.firebasedatabase.app");

  User? curentUser;
  List prodi = [
    {"kode": "01", "nama": "Ilmu Komputer"},
    {"kode": "02", "nama": "Design Komunikasi Visual"},
    {"kode": "03", "nama": "Teknologi Informasi"},
    {"kode": "04", "nama": "Manajemen"},
    {"kode": "05", "nama": "Farmasi"},
  ];
  String? kodeProdi;
  RxBool userItem = false.obs;

  TextEditingController searchUserC = TextEditingController();
  RxString searchUser = "".obs;

// LOGIN
  RxBool hover = false.obs;
  TextEditingController namaLogin = TextEditingController();
  TextEditingController passLogin = TextEditingController();
  RxBool obscureLogin = true.obs;
  final formState = GlobalKey<FormState>();

// REGISTER
  final formStateRegister = GlobalKey<FormState>();
  TextEditingController namaRegister = TextEditingController();
  TextEditingController nimRegister = TextEditingController();
  TextEditingController ipkRegister = TextEditingController();
  TextEditingController passwordRegister = TextEditingController();
  RxString kelaminRegister = "".obs;
  RxString semesterRegister = "".obs;
  RxString prodiRegister = "".obs;
  RxBool obsecureRegister = true.obs;

// UPDATE
  final formStateUpdate = GlobalKey<FormState>();
  TextEditingController namaUpdate = TextEditingController();
  TextEditingController ipkUpdate = TextEditingController();
  TextEditingController passwordUpdate = TextEditingController();
  RxString kelaminUpdate = "".obs;
  RxString semesterUpdate = "".obs;
  RxString prodiUpdate = "".obs;
  RxBool obsecureUpdate = true.obs;

  Future<List> getAllUser() async {
    Uri url = Uri.parse("${baseUrl}/users/user.json");
    List users = [];
    await http.get(url).then((res) {
      var data = jsonDecode(res.body) as Map<String, dynamic>;

      data.forEach(
        (key, value) {
          users.add({
            "id": key,
            "nama": value["nama"],
            "nim": value["nim"],
            "kelamin": value["kelamin"],
            "prodi": value["prodi"],
            "semester": value["semester"],
            "ipk": value["ipk"],
            "password": value["password"]
          });
        },
      );
    });
    return users;
  }

  Future register() async {
    Uri url = Uri.parse("${baseUrl}/users/user.json");
    String tahun = await DateTime.now().year.toString();
    var allUser = await getAllUser();
    int nim = int.parse("$tahun${kodeProdi}0000") + allUser.length + 1;

    Map<String, dynamic> data = {
      "nama": namaRegister.text,
      "nim": nim.toString(),
      "kelamin": kelaminRegister.value,
      "prodi": prodiRegister.value,
      "semester": semesterRegister.value,
      "ipk": ipkRegister.text,
      "password": passwordRegister.text
    };

    await http.post(url, body: json.encode(data));
  }

  Future login() async {
    Uri url = Uri.parse("${baseUrl}/users/user.json");
    bool loginStatus = false;
    await http.get(url).then(
      (res) {
        var users = json.decode(res.body) as Map<String, dynamic>;
        users.forEach((key, value) {
          if (value["nama"] == namaLogin.text &&
              value["password"] == passLogin.text) {
            try {
              curentUser = User(
                  id: key,
                  nama: value["nama"],
                  nim: value["nim"],
                  kelamin: value["kelamin"],
                  prodi: value["prodi"],
                  ipk: value["ipk"],
                  semester: value["semester"]);
            } catch (e) {
              print(e);
            }

            loginStatus = true;
          }
        });
      },
    );
    return loginStatus;
  }

  Future deleteUser(String id) async {
    if (id == "-O8HAIlbNiUa_Qm-HBFB") return false;
    Uri url = Uri.parse("${baseUrl}/users/user/${id}.json");
    await http.delete(url);
    return true;
  }

  //  {required String id,
  // required nama,
  // required String ipk,
  // required String password}

  Future updateData(id) async {
    Uri url = Uri.parse("${baseUrl}/users/user/$id.json");
    Map<String, dynamic> data = {
      "nama": namaUpdate.text,
      "kelamin": kelaminUpdate.value,
      "prodi": prodiUpdate.value,
      "semester": semesterUpdate.value,
      "ipk": ipkUpdate.text,
      "password": passwordUpdate.text
    };

    await http.patch(url, body: json.encode(data));

    curentUser = User(
        id: curentUser!.id,
        nama: namaUpdate.text,
        nim: curentUser!.nim,
        kelamin: kelaminUpdate.value,
        prodi: prodiUpdate.value,
        ipk: ipkUpdate.text,
        semester: semesterUpdate.value);
  }
}
