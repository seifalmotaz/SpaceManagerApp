import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spacemanager/pages/login/controller.dart';
import 'package:spacemanager/widgets/form_field.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/WrapperBG.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 500 * .81,
                child: Text(
                  'Please login:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 500 * .81,
                child: Center(
                  child: TextCustomField(
                    controller: controller.phone,
                    hint: 'Phone number',
                    autoFocus: true,
                    onFieldSubmitted: (string) =>
                        controller.passFocus.requestFocus(),
                    color: Colors.white38,
                    textColor: Colors.black87,
                    hintColor: Colors.black38,
                  ),
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                width: 500 * .81,
                child: Center(
                  child: TextCustomField(
                    controller: controller.pass,
                    obscureText: true,
                    hint: 'Password',
                    color: Colors.white38,
                    hintColor: Colors.black38,
                  ),
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                width: 500 * .81,
                child: GFButton(
                  fullWidthButton: true,
                  hoverColor: Colors.white.withOpacity(.13),
                  text: "LogIn",
                  textColor: Colors.blueGrey.shade900,
                  shape: GFButtonShape.pills,
                  elevation: 0,
                  hoverElevation: 0,
                  color: Colors.white,
                  onPressed: controller.login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
