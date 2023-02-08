// ignore_for_file: file_names, unused_field

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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
