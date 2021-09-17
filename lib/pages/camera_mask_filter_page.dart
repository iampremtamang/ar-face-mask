import 'package:avatar_view/avatar_view.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';
import 'dart:io' as Platform;

class CameraMaskFilterPage extends StatefulWidget {
  const CameraMaskFilterPage({ Key? key }) : super(key: key);

  @override
  _CameraMaskFilterPageState createState() => _CameraMaskFilterPageState();
}

class _CameraMaskFilterPageState extends State<CameraMaskFilterPage> {
  CameraDeepArController? cameraDeepArController;
  String platformVersion="Unknown";
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffects = Effects.none;
  Filters currentFilters = Filters.none;
  Masks currentMask = Masks.none;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            //Deep AR Camera
            CameraDeepAr(
              onCameraReady: (isReady) {
                platformVersion = "Camera Status $isReady";
                print(platformVersion);
                setState(() {
                  
                });
              },
              onImageCaptured: (path) {
                platformVersion = "Image saved at $path";
                print(platformVersion);
                setState(() {
                  
                });
              },
              androidLicenceKey: "013b011f7f2f236939fe6adcaae6b9d1190a999522f27f310f576379e8ed2ba282186720653270e6",
              cameraDeepArCallback:(c) async {
                cameraDeepArController = c;
              },
              ),

              //Face Mask Filters - Image Buttons
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:28.0, right: 28.0),
                        child: Expanded(
                          child: FloatingActionButton(
                            child: Icon(Icons.camera_enhance),
                            backgroundColor: Colors.white54,
                            onPressed: (){
                              if(cameraDeepArController == null) {
                                return ;
                              } else {
                                cameraDeepArController!.snapPhoto();
                              }
                              
                            },
                          ),
                        ),
                        ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(8, (page){
                            bool active = currentPage == page;
                            return Platform.Platform.isIOS
                              //Ios App View 
                              ? GestureDetector(
                                onTap: () {
                                  currentPage = page;
                                  cameraDeepArController!.changeMask(page);
                                  setState(() {
                                    
                                  });
                                },
                                child: AvatarView(
                                  radius: active ? 65 : 30,
                                  borderColor: Colors.yellow,
                                  borderWidth: 2,
                                  isOnlyText: false,
                                  avatarType: AvatarType.CIRCLE,
                                  backgroundColor: Colors.red,
                                  imagePath: "assets/assets/ios/${page.toString()}.jpg",
                                  placeHolder: Icon(Icons.person, size: 50,),
                                  errorWidget: Container(
                                    child: Icon(Icons.error),
                                  ),

                                ),
                              ) 
                              //Android app view
                              : GestureDetector(
                                onTap: () {
                                  currentPage = page;
                                  cameraDeepArController!.changeMask(page);
                                  setState(() {
                                    
                                  });
                                },
                                child: AvatarView(
                                  radius: active ? 45 : 25,
                                  borderColor: Colors.yellow,
                                  borderWidth: 2,
                                  isOnlyText: false,
                                  avatarType: AvatarType.CIRCLE,
                                  backgroundColor: Colors.red,
                                  imagePath: "assets/assets/android/${page.toString()}.jpg",
                                  placeHolder: Icon(Icons.person, size: 50,),
                                  errorWidget: Container(
                                    child: Icon(Icons.error),
                                  ),

                                ),
                              );

                          }),
                        ),
                      ),
                    ],
                  ),
                  ),
              ),
              
          ],
        ),
        ),
    );
  }
}