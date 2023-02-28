import 'package:flutter/foundation.dart';

class Contact{
  int ?id;
  String ?name;
  String?number;
  String?image;
  String?price;

  Contact({this.id,this.name,this.number,this.image,this.price});

  Map<String,dynamic> toMap()=>{
    "id":id,
    "name":name,
    "number":number,
    "image":image,
    "price":price
  };


  factory Contact.fromMap(Map<String,dynamic> map)=>
     Contact(id: map["id"],name: map["name"],number: map["number"],image:map["image"],price:map['price']);

  





}