import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
void showSnackBar(BuildContext context ,String text){
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text(text),)
);
}



Future <List<File>> pickImages() async {
 List<File> images = [];
 try {
   var files = await FilePicker.platform.pickFiles(
     type: FileType.image,
     allowMultiple: true
   );
   if(files != null && files.files.isNotEmpty){
     for(int i = 0 ; i<files.files.length;i++){
       images.add(File(files.files[i].path!));
     }
   }
 }catch (e){
   debugPrint(e.toString());
 }

 return images;
}


showAlertDialog(BuildContext context , VoidCallback onOk , String textHead, String textMsg){
Widget cancelButton = TextButton(
    onPressed: (){
      Navigator.pop(context);
    },

    child: const Text("Cancel")
);
Widget oKButton = TextButton(
    onPressed: onOk,

    child: const Text("OK")
);

AlertDialog alertDialog = AlertDialog(
  title: Text(textHead),
  content: Text(textMsg),
  actions: [
    cancelButton,
    oKButton
  ],
  );

  showDialog(context: context,
      builder: (BuildContext context){
      return alertDialog;
      }
  );
}



