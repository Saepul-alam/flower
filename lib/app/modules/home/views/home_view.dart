import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              Positioned(
                height: 60,
                width: 500,
                top: 20,
                left: 20,
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      child: Text(
                        'Hello, ${controller.nameController.text}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold, // membuat teks menjadi bold
                        ),
                      ),
                    ),
                    SizedBox(width: 70), // Add some spacing
                    Positioned(
                      width: 10,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor:
                            Colors.blue, // You can change the color as needed
                        radius: 50,

                        child: Obx(
                          () {
                            return controller.image.value != null &&
                                    controller.image.value!.path.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      File(controller.image.value!.path),
                                      width: 55,
                                      height: 55,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: Text(
                  'How\'s your day going?',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Positioned(
                top: 100,
                left: 20,
                child: Text(
                  'My Address: ${controller.addressController.text}',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Positioned(
                top: 130,
                left: 20,
                child: Text(
                  'My Phone Number: ${controller.phoneController.text}',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Align( // Positioned the button to center horizontally and bottom
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Choose an image"),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                GestureDetector(
                                  child: Text("Gallery"),
                                  onTap: () async {
                                    controller.getImage(true);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                SizedBox(height: 20),
                                GestureDetector(
                                  child: Text("Camera"),
                                  onTap: () async {
                                    controller.getImage(false);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  // Set width to 300 and height to 40
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: Center(
                      child: Text('Upload Image', style: TextStyle(fontSize: 14, color: Colors.white)), // Ubah warna teks menjadi putih disini
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFD567CD)), // Ubah warna latar belakang tombol disini
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
