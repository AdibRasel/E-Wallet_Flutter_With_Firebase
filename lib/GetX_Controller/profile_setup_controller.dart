import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


// camera or gally > bottomshet
class ProfileSetupController extends GetxController{

  File? pickedImage;

  Future imagePicker (isGallery) async{

    // Future <bool> isGallery = true;

    try{
      if(isGallery == true){


        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(image == null) return;

        final tempImage = File(image.path); // XFile theke file type convert
        pickedImage = tempImage;
        Get.back();

        update();
        // print("Image Path: ${pickedImage.toString()}");


      }else if(isGallery == false){


        final image = await ImagePicker().pickImage(source: ImageSource.camera);
        if(image == null) return;

        final tempImage = File(image.path); // XFile theke file type convert
        pickedImage = tempImage;
        Get.back();

        update();
        // print("Image Path: ${pickedImage.toString()}");


      }


    }catch (error){
      // ignore: avoid_print
      print("Error is ${error.toString()}");
    }
  }

}