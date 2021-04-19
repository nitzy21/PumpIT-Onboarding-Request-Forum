import 'package:flutter/material.dart';
import 'requestForm.dart';
import 'header.dart';

class requestModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: false,
        title: Text(
          'Request Breastmilk',
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
              builder: (context) => requestForm(),
            ),
          );
        },
        child: Icon(Icons.create_outlined),
        backgroundColor: const Color(0xFFF3A494),
      ),
      body: RequestorName(),
    );
  }
}

class RequestorName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              header(),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'This are some informations',
                style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Baby's Name:",
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              Text(
                'Date of Birth: ',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              Text(
                'Medical Condition/Sickness: ',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              Text(
                'Hospital/Location: ',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              Text(
                "Parent's Name:",
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              Text(
                "Parent's Phone Number: ",
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Image(
                image: AssetImage('assets/testResult.jpeg'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    elevation: 0.0,
//                  textColor: Color(0xFF292929),
//                  color: Colors.pinkAccent),
                  color: const Color(0xFFF3A494),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 25.0, left: 20.0),
                    onPressed: () {
//                        Navigator.of(context).push(
//                          MaterialPageRoute(
//                            builder: (context) => requestForm(),
//                          ),
//                        );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.opacity_rounded,
                          color: Colors.white,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Donate",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))
                      ],
                    ),

                  ),
                  SizedBox(
                    width: 130.0,
                  ),
                  Text('01/01/2021'),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(color: Colors.black26),
            ],
          ),
        ),
      ],
    );
  }
}
