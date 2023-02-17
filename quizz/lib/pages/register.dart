// ignore_for_file: unused_element, unused_field
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/pages/login.dart';

import '../provider/authe_pro.dart';
import '../utile/utill.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? nom;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final authViewModel = Provider.of<AuthViewModel>(context);

    TextEditingController emailController = TextEditingController();
    TextEditingController nomController = TextEditingController();
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
              const Text("Nom"),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: nomController,
                autofocus: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Nom",
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
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
                  title: "S'enregistrer",
                  loading: authViewModel.loading,
                  onPress: () {
                    final form = formKey.currentState!;
                    if (form.validate()) {
                      final email = emailController.text;
                      Map data = {
                        "email": email,
                        "name": nomController.text,
                        "password": passwordController.text,
                      };
                      authViewModel.registerApi(data, context);
                    }
                  }),
              const SizedBox(
                height: 15.0,
              ),
              RoundButton(
                  title: "Avez vous un compte",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
