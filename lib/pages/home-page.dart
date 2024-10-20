import 'package:c2_haryo_191_userlist/controllers/authC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthC());

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          FlutterLogo(),
          Container(
            width: 15,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Text("Ingin Keluar?"),
                        actions: [
                          TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.red)),
                              onPressed: () {
                                authC.curentUser = null;
                                Navigator.of(context).popAndPushNamed("/");
                              },
                              child: Text(
                                "Keluar",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ));
            },
            child: Text(
              "Log Out",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red)),
          ),
          Container(
            width: 25,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder(
            future: authC.getAllUser(),
            builder: (context, ss) => ss.connectionState ==
                    ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Text(
                        "Daftar Semua User",
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: authC.searchUserC,
                        onFieldSubmitted: (value) => setState(() {
                          authC.searchUser.value = value;
                        }),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            suffixIcon: Icon(
                              Icons.search,
                            ),
                            hintText: "Cari User",
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                      Container(
                        width: double.infinity,
                        height: 500,
                        child: ListView.builder(
                          padding: EdgeInsets.all(25),
                          itemCount: ss.data!.length,
                          itemBuilder: (context, i) => !ss.data![i]["nama"]
                                  .contains(authC.searchUser.value)
                              ? SizedBox()
                              : Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${ss.data![i]["nim"]} ",
                                                style: TextStyle(
                                                    color: Colors.black87),
                                              ),
                                              Text(
                                                "${ss.data![i]["nama"]} ",
                                                style: TextStyle(
                                                    color: Colors.black87),
                                              ),
                                              Text(
                                                "${ss.data![i]["kelamin"]} ",
                                                style: TextStyle(
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${ss.data![i]["prodi"]} ",
                                                style: TextStyle(
                                                    color: Colors.black87),
                                              ),
                                              Text(
                                                "${ss.data![i]["semester"]} ",
                                                style: TextStyle(
                                                    color: Colors.black87),
                                              ),
                                              Text(
                                                "${ss.data![i]["ipk"]} ",
                                                style: TextStyle(
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      authC.curentUser!.nama ==
                                                  ss.data![i]["nama"] ||
                                              authC.curentUser!.nama == "admin"
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                                Colors
                                                                    .greenAccent)),
                                                    onPressed: () =>
                                                        // print(ss.data![i]),
                                                        Navigator.of(context)
                                                            .popAndPushNamed(
                                                                "/update",
                                                                arguments: ss
                                                                    .data![i]),
                                                    child: Text(
                                                      "Update Data",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white),
                                                    )),
                                                Container(
                                                  width: 10,
                                                ),
                                                IconButton(
                                                    hoverColor:
                                                        const Color.fromARGB(
                                                            255, 190, 13, 0),
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                                Colors.red)),
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                                  AlertDialog(
                                                                    content: Text(
                                                                        "Ingin Mengahapus User ${ss.data![i]["nama"]}?"),
                                                                    actions: [
                                                                      TextButton(
                                                                          style: ButtonStyle(
                                                                              backgroundColor: WidgetStatePropertyAll(Colors
                                                                                  .red)),
                                                                          onPressed:
                                                                              () {
                                                                            authC.deleteUser(ss.data![i]["id"]).then((value) async {
                                                                              value
                                                                                  ? print("")
                                                                                  : await ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        duration: Duration(milliseconds: 700),
                                                                                        backgroundColor: Colors.red,
                                                                                        content: Text(
                                                                                          "Dilarang Menghapus User Admin",
                                                                                          style: TextStyle(color: Colors.white),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                              Navigator.of(context).pop();
                                                                              return value;
                                                                            }).then((value) {
                                                                              if (value) {
                                                                                if (authC.curentUser!.nama == "admin") {
                                                                                  setState(() {});
                                                                                } else {
                                                                                  Navigator.of(context).pushNamed("/");
                                                                                }
                                                                              }
                                                                            });
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            "Hapus",
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          ))
                                                                    ],
                                                                  ));
                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                      size: 20,
                                                    )),
                                              ],
                                            )
                                          : SizedBox()
                                    ],
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                // ss.data[i]["nim"] ==
                                                //         authC.curentUser!.nim
                                                //     ? Colors.green
                                                //     :
                                                Colors.orange,
                                            offset: Offset(7, 10))
                                      ]),
                                ),
                        ),
                      )
                    ],
                  )),
      ),
    );
  }
}
