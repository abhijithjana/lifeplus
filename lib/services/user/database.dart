import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  final uid;
  Database({this.uid});

  final CollectionReference usercollc=FirebaseFirestore.instance.collection('user');

  Future updateuser(String name,String email,String phno,String appoitmentid) async{
    return await usercollc.doc(uid).set({'name':name,'email':email,'phno':phno,'appoitmentid':appoitmentid});

  }
}