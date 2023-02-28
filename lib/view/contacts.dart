

import 'dart:convert';


import 'package:croud/controlar/addandvaalidateandsave.dart';
import 'package:croud/controlar/viewdata.dart';
import 'package:croud/database/databasehelper.dart';
import 'package:croud/reusable/textform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/contact.dart';


class Contacts extends StatelessWidget {

  final SaveandFormValidation controlar=Get.put(SaveandFormValidation());
  final Contactview ccontrolar=Get.put(Contactview());
  final Contact contact=Contact();
   Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Contact"),),
      body: Obx((() {
        return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: ccontrolar.allcontact.length,
                itemBuilder: (context, index) {
                  final contactlist=ccontrolar.allcontact[index];

                  return ccontrolar.isLoad.value==true?const Center(child: CircularProgressIndicator(),):ListTile(leading: Container(
                    height: 150,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: MemoryImage(base64Decode(contactlist.image!)))
                    ),
                  ),title: Text(contactlist.number!),subtitle: Text("Price ${contactlist.price}"), 
                  trailing: IconButton(onPressed: (() {
                    ccontrolar.delete(contactlist.id!);
                    
                  }), icon: Icon(Icons.delete)),);
                }),
            ),

              SizedBox(height: 20.h,),
              Container(
                height: 20,
                child: Text("All Total ${ccontrolar.allTotal()}"),
              )
          ],
        ));
          
        
      })
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          
          onPressed: () {
          Get.bottomSheet(Container(
            height: 350.h,
            child: ListView(
              shrinkWrap: true,
              children: [
                TextForm(
                  onSaved: (v) {
                    controlar.contact.name=v;
                    
                  },
                  controller: controlar.nameControlar,
                  hintText: "Name",
                  validator:((v) {
                       if(v!.isEmpty){
                    return "not empty field";
                    
                   } else if(v.length<=3){
                    return "length must be 3";
                   }
                   return null;
                  
                
                    
                    
                  }) ,
                ),
                SizedBox(height: 10,),
                TextForm(hintText: "Number",
                onSaved: (v) {
                  controlar.contact.number=v;
                  
                },
                controller: controlar.numberControlar,
                validator: (v) {
                   if(v!.isEmpty){
                    return "not empty field";
                    
                   } else if(v.length<=3){
                    return "length must be 3";
                   }
                   return null;
                  
                },
                
                  
                ),

                  SizedBox(height: 10,),
                TextForm(hintText: "Number",
                onSaved: (v) {
                  controlar.contact.number=v;
                  
                },
                controller: controlar.priceControlar,
                validator: (v) {
                   if(v!.isEmpty){
                    return "not empty field";
                    
                   } else if(v.length<=3){
                    return "length must be 3";
                   }
                   return null;
                  
                },
                
                  
                ),
                controlar.image!=null?
                Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: FileImage(controlar.image!),fit: BoxFit.contain)
                        
                      ),
                      //child: controlar.imagefiles==null?const AssetImage("asset/img/cement.jpg"):FileImage(controlar.imagefiles!),
                    ),
                    //Text(controlar.imagename.toString())
                  ],
                ):Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("asset/img/cement.jpg",),fit: BoxFit.contain),)
                    
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (() {
                      controlar.pickimage(ImageSource.camera);
                      
                    }), icon: Icon(Icons.camera,color: Colors.white,)),

                    IconButton(onPressed: (() {
                      controlar.pickimage(ImageSource.gallery);
                      
                    }), icon: Icon(Icons.image,color: Colors.white,)),
                  ],
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (() {
                  try{
                     ccontrolar.addData(contact: Contact(
                      name: controlar.nameControlar.text.toString(),
                      number: controlar.numberControlar.text.toString(),
                      price: controlar.priceControlar.text.toString(),
                      image: controlar.imagename
                     ));
                     controlar.nameControlar.text="";
                     controlar.numberControlar.text="";
                     controlar.priceControlar.text="";

//Get.snackbar("Save", "SaveSucessfully",snackPosition: SnackPosition.BOTTOM);
                   //controlar.addData();
                  Get.back();
                  }catch(e){
                    print(e);
                   // Get.snackbar("Save", "SaveSucessfully",snackPosition: SnackPosition.BOTTOM);
                    
                      Get.back();
                  }
                
                
                  
                }), child: const Text("Add")),

                SizedBox(height: 10.h,),

                

              ],
            ),

          ));
        },),
      ),);
    
  }
}