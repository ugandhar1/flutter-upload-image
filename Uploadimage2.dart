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
   var response =await _dio.post('https://api.realroadies.com/api/v1/user/myphotos/',data: formData,options: Options(
    headers:{'accept': 'application/json',
            'Authorization': 'Bearer eyJraWQiOiI5Mmc2a1NiNFdlZUhheEFNY0NZb3htNzI2NCtrc25IVHpPd1E4dlgraGlVPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiI1YmNiMzM5NC1lYjU5LTRkNzUtYjM2Ni0zOTM4MTUxNjk4ZGYiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAuZXUtbm9ydGgtMS5hbWF6b25hd3MuY29tXC9ldS1ub3J0aC0xX1Y3MTdyQjJDRCIsImNsaWVudF9pZCI6Ijd0cWtscThya3RqbmNiZXRkbnR1bHEwanA3Iiwib3JpZ2luX2p0aSI6ImM2NzljMDE4LTFmYzUtNDQyYS1iYmY5LWFiN2NiMTU0ZDg1OSIsImV2ZW50X2lkIjoiOGU4Mzc1MjYtZmFjOS00OWE3LThlYjMtMDFmN2FiZDFjYzMxIiwidG9rZW5fdXNlIjoiYWNjZXNzIiwic2NvcGUiOiJhd3MuY29nbml0by5zaWduaW4udXNlci5hZG1pbiIsImF1dGhfdGltZSI6MTY2NTEzOTA4MywiZXhwIjoxNjY1MTYwNjgzLCJpYXQiOjE2NjUxMzkwODMsImp0aSI6ImQzOGZhOGZmLTEwZWItNDEwMi1iZGQ5LWE0NjM2MjBmY2IxOCIsInVzZXJuYW1lIjoiNWJjYjMzOTQtZWI1OS00ZDc1LWIzNjYtMzkzODE1MTY5OGRmIn0.almZNqgbfFGYENdme65TRu7sigZbbkIyYuVLtxNDUEi_P7kRoLClLUh6dr2eflC3nQLBJQGbBErrdNduSYMr2LsboEK8u0cUrHIVvc79408ULx-LOvhON4p7_WM5lPFVtKBsFAad9mNGMpBqfZYze0CDRqKTYCajmGJEIogL11XJ-I0N3uLXC9KW5PNW-lldvMvrVAOngIhubeIwSEEtWuSzrljLG2yHyERKrrFt7QMfincyQOAbO4koSD03PTDnolKaLpknEQVkJvppM6PQ1DgCdNZxaj9-wv0su3oYSL0_egQAODuLECTW71N2mxUEl97CeT0P-MqZTa3mng2bUg'
    }));
   debugPrint(response.toString());
   print(response.data);
   print(response.statusCode);
   print(response.headers);
   
}
}

