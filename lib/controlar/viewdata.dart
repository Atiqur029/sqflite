import 'package:croud/controlar/addandvaalidateandsave.dart';
import 'package:croud/database/databasehelper.dart';
import 'package:croud/model/contact.dart';
import 'package:get/get.dart';

class Contactview extends GetxController{
final SaveandFormValidation controlar=Get.put(SaveandFormValidation());

  final _somecontact=<Contact,dynamic>{}.obs;

  get someprodoct=>_somecontact;

  var allcontact=<Contact>[].obs;

  RxBool isLoad=false.obs;

  


  @override
  void onInit() {
    fetchAlldata();
    super.onInit();
  }
  
   fetchAlldata() async{
    isLoad.value=true;
    var student=await DbHelper.instence.getData();
    allcontact.value=student!;
    //allcontact.subject=student;
    isLoad(false);
   }

   addData({ required Contact contact}) async{
    await DbHelper.instence.insertData(contact: contact);
    fetchAlldata();

  


   }

     delete(int id) async{
      await DbHelper.instence.delete(id);
      fetchAlldata();


    }
   
    Future updates(Contact contact) async{
      await DbHelper.instence.update(contact);
      fetchAlldata();

    }


    

    int allTotal(){

      int sum=0;
      

      for(int i=0;i<allcontact.length;i++){
        var b=int.parse(allcontact[i].price.toString());

        sum=sum+b;

        
      }
      return sum;
    }
    

 get getTotal=>_somecontact.entries.map((e) => e.key.price).toList().fold(0, (previousValue, element)=>previousValue+int.parse(element.toString())
 
 );

  

   


   }
  

  


