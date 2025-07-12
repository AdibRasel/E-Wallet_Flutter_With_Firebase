import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


// camera or gally > bottomshet
class ProfileSetupController extends GetxController{

  File? pickedImage;

  Future imagePicker () async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;

      final tempImage = File(image.path); // XFile theke file type convert
      pickedImage = tempImage;

      update();
      print("Image Path: ${pickedImage.toString()}");

    }catch (error){
      print("Error is ${error.toString()}");
    }
  }

}