import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    setState(() {
      changebutton = true;
    });
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Image.asset(
              'PATHIK.png',
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Welcome $name"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  // email field
                  TextFormField(
                      decoration: const InputDecoration(hintText: "User Name"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "cant be empty";
                        }
                      }),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => movetohome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changebutton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changebutton
                          ? Icon(Icons.done, color: Colors.white)
                          : const Text("Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(changebutton ? 50 : 8)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
