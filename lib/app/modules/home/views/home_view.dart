import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homeCrtl = Get.put(HomeController());

  Widget inputEmail() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: "Email",
          prefixIcon: Icon(Icons.email)),
      keyboardType: TextInputType.emailAddress,
      controller: homeCrtl.emailController,
      onSaved: (value) {
        homeCrtl.email = value!;
      },
      validator: (value) => homeCrtl.validateEmail(value!),
    );
  }

  Widget inputPass() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: "Password",
          prefixIcon: Icon(Icons.lock)),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      controller: homeCrtl.passwordController,
      onSaved: (value) {
        homeCrtl.password = value!;
      },
      validator: (value) => homeCrtl.validatePassword(value!),
    );
  }

  Widget sendButton(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: context.width),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
          padding: MaterialStateProperty.all(EdgeInsets.all(14)),
        ),
        child: Text(
          "Login",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          homeCrtl.checkLogin();
        },
      ),
    );
  }

  Widget separate(double dimension) {
    return SizedBox(
      height: dimension,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 16),
            width: context.width,
            height: context.height,
            child: SingleChildScrollView(
              child: Form(
                  key: homeCrtl.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Image.asset('assets/images/app_logo_splash.png'),
                      separate(20),
                      Text(
                        "Welcome to app",
                        style: TextStyle(fontSize: 20),
                      ),
                      separate(20),
                      inputEmail(),
                      separate(16),
                      inputPass(),
                      separate(16),
                      sendButton(context),
                      separate(16),
                    ],
                  )),
            ),
          ),
        ));
  }
}
