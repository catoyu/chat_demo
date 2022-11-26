import 'package:chat_demo/Proceso/autenticacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mensajes extends StatefulWidget {
  const mensajes({super.key});

  @override
  State<mensajes> createState() => _mensajesState();
}

class _mensajesState extends State<mensajes> {
  Stream<QuerySnapshot> resp_mess = FirebaseFirestore.instance
      .collection('Chat')
      .orderBy('Tiempo', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: resp_mess,
        builder: (context, AsyncSnapshot<QuerySnapshot> respuesta) {
          return ListView.builder(
            itemCount: respuesta.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 0.8,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  )),
                  child: Card(
                    elevation: 8,
                    color: (Autenticacion().usuario?.email).toString() ==
                            respuesta.data!.docs[index].get('Email')
                        ? Color.fromARGB(255, 34, 58, 94)
                        : Color.fromARGB(255, 33, 132, 153),
                    child: ListTile(
                      title: Text(respuesta.data!.docs[index].get('Mensaje'),
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color:
                                (Autenticacion().usuario?.email).toString() ==
                                        respuesta.data!.docs[index].get('Email')
                                    ? Colors.grey[300]!
                                    : Colors.grey[300]!,
                          ),
                          textAlign:
                              (Autenticacion().usuario?.email).toString() ==
                                      respuesta.data!.docs[index].get('Email')
                                  ? TextAlign.right
                                  : TextAlign.left),
                      subtitle: Text(respuesta.data!.docs[index].get('Email'),
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color:
                                (Autenticacion().usuario?.email).toString() ==
                                        respuesta.data!.docs[index].get('Email')
                                    ? Colors.grey[300]!
                                    : Colors.grey[300]!,
                          ),
                          textAlign:
                              (Autenticacion().usuario?.email).toString() ==
                                      respuesta.data!.docs[index].get('Email')
                                  ? TextAlign.right
                                  : TextAlign.left),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
