import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices{

  void getDataFireBase(){
    var db=FirebaseFirestore.instance.collection("HerbsProduct").get();

}}