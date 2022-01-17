import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/helpers/snacks.dart';
import 'package:spaceapp/pages/dashboard/controllers/binding.dart';
import 'package:spaceapp/pages/dashboard/dashboard.dart';
import 'package:spaceapp/services/auth.dart';
import 'package:spaceapp/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode fphone = FocusNode();
  FocusNode fpass = FocusNode();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();

  submit(
    Function startLoading,
    Function stopLoading,
    ButtonState btnState,
  ) async {
    startLoading();
    try {
      List<Guest> guests =
          await guestQuery.find(phone: phone.text, password: pass.text);
      if (guests.isNotEmpty) {
        Guest guest = guests.first;
        AuthService.to.guestData.value = guest;
        int newSesstion = await staffSessionQuery.create(guestId: guest.id);
        AuthService.to.sessionData.value =
            await staffSessionQuery.read(newSesstion);
        Get.offAll(() => const DashboardPage(), binding: DashboardBinding());
      } else {
        errorSnack(
          'Staff not found',
          'Try to check the password and phone number',
          const Duration(seconds: 2),
        );
      }
    } catch (e) {
      errorSnack(
        'Finding guest error',
        e.toString(),
        const Duration(minutes: 1),
      );
    }
    stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(21),
          decoration: BoxDecoration(
            color: BaseColors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                spreadRadius: 3,
                color: Colors.grey.shade200,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  color: BaseColors.darkText,
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
              const SizedBox(height: 13),
              WTextField(
                hint: 'Phone number',
                width: Get.width * .3,
                controller: phone,
                focus: fphone,
                onFieldSubmitted: (string) => fpass.requestFocus(),
              ),
              const SizedBox(height: 13),
              WTextField(
                hint: 'Password',
                width: Get.width * .3,
                controller: pass,
                focus: fpass,
                obscureText: true,
                onFieldSubmitted: (string) => fphone.requestFocus(),
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: 51,
                width: Get.width * .3,
                child: Center(
                  child: ArgonButton(
                    borderRadius: 13,
                    height: 51,
                    width: Get.width * .3,
                    color: BaseColors.primary,
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    loader: Container(
                      padding: const EdgeInsets.all(10),
                      child: const SpinKitRotatingCircle(
                        color: Colors.white,
                        // size: loaderWidth ,
                      ),
                    ),
                    onTap: submit,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
