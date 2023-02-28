import 'package:flutter/material.dart';


class TextForm extends StatelessWidget {
   const TextForm({super.key,this.suffixIcon, this.onChanged, this.onSaved, this.prefixIcon, this.suffix, this.hintText, this.controller, this.obscureText=false,this.keyboardType,this.validator,this.onTap,this.maxline=1,this.labelText,this.textStyle});

   final Function(String)? onChanged;
   final Function(String?)? onSaved;
   final String? Function(String?)? validator;
   final Widget? prefixIcon;
   final TextStyle?textStyle;
   final Widget? suffix;
   final String? hintText;
   final TextEditingController? controller;
   final bool? obscureText;
   final TextInputType? keyboardType;
   final Widget? suffixIcon;
   final void Function()? onTap;
   final int?maxline;
   final String?labelText;
  @override
  Widget build(BuildContext context) {
    return  Container(  
     decoration: BoxDecoration(
     color: Colors.white,
     borderRadius: BorderRadius.circular(10),
     boxShadow: const [
        BoxShadow(blurRadius: 0.2,offset: Offset(0, 2),spreadRadius: 0.5)
     ]
          
          
    ),
     child: TextFormField(
          style: textStyle,
            onChanged: onChanged,
            onSaved: onSaved,
            obscureText: obscureText!,
            controller: controller,
            keyboardType:keyboardType ,
            validator: validator,
            onTap: onTap,
            maxLines:maxline ,
            
                   
            decoration:InputDecoration(
              suffixIcon:suffixIcon ,
              
              labelText: labelText,      
              suffix:suffix,
              contentPadding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              hintText: hintText,
              prefixIcon: prefixIcon
          
                      
              ),
          
                    
                  ),
                );
           
  }
}