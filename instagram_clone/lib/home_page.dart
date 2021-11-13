import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Clone',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Instagram에 오신 것을 환경합니다.',
                  style: TextStyle(fontSize: 24.0),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Text('사진과 동영상을 보려면 팔로우하세요'),
                Padding(padding: EdgeInsets.all(8.0)),
                SizedBox(
                  width: 260.0,
                  child: Card(
                    elevation: 4.0,
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(4.0)),
                        SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fca143133-349a-4075-a68b-60ee33b318c9%2FSJ_Main.png?table=block&id=fa0eb946-388d-40b5-9295-9e29d1eca65f&spaceId=89c8c53a-d004-445f-8b96-e4a9cd8ffa7c&width=250&userId=582806da-b4e3-4c8c-8573-a1b75f56bbb5&cache=v2'),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Text(
                          'strong3879@gmail.com',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('정석진'),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network(
                                  'https://cdn.pixabay.com/photo/2017/02/05/17/40/saint-peters-basilica-2040718__480.jpg', fit: BoxFit.cover,),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2017/02/05/17/40/saint-peters-basilica-2040718__480.jpg', fit: BoxFit.cover,),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2017/02/05/17/40/saint-peters-basilica-2040718__480.jpg', fit: BoxFit.cover,),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(4.0)),
                        Text('Facebook 친구'),
                        Padding(padding: EdgeInsets.all(4.0)),
                        RaisedButton(
                          child: Text('팔로우'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                        Padding(padding: EdgeInsets.all(4.0)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
