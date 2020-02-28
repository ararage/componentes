import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'), 
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child:CircleAvatar(
              backgroundImage: NetworkImage("https://p16.muscdn.com/img/musically-maliva-obj/1631892931579910~c5_1080x1080.jpeg"),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child:CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            )
          )
        ]
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage("https://i.pinimg.com/originals/11/9e/3a/119e3a4678cb2d80b61f07118ed37ac4.jpg"),
          placeholder: AssetImage("assets/jar-loading.gif"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
