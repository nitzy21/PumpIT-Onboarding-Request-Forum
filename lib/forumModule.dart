import 'package:flutter/material.dart';
import 'header.dart';

class forumModule extends StatefulWidget {
  @override
  _forumModuleState createState() => _forumModuleState();
}

Widget _post() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        header(),
        SizedBox(
          height: 30.0,
        ),
        Text(
          "This is some text from the post..",
          style: TextStyle(
            fontSize: 18.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 7.0,
        ),
        Center(
          child: Image(
            image: AssetImage('assets/dog.jpeg'),
          ),
        ),
        SizedBox(
          height: 13,
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border_outlined),
              color: const Color(0xFFF3A494),
              onPressed: () {},
            ),
            Text(
              '111',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            IconButton(
              icon: Icon(Icons.mode_comment_outlined),
              color: const Color(0xFFF3A494),
              onPressed: () {},
            ),
            Text(
              '222',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            SizedBox(width: 140),
            Text(
              '10/21/21',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(color: Colors.black26),
      ],
    ),
  );
}

Widget forumPost() {
  return Scaffold(
    appBar: AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: const Color(0xFFF3A494),
      ),
      title: Text(
        'Write Post',
        style: TextStyle(color: Colors.black),
      ),
      bottom: PreferredSize(
          child: Container(
            color: Colors.black26,
          ),
          preferredSize: Size.fromHeight(4.0)),
    ),
    body: _writePost(),
  );
}

Widget _writePost() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    child: ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            header(),
            SizedBox(height: 40),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Share us your experiences here..',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black38,
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
              cursorColor: Colors.black45,
              keyboardType: TextInputType.multiline,
              maxLines: 26,
              maxLength: 1000,
            ),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.broken_image_outlined,),
                  color: const Color(0xFFF3A494),
                  onPressed: () {},
                ),
                Text(
                  'Add Photo',
                  style: TextStyle(fontSize: 16 , color: Colors.black87),
                ),
                SizedBox(width: 140),
                RaisedButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  color: const Color(0xFFF3A494),
                  child: Text(
                    'POST',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

class _forumModuleState extends State<forumModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: false,
        title: Text(
          'Forums',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 4.0,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_rounded),
            color: const Color(0xFFF3A494),
            onPressed: () => {},
          ),
        ],
        leading: IconButton(
          color: const Color(0xFFF3A494),
          icon: Icon(Icons.menu),
          onPressed: () => {},
        ),
        bottom: PreferredSize(
            child: Container(
              color: Colors.black26,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => forumPost(),
            ),
          );
        },
        child: Icon(Icons.create_outlined),
        backgroundColor: const Color(0xFFF3A494),
      ),
      body: ListView(
        children: <Widget>[
          _post(),
          _post(),
        ],
      ),
    );
  }
}
