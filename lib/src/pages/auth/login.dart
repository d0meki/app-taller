import 'package:app_taller/src/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final mailController = TextEditingController();

    final passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0XFF3C3E52),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 80.0,
              ),
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/car-repair.png',
                      width: 120.0,
                    ),
                    const Text(
                      "Car Repair",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      width: 150,
                      child: const Text(
                        "Authenticate using your email and password",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, height: 1.5),
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: TextFormField(
                                  controller: mailController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                      iconColor: Colors.white,
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      icon: Icon(Icons.mail),
                                      labelText: "Email"),
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: false,
                                  readOnly: false,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Escriba su correo por favor";
                                    }
                                    return null;
                                  }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: TextFormField(
                                  controller: passwordController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                      iconColor: Colors.white,
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      icon: Icon(Icons.password),
                                      labelText: "Password"),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  readOnly: false,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Escriba su password por favor";
                                    }
                                    return null;
                                  }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  AuthServices authServices = AuthServices();
                                  bool resp = await authServices.login(
                                      mailController.text,
                                      passwordController.text);
                                  if (resp) {
                                    Future.microtask(() {
                                      Navigator.pushNamed(context, "home");
                                    });
                                  } else {
                                    Future.microtask(() {
                                      Navigator.pushNamed(context, "login");
                                    });
                                  }
                                  //TODO: si el usuario tiene un solo rol se lo redirige a su vista correspondiente al que el rol pertenece
                                  //TODO: si el usuario tiene mas de un rol se le pregunta con que rol desea ingresar
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF04A5ED),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 14.0, horizontal: 24.0),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, "register");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF04A5ED),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 24.0),
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
