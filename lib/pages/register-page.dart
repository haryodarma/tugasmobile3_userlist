import 'package:c2_haryo_191_userlist/controllers/authC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height - 100;
    final authC = Get.put(AuthC());
    return Scaffold(
      appBar: AppBar(
        actions: [
          Hero(
              tag: "flutter-logo",
              child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed("/"),
                  child: FlutterLogo())),
          SizedBox(
            width: 25,
          ),
        ],
      ),
      body: Obx(
        () => Container(
          height: maxHeight + 100,
          child: Stack(children: [
            Positioned(
              left: 30,
              bottom: -150,
              child: Hero(
                tag: "bola-red",
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red[900],
                  ),
                  height: 300,
                  width: 300,
                ),
              ),
            ),
            Positioned(
              bottom: -250,
              left: -250,
              child: Hero(
                tag: "bola-orange",
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange[900],
                  ),
                  height: 450,
                  width: 450,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 80,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Selamat Datang",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              "Lengkapi Data Untuk Membuat Akun",
                              style: TextStyle(fontSize: 12),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: authC.formStateRegister,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black87),
                              controller: authC.namaRegister,
                              decoration: InputDecoration(
                                hoverColor: Colors.greenAccent,
                                floatingLabelStyle: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                label: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text("Nama"),
                                ),
                                // hintText: "Nama",
                                // hintStyle: TextStyle(color: Colors.black87),
                              ),
                              validator: (value) {
                                if (value == "")
                                  return "Nama Tidak Boleh Kosong";
                                if (value!.length < 4)
                                  return "Nama harus lebih dari 4 karakter";
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 10, left: 10),
                                    child: Text(
                                      "Pilih Jenis Kelamin",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black87),
                                    )),
                                RadioListTile(
                                  activeColor: Colors.blue,
                                  title: Text(
                                    "Pria",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87),
                                  ),
                                  value: "Pria",
                                  groupValue: authC.kelaminRegister.value,
                                  onChanged: (value) =>
                                      authC.kelaminRegister.value = value!,
                                ),
                                RadioListTile(
                                  activeColor: Colors.blue,
                                  title: Text(
                                    "Wanita",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87),
                                  ),
                                  value: "Wanita",
                                  groupValue: authC.kelaminRegister.value,
                                  onChanged: (value) =>
                                      authC.kelaminRegister.value = value!,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownMenu(
                                    textStyle: TextStyle(color: Colors.black87),
                                    hintText: "Pilih Prodi",
                                    dropdownMenuEntries: authC.prodi.map((e) {
                                      return DropdownMenuEntry(
                                          value: e["nama"], label: e["nama"]);
                                    }).toList(),
                                    onSelected: (value) {
                                      var prodi = authC.prodi.firstWhere(
                                        (e) => e["nama"] == value,
                                      );

                                      authC.kodeProdi = prodi["kode"];
                                      authC.prodiRegister.value = prodi["nama"];
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 10, left: 10),
                                    child: Text(
                                      "Pilih Semester",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black87),
                                    )),
                                RadioListTile(
                                  activeColor: Colors.blue,
                                  title: Text(
                                    "Ganjil",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  value: "Ganjil",
                                  groupValue: authC.semesterRegister.value,
                                  onChanged: (value) =>
                                      authC.semesterRegister.value = value!,
                                ),
                                RadioListTile(
                                  activeColor: Colors.blue,
                                  title: Text(
                                    "Genap",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  value: "Genap",
                                  groupValue: authC.semesterRegister.value,
                                  onChanged: (value) =>
                                      authC.semesterRegister.value = value!,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black87),
                              controller: authC.ipkRegister,
                              decoration: InputDecoration(
                                hoverColor: Colors.greenAccent,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                label: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text("IPK"),
                                ),
                                floatingLabelStyle: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              validator: (value) {
                                if (value == "") {
                                  return "IPK Tidak Boleh Kosong";
                                }

                                try {
                                  int.parse(authC.ipkRegister.text);
                                } catch (e) {
                                  return "IPK Harus Angka";
                                }

                                try {
                                  int value = int.parse(authC.ipkRegister.text);
                                  if (value > 4 || value < 0) {
                                    return " IPK harus diantara 0 - 4";
                                  }
                                } catch (e) {
                                  return " IPK harus diantara 0 - 4";
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.length < 4)
                                  return "Password harus lebih dari 4 karakter";
                              },
                              style: TextStyle(color: Colors.black87),
                              controller: authC.passwordRegister,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      authC.obsecureRegister.value =
                                          !authC.obsecureRegister.value;
                                    },
                                    icon: authC.obsecureRegister.value
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: Colors.red,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: Colors.red,
                                          )),
                                hoverColor: Colors.greenAccent,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                label: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text("Password"),
                                ),
                                floatingLabelStyle: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onHover: (value) => authC.hover.value = value,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              if (authC.formStateRegister.currentState!
                                  .validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      titleTextStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      contentTextStyle:
                                          TextStyle(color: Colors.white),
                                      title: Text("Daftarkan User?"),
                                      content: Row(
                                        children: [
                                          Container(
                                            height: 150,
                                            width: 150,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Nama"),
                                                Text("JENIS KELAMIN"),
                                                Text("PRODI"),
                                                Text("SEMESTER"),
                                                Text("IPK"),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 150,
                                            width: 20,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(":"),
                                                Text(":"),
                                                Text(":"),
                                                Text(":"),
                                                Text(":"),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 150,
                                            width: 150,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(authC.namaRegister.text),
                                                Text(authC
                                                    .kelaminRegister.value),
                                                Text(authC.prodiRegister.value),
                                                Text(authC
                                                    .semesterRegister.value),
                                                Text(authC.ipkRegister.text),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            authC.register().then(
                                                  (res) => Navigator.of(context)
                                                      .popAndPushNamed(
                                                          "/login"),
                                                );
                                          },
                                          child: Text(
                                            "Simpan",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    Colors.green),
                                          ),
                                        ),
                                        TextButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.red)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "Batal",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {}
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              alignment: Alignment.center,
                              height: authC.hover.value ? 50 : 40,
                              width: authC.hover.value ? 300 : 280,
                              decoration: BoxDecoration(
                                  boxShadow: authC.hover.value
                                      ? [
                                          BoxShadow(
                                              color: Colors.blue,
                                              blurRadius: 10)
                                        ]
                                      : [],
                                  borderRadius: BorderRadius.circular(100),
                                  color: authC.hover.value
                                      ? Colors.blue
                                      : Colors.transparent,
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: authC.hover.value
                                        ? Colors.white
                                        : Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Apakah anda sudah memiliki akun? "),
                        TextButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed("/login"),
                          child: Text("Login"),
                          style: ButtonStyle(
                              foregroundColor:
                                  WidgetStatePropertyAll(Colors.lightBlue)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
