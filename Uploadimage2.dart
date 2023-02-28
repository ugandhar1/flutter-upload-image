import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter5/Imageservice.dart';
import 'package:image_picker/image_picker.dart';

class Newimage extends StatefulWidget {
  const Newimage({Key? key}) : super(key: key);

  @override
  State<Newimage> createState() => _NewimageState();
}

class _NewimageState extends State<Newimage> {
  final ImagePicker _picker = ImagePicker();
  final ImagePicker _imagePicker=ImagePicker();
  File? imageFile;
  final ApiServie _apiServie=ApiServie();
  List<String> _images=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageFile == null
                ?
            Icon(Icons.add_photo_alternate)
                :
            Column(
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.file(imageFile!,
                    fit: BoxFit.cover,),
                ),
                ElevatedButton(
                    onPressed: ()async {
                      // var responseDio= await _apiServie.Uploadimage2(_images);
                      _Uploadimage();

                    }, child: Text('upload'))
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _getPhotos();
              },
              child: Text('Pick Image'),
            ),
            ElevatedButton(onPressed: (){
              _getCamera();
            },
            // call api service 
            child: Text("camera"))
          ],
        ),
      ),
    );
  }

  _getPhotos() async {
    XFile? pickedFile = await _picker.pickImage(source:
    ImageSource.gallery);

    if(pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
  
 _getCamera() async {
   XFile? pickedFile = await _picker.pickImage(source:
    ImageSource.camera);

    if(pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
 } 
 //       ApI Calling Dio//
 Dio _dio=Dio();
_Uploadimage() async{
   var formData=FormData.fromMap({
    "image":await MultipartFile.fromFile(imageFile!.path),
    
   }
   );
   var response =await _dio.post('/',data: formData,options: Options(
    headers:{'accept': 'application/json',
            'Authorization': ''
    }));
   debugPrint(response.toString());
   print(response.data);
   print(response.statusCode);
   print(response.headers);
   
}
}

