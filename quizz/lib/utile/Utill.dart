// ignore_for_file: file_names, unused_field, prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/pages/home.dart';
import 'package:quizz/pages/login.dart';

import '../provider/authe_pro.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Center(
        child: Container(
          height: 40,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Color.fromARGB(255, 157, 155, 208),
                  )
                : Text(
                    title,
                    style:
                        const TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                  ),
          ),
        ),
      ),
    );
  }
}

class EmailDeildWidget extends StatefulWidget {
  final TextEditingController controller;
  const EmailDeildWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<EmailDeildWidget> createState() => _EmailDeildWidgetState();
}

class _EmailDeildWidgetState extends State<EmailDeildWidget> {
  String? _userName;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        autofocus: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "email",
          prefixIcon: const Icon(Icons.mail),
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? "Entrer un  Email valide"
            : null,
        onSaved: (value) => _userName = value!,
      );
}

class PasswordDetailWidget extends StatefulWidget {
  final TextEditingController controller;
  const PasswordDetailWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordDetailWidget> createState() => _PasswordDetailWidgetState();
}

class _PasswordDetailWidgetState extends State<PasswordDetailWidget> {
  String? _password;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "password",
          prefixIcon: const Icon(Icons.lock),
        ),
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const [AutofillHints.password],
        validator: ((value) {
          if (value != null && value.length < 8) {
            return " characters min 8";
          } else {
            return null;
          }
        }),
        onSaved: (value) => _password = value!,
      );
}

snackBar(BuildContext context) {
  // ignore: unnecessary_const
  const snackBar = SnackBar(
    //backgroundColor: Colors.redAccent,
    content: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Erreur dans votre Login ',
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Drawer drawer(BuildContext context, String? name, String? email) {
  return Drawer(
    width: 300,
    child: ListView(children: [
      Container(
        height: 250,
        color: Color.fromARGB(255, 60, 126, 239),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 2),
              child: CircleAvatar(
                radius: 100,
                //   backgroundImage: AssetImage('quizz/assets/photo.jpg'),
              ),
            ),
            Text(name!,
                style: TextStyle(
                    color: Color.fromARGB(255, 253, 251, 251), fontSize: 18)),
            Divider(
              height: 1,
            ),
            Text(email!,
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 253, 253), fontSize: 14))
          ],
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeView()));
        },
        title: Row(
          children: const [
            Icon(
              Icons.home,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Accueil',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
      ListTile(
        onTap: (() => Navigator.pop(context)),
        title: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(
              Icons.question_answer_outlined,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: const Text(
                'Vos Participations ',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
      ListTile(
        onTap: (() => Navigator.pop(context)),
        title: Row(
          children: const [
            Icon(Icons.settings_applications),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Modifier votre profil',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
      ListTile(
        onTap: (() {
          final user = Provider.of<AuthViewModel>(context, listen: false);
          user.logout();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ));
        }),
        title: Row(
          children: const [
            Icon(Icons.logout),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Deconnecter',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      )
    ]),
  );
}

// bool testConnect() {
//   bool joinable = false;
//   Future tes(bool jon) async {
//     Response response = await http.get(Uri.parse(AppUrl.baseUrl));
//     if (response.statusCode == 200) {
//       jon = true;
//     }
//     print('tes');
//   }

//   tes(joinable);
//   return joinable;

