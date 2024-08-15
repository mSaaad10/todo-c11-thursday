import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_c11_thursday/core/utils/email_validation.dart';
import 'package:todo_c11_thursday/core/utils/image_utils.dart';
import 'package:todo_c11_thursday/ui/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    getImagePathByName('auth_background_pattern.png')))),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Register Screen'),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SizedBox(height: 100,),
                  CustomTextFormField(
                    controller: fullNameController,
                    label: 'Full Name',
                    keyboardType: TextInputType.name,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Plz, enter Full Name';
                      }
                      if (input is int) {
                        return 'Sorry, Invalid input';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: userNameController,
                    label: 'User Name',
                    keyboardType: TextInputType.name,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Plz, enter User Name';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    label: 'E-mail Address',
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Plz enter e-mail address';
                      }
                      if (!isValidEmail(input)) {
                        return 'Email bad format';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    label: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    isSecureText: true,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Plz enter password';
                      }
                      if (input.length < 6) {
                        return 'Sorry, Password should be at least 6 chars';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: passwordConfirmationController,
                    label: 're-password',
                    keyboardType: TextInputType.visiblePassword,
                    isSecureText: true,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Plz enter password';
                      }
                      if (input != passwordController.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        register();
                      },
                      child: Text('Register'))
                ],
              ),
            ),
          ),
        ));
  }

  void register() {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    // create account
  }
}
