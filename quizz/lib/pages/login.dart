// ignore_for_file: unused_element, unused_field

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/authe_pro.dart';
import '../utile/Utill.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final authViewModel = Provider.of<AuthViewModel>(context);

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    @override
    void dispose() {
      super.dispose();

      emailController.dispose();
      passwordController.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(40.0),
          child: Text("Quizz Application "),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Email"),
              const SizedBox(
                height: 15.0,
              ),
              EmailDeildWidget(controller: emailController),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Password",
              ),
              const SizedBox(
                height: 15.0,
              ),
              PasswordDetailWidget(controller: passwordController),
              const SizedBox(
                height: 15.0,
              ),
              RoundButton(
                  title: "Login",
                  loading: authViewModel.loading,
                  onPress: () {
                    final form = formKey.currentState!;
                    if (form.validate()) {
                      final email = emailController.text;
                      Map data = {
                        "username": email,
                        "password": passwordController.text
                      };
                      authViewModel.loginApi(data, context);
                      //print("api ");
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                  title: "Enregister",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
