import 'package:chat_demo/Proceso/autenticacion.dart';
import 'package:chat_demo/UI/mensajes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Container(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          child: Text(
                              (Autenticacion().usuario?.email).toString(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, fontWeight: FontWeight.w600)))),
                  Expanded(
                      child: Container(
                    child: IconButton(
                        alignment: Alignment.bottomRight,
                        onPressed: () {
                          Autenticacion().signOut();
                        },
                        icon: Icon(Icons.exit_to_app_rounded)),
                  ))
                ],
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: mensaje, //Se asegura de que sale el mensaje
                      decoration: InputDecoration(
                          hintText: 'Escribe un mensaje',
                          contentPadding: EdgeInsets.all(12)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (mensaje.text.isNotEmpty) {
                          fire.collection('Chat').doc().set({
                            'Mensaje': mensaje.text,
                            'Tiempo': DateTime.now(),
                            'Email':
                                ((Autenticacion().usuario?.email).toString()),
                          });
                          mensaje.clear();
                        }
                      },
                      icon: Icon(
                        Icons.send_rounded,
                        color: Color.fromARGB(255, 34, 58, 94),
                      )),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                child: Expanded(child: mensajes()),
              )
            ],
          ),
        ));
  }
}
