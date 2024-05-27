import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ItemsNeededPage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'name': 'Mobile', 'image': 'https://firebasestorage.googleapis.com/v0/b/gifthope-523cb.appspot.com/o/images%2Fmobile.jpeg?alt=media&token=de81099e-893e-44cb-99e3-82de02e5507e'},
    {'name': 'TV', 'image': 'https://firebasestorage.googleapis.com/v0/b/gifthope-523cb.appspot.com/o/images%2Ftv.jpeg?alt=media&token=7c0c094c-7060-4d22-bbbe-90d08d470090'},
    {'name': 'Powerglass', 'image': 'https://firebasestorage.googleapis.com/v0/b/gifthope-523cb.appspot.com/o/images%2Fglasses.jpg?alt=media&token=4c9039e6-c092-4f5d-a214-a22d8b4deb74'},
    {'name': 'Sticks', 'image': 'https://firebasestorage.googleapis.com/v0/b/gifthope-523cb.appspot.com/o/images%2Fstick.jpg?alt=media&token=3b146193-82f0-41f3-9c7c-cab995add01b'},
    {'name': 'Sheets', 'image': 'https://firebasestorage.googleapis.com/v0/b/gifthope-523cb.appspot.com/o/images%2Fsheets.jpg?alt=media&token=fb8cf94e-01a5-4666-a98d-f644e85b6c2a'},
    {'name': 'Mattress', 'image': 'https://firebasestorage.googleapis.com/v0/b/gifthope-523cb.appspot.com/o/images%2Fmattress.jpeg?alt=media&token=b0f187bc-66f3-4925-9360-0f659124dd3f'},
    {'name': 'Cloths', 'image': 'https://firebasestorage.googleapis.com/v0/b/gifthope-523cb.appspot.com/o/images%2Fcloths.jpg?alt=media&token=63d6b335-6802-4913-8350-984acf3d1e64'},
    {'name': 'Foods', 'image': 'https://firebasestorage.googleapis.com/v0/b/gifthope-523cb.appspot.com/o/images%2Ffood.jpg?alt=media&token=e9fd443d-cbda-46b6-8645-4150c496f289'},
    {'name': 'Utensils', 'image': 'https://firebasestorage.googleapis.com/v0/b/gifthope-523cb.appspot.com/o/images%2Futensils.jpg?alt=media&token=125a6646-30d4-4c4c-bde3-92846350539e'},
    {'name': 'Electronics', 'image': 'https://firebasestorage.googleapis.com/v0/b/gifthope-523cb.appspot.com/o/images%2Felectronics.jpg?alt=media&token=c741def3-dab5-48c0-b911-d81ecdc6333a'},
    
  ];

  ItemsNeededPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items Needed'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          // Each item is wrapped in a Container with a margin
          return Container(
            margin: const EdgeInsets.all(10.0),
            child: ListTile(
              // The leading widget is a GestureDetector that opens a dialog with the image
              leading: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          child: PhotoView(
                            imageProvider: NetworkImage(items[index]['image']!),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: SizedBox(
                  width: 100, // You can adjust this value as needed
                  child: Image.network(items[index]['image']!),
                ),
              ),
              // The item name is used as the title
              title: Text(items[index]['name']!),
            ),
          );
        },
      ),
    );
  }
}
