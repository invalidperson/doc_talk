import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle mystyle(double size, [Color color, FontWeight fw = FontWeight.w700]) {
  return GoogleFonts.lato(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}

CollectionReference usercollection =
    FirebaseFirestore.instance.collection('users');
