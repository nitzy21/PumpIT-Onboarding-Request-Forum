import 'package:flutter/material.dart';

class header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
//            crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Colors.black26,
                offset: Offset(0, 4.0),
              ),
            ],
            image: DecorationImage(
              image: AssetImage("assets/dog.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Text(
                    'First ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Middle ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Last Name',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.0,
            ),
            Container(
              width: 75.0,
              height: 30.0,
              child: Center(
                child: Text(
                  'Donee',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: const Color(0xFFF3A494),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 50.0,
        ),
        Icon(
          Icons.more_horiz,
          color: const Color(0xFFF3A494),
        ),
      ],
    );
  }
}
