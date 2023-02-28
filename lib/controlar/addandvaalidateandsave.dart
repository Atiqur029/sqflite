


import 'dart:convert';
import 'dart:io';

import 'package:croud/database/databasehelper.dart';
import 'package:croud/model/contact.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

class SaveandFormValidation extends GetxController{

  final _image=Rxn<File>();


  File? get image=>_image.value;
  
  var imagename="";


  Future<void> pickimage(ImageSource source) async{

    final imagefile=await ImagePicker().pickImage(source: source,imageQuality: 50);

    if(imagefile!=null){
      _image.value=File(imagefile.path);
      var byte=File(imagefile.path).readAsBytesSync();
      String image64=base64Encode(byte);
      imagename=image64;
      //var byte=File(imagefile.path).readAsBytesSync();
      //_image.value=byte as File?;
       
       //imagename=base64Encode(byte) as Uint8List;
        
      
    }

  }

  // final fromkey=GlobalKey<FormState>();
  // //DbHelper dbHelper=DbHelper();


@override
  void onInit() {
    
    super.onInit();
    //imagefiles;
    
  }
  Contact contact=Contact();

  TextEditingController nameControlar=TextEditingController();

  TextEditingController numberControlar=TextEditingController();
  TextEditingController priceControlar=TextEditingController();

  //File? imagefiles;
  




  //  Future AddPhoto(ImageSource source) async {

  //   final image=await ImagePicker().pickImage(source: source,imageQuality: 50);
    
  //   if(image==null) return;

  //   File ?imagefile=  File(image.path);

  //   imagefiles=imagefile;



    
  }
  
  


  




