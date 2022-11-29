import 'package:chat_demo/Proceso/autenticacion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final email = TextEditingController();
final password = TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'CONECTA2',
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 3),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Image.asset(
              'images/chat.png',
              scale: 1.8,
            )),
            TextField(
                keyboardType: TextInputType.text,
                controller: email,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.mail_rounded),
                    label: Text('Email',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w600)))),
            TextField(
                maxLength: 8,
                keyboardType: TextInputType.text,
                obscureText: true, //ocultar texto
                controller: password,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.key_rounded),
                    label: Text('Password',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w600)))),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Autenticacion().login(
                              email: email.text, password: password.text);
                        },
                        label: Text("Login",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 8.0),
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Autenticacion().newUser(
                            email: email.text, password: password.text);
                      },
                      label: Text("New User",
                          style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
