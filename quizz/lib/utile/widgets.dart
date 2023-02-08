import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(
      icon,
     color: const  Color.fromARGB(255, 70, 90, 107),
    ),
    hintText: hintText,
    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}

final forgotLabel = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Padding(padding: EdgeInsets.all(0.0)),
    TextButton(
        onPressed: () {
          //    Navigator.pushReplacementNamed(context, "/Register");
        },
        child: const Text("Mot de passe oublie ?")),
    TextButton(
        onPressed: () {
          //  Navigator.pushReplacementNamed(context, "routeName");
        },
        child: const Text("Enregister")),
  ],
);

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
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 164, 192, 167),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
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