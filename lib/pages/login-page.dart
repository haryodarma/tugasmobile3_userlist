import 'package:c2_haryo_191_userlist/controllers/authC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height - 100;
    final authC = Get.put(AuthC());

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
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
      body: Stack(children: [
        Positioned(
          right: 30,
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
          right: -250,
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
        Obx(
          () => Column(
            children: [
              Container(
                width: double.infinity,
                height: maxHeight / 4,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Selamat Datang",
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        "Masukkan Nim dan Password Anda",
                        style: TextStyle(fontSize: 12),
                      ),
                    ]),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                  key: authC.formState,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "Nama Tidak Boleh Kosong";
                          }
                          if (value!.length < 4) return "Nama harus 8 karakter";
                        },
                        controller: authC.namaLogin,
                        decoration: InputDecoration(
                          hoverColor: Colors.greenAccent,
                          floatingLabelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: "Nama",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "Password Tidak Boleh Kosong";
                          }
                          if (value!.length < 4)
                            return "Password harus 8 karakter";
                        },
                        controller: authC.passLogin,
                        obscureText: authC.obscureLogin.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                authC.obscureLogin.value =
                                    !authC.obscureLogin.value;
                              },
                              icon: Icon(authC.obscureLogin.value
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          hoverColor: Colors.greenAccent,
                          floatingLabelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: "Password",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onHover: (value) => authC.hover.value = value,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          if (authC.formState.currentState!.validate()) {
                            authC.login().then(
                                  (res) => res
                                      ? Navigator.of(context)
                                          .popAndPushNamed("/home")
                                      : ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          SnackBar(
                                            duration:
                                                Duration(milliseconds: 700),
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              "Cek Kembali Nama dan Password Anda !!",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                );
                          }
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
                              border: Border.all(color: Colors.blue, width: 2)),
                          child: Text(
                            "Login",
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
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Apakah anda belum memiliki akun? "),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/register"),
                    child: Text("Buat Akun"),
                    style: ButtonStyle(
                        foregroundColor:
                            WidgetStatePropertyAll(Colors.lightBlue)),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
