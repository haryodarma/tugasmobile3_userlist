import 'package:c2_haryo_191_userlist/controllers/authC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    double maxHeight = MediaQuery.of(context).size.height - 100;
    final authC = Get.put(AuthC());
    authC.kelaminUpdate.value = user["kelamin"];
    authC.prodiUpdate.value = user["prodi"];
    authC.semesterUpdate.value = user["semester"];
    authC.namaUpdate.text = user["nama"];
    authC.ipkUpdate.text = user["ipk"];
    authC.passwordUpdate.text = user["password"];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).popAndPushNamed("/home"),
            icon: Icon(Icons.home)),
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
          child: SingleChildScrollView(
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
                            "Update Data",
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            "Silahkan Update Data Anda",
                            style: TextStyle(fontSize: 12),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: authC.formStateUpdate,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black87),
                            controller: authC.namaUpdate,
                            decoration: InputDecoration(
                              hoverColor: Colors.greenAccent,
                              floatingLabelStyle: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
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
                              if (value == "") {
                                return "Nama Tidak Boleh Kosong";
                              }
                              if (value!.length < 4)
                                return "Nama harus lebih dari karakter";
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
                                selected: "Pria" == user["kelamin"],
                                activeColor: Colors.blue,
                                title: Text(
                                  "Pria",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black87),
                                ),
                                value: "Pria",
                                groupValue: authC.kelaminUpdate.value,
                                onChanged: (value) =>
                                    authC.kelaminUpdate.value = value!,
                              ),
                              RadioListTile(
                                selected: user["kelaim"] == "Wanita",
                                activeColor: Colors.blue,
                                title: Text(
                                  "Wanita",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black87),
                                ),
                                value: "Wanita",
                                groupValue: authC.kelaminUpdate.value,
                                onChanged: (value) =>
                                    authC.kelaminUpdate.value = value!,
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
                                  initialSelection: user["prodi"],
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
                                    authC.prodiUpdate.value = prodi["nama"];
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
                                selected: user["semester"] == "Ganjil",
                                activeColor: Colors.blue,
                                title: Text(
                                  "Ganjil",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                value: "Ganjil",
                                groupValue: authC.semesterUpdate.value,
                                onChanged: (value) =>
                                    authC.semesterUpdate.value = value!,
                              ),
                              RadioListTile(
                                selected: user["semester"] == "Genap",
                                activeColor: Colors.blue,
                                title: Text(
                                  "Genap",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                value: "Genap",
                                groupValue: authC.semesterUpdate.value,
                                onChanged: (value) =>
                                    authC.semesterUpdate.value = value!,
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
                            controller: authC.ipkUpdate,
                            decoration: InputDecoration(
                              hoverColor: Colors.greenAccent,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
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
                                int.parse(authC.ipkUpdate.text);
                              } catch (e) {
                                return "IPK Harus Angka";
                              }

                              try {
                                int value = int.parse(authC.ipkUpdate.text);
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
                            style: TextStyle(color: Colors.black87),
                            controller: authC.passwordUpdate,
                            validator: (value) {
                              if (value!.length < 4)
                                return "Password harus lebih dari 4 karakter";
                              if (value == "")
                                return "Password tidak boleh kosong";
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    authC.obsecureUpdate.value =
                                        !authC.obsecureUpdate.value;
                                  },
                                  icon: authC.obsecureUpdate.value
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
                                  borderSide: BorderSide(color: Colors.green)),
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
                            if (authC.formStateUpdate.currentState!
                                .validate()) {
                              authC
                                  .updateData(
                                user["id"],
                              )
                                  .then((res) {
                                Navigator.of(context).popAndPushNamed("/home");
                              });
                              // showDialog(
                              //   context: context,
                              //   builder: (context) {
                              //     return AlertDialog(
                              //       title: Text("Daftarkan User?"),
                              //       content: Row(
                              //         children: [
                              //           Container(
                              //             height: 150,
                              //             width: 150,
                              //             child: Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 Text("Nama"),
                              //                 Text("JENIS KELAMIN"),
                              //                 Text("PRODI"),
                              //                 Text("SEMESTER"),
                              //                 Text("IPK"),
                              //               ],
                              //             ),
                              //           ),
                              //           Container(
                              //             height: 150,
                              //             width: 20,
                              //             child: Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 Text(":"),
                              //                 Text(":"),
                              //                 Text(":"),
                              //                 Text(":"),
                              //                 Text(":"),
                              //               ],
                              //             ),
                              //           ),
                              //           Container(
                              //             height: 150,
                              //             width: 150,
                              //             child: Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 Text(authC.namaUpdate.text),
                              //                 Text(authC.kelaminUpdate.value),
                              //                 Text(authC.prodiUpdate.value),
                              //                 Text(authC.semesterUpdate.value),
                              //                 Text(authC.ipkUpdate.text),
                              //               ],
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //       actions: [
                              //         TextButton(
                              //           onPressed: () {
                              //
                              //           },
                              //           child: Text("Simpan"),
                              //         ),
                              //         TextButton(
                              //           onPressed: () {
                              //             Navigator.of(context).pop();
                              //           },
                              //           child: Text("Batal"),
                              //         ),
                              //       ],
                              //     );
                              //   },
                              // );
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
                                            color: Colors.blue, blurRadius: 10)
                                      ]
                                    : [],
                                borderRadius: BorderRadius.circular(100),
                                color: authC.hover.value
                                    ? Colors.blue
                                    : Colors.transparent,
                                border:
                                    Border.all(color: Colors.blue, width: 2)),
                            child: Text(
                              "Update",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
