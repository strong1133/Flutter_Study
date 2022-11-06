
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text('asd'),
            SizedBox(
              width: 200,
              height: 200,
              child:_showImage(context, 'https://property-dev.dgdr.io/dgdr_files/expense/20221104/2xT8pPEMmnWBOVJL7oq7hGls8FYb1gubex3sAeRSTuxDV8EdTR_20221104025204.jpg'))
          ],
        ),
      ),
    );
  }
}

  Widget _showImage(context, image){
    return Container(
        width: 200,
        height: 200,
        child: Image.network(image, loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
          if(loadingProgress == null){
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
            ),
          );
        },
        ));
  }