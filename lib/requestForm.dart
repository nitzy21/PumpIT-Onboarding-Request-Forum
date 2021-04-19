import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'header.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class requestForm extends StatefulWidget {
  @override
  _requestFormState createState() => _requestFormState();
}

class _requestFormState extends State<requestForm> {
  String _baby, _birthday, _medCondition, _hospital, _parentName, _parentNum;
  PickedFile _imgBaby, _imgID, _imgMedCert;
  File _imgBaby2, _imgID2, _imgMedCert2 ;
  int galleryBabyChecker = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildBaby() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Baby's Name",
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(12.0)),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: Icon(Icons.face),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Name is required";
        }
        return null;

//        if(!RegExp()){
//
//        }
      },
      onSaved: (String value) {
        _baby = value;
      },
    );
  }

  Widget _buildBirthday() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Date of Birth",
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(12.0)),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: Icon(Icons.calendar_today_rounded),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Birthday is required";
        }
        return null;
      },
      onSaved: (String value) {
        _birthday = value;
      },
    );
  }

  Widget _buildMedCondition() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Medical Condition",
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(12.0)),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: Icon(Icons.local_hospital),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Medical Condition is required";
        }
        return null;
      },
      onSaved: (String value) {
        _medCondition = value;
      },
    );
  }

  Widget _buildHospital() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Hospital/Location",
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(12.0)),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: Icon(Icons.location_on),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Hospital is required";
        }
        return null;
      },
      onSaved: (String value) {
        _hospital = value;
      },
    );
  }

  Widget _buildParentName() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Parent's Name",
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(12.0)),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: Icon(Icons.person),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Parent's name is required";
        }
        return null;
      },
      onSaved: (String value) {
        _parentName = value;
      },
    );
  }

  Widget _buildParentNum() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      maxLength: 11,
      decoration: InputDecoration(
        labelText: "Parent's Number",
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(12.0)),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: Icon(Icons.local_phone_rounded ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Parent's number is required";
        }
        return null;
      },
      onSaved: (String value) {
        _parentNum = value;
      },
    );
  }

  // BuildContext is used to create a navigation, to pop the dialog out of the screen

  _openBabyGallery(BuildContext context) async {
    var pic = await ImagePicker().getImage(source: ImageSource.gallery);
    this.setState(() {
      _imgBaby = pic;
      _imgBaby2 = File(_imgBaby.path);
    });
    Navigator.of(context).pop();
  }

  _openBabyCamera(BuildContext context) async {
    var pic = await ImagePicker().getImage(source: ImageSource.camera);
    this.setState(() {
      _imgBaby = pic;
      _imgBaby2 = File(_imgBaby.path);
    });
    Navigator.of(context).pop();
  }

  _openIDGallery(BuildContext context) async {
    var pic = await ImagePicker().getImage(source: ImageSource.gallery);
    this.setState(() {
      _imgID = pic;
      _imgID2 = File(_imgID.path);
    });
    Navigator.of(context).pop();
  }

  _openIDCamera(BuildContext context) async {
    var pic = await ImagePicker().getImage(source: ImageSource.camera);
    this.setState(() {
      _imgID = pic;
      _imgID2 = File(_imgID.path);
    });
    Navigator.of(context).pop();
  }

  _openMedCertGallery(BuildContext context) async {
    var pic = await ImagePicker().getImage(source: ImageSource.gallery);
    this.setState(() {
      _imgMedCert = pic;
      _imgMedCert2 = File(_imgMedCert.path);
    });
    Navigator.of(context).pop();
  }

  _openMedCertCamera(BuildContext context) async {
    var pic = await ImagePicker().getImage(source: ImageSource.camera);
    this.setState(() {
      _imgMedCert = pic;
      _imgMedCert2 = File(_imgMedCert.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context, int temp) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose one"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {

                      if(temp == 1){
                        _openBabyGallery(context);
                      } else if (temp == 2) {
                        _openIDGallery(context);
                      } else if (temp ==3){
                        _openMedCertGallery(context);
                      }
                      
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {

                      if(temp == 1){
                        _openBabyCamera(context);
                      } else if (temp == 2) {
                        _openIDCamera(context);
                      } else if (temp ==3){
                        _openMedCertCamera(context);
                      }

                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _babyImageView() {
    if (_imgBaby2 == null) {
      return Container(
        padding: EdgeInsets.only(
          left: 20,
        ),
        height: MediaQuery.of(context).size.height / 15,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText("Attach baby's image here",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                  minFontSize: 8,
                  stepGranularity: 1,
                  maxLines: 5),
              Container(
                width: 60,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3A494),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: InkWell(
                  onTap: () {
                    _showChoiceDialog(context, 1);
                  },
                  child: ClipRRect(
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(
          left: 20,
        ),
        width: MediaQuery.of(context).size.width / 1,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.file(
              _imgBaby2,
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              width: 60,
              height: 180,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF3A494),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: InkWell(
                onTap: () {
                  _showChoiceDialog(context, 1);
                },
                child: ClipRRect(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
//
    }
  }

  Widget _IDImageView() {
    if (_imgID2 == null) {
      return Container(
        padding: EdgeInsets.only(
          left: 20,
        ),
        height: MediaQuery.of(context).size.height / 15,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText("Attach Parent's Valid ID Image",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                  minFontSize: 8,
                  stepGranularity: 1,
                  maxLines: 5),
              Container(
                width: 60,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3A494),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: InkWell(
                  onTap: () {
                    _showChoiceDialog(context, 2);
                  },
                  child: ClipRRect(
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(
          left: 20,
        ),
        width: MediaQuery.of(context).size.width / 1,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.file(
              _imgID2,
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              width: 60,
              height: 180,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF3A494),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: InkWell(
                onTap: () {
                  _showChoiceDialog(context, 2);
                },
                child: ClipRRect(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
//
    }
  }


  Widget _MedCertImageView() {
    if (_imgMedCert2 == null) {
      return Container(
        padding: EdgeInsets.only(
          left: 20,
        ),
        height: MediaQuery.of(context).size.height / 15,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText("Attach Medical Certificate Image",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                  minFontSize: 8,
                  stepGranularity: 1,
                  maxLines: 5),
              Container(
                width: 60,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3A494),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: InkWell(
                  onTap: () {
                    _showChoiceDialog(context, 3);
                  },
                  child: ClipRRect(
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(
          left: 20,
        ),
        width: MediaQuery.of(context).size.width / 1,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.file(
              _imgMedCert2,
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              width: 60,
              height: 180,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF3A494),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: InkWell(
                onTap: () {
                  _showChoiceDialog(context, 3);
                },
                child: ClipRRect(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
//
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: const Color(0xFFF3A494),
        ),
        title: Text(
          'Write Request',
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
            child: Container(
              color: Colors.black26,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),

//      body: Form(),

      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  header(),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Donee's Information",
                    style: TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  _buildBaby(),
                  SizedBox(
                    height: 7.0,
                  ),
                  _buildBirthday(),
                  SizedBox(
                    height: 7.0,
                  ),
                  _buildHospital(),
                  SizedBox(
                    height: 7.0,
                  ),
                  _buildMedCondition(),
                  SizedBox(
                    height: 7.0,
                  ),
                  _buildParentName(),
                  SizedBox(
                    height: 7.0,
                  ),
                  _buildParentNum(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Attach Image",
                    style: TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  _babyImageView(),
                  SizedBox(
                    height: 7.0,
                  ),
                  _IDImageView(),
                  SizedBox(
                    height: 7.0,
                  ),
                  _MedCertImageView(),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(color: Colors.black26),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      color: const Color(0xFFF3A494),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        // the onSaved method is called
                        _formKey.currentState.save();
                        print(_baby);
                        print(_birthday);
                        print(_hospital);
                        print(_hospital);
                        print(_medCondition);
                        print(_parentName);
                        print(_parentNum);
                      },
                      child: Text(
                        'POST',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------- no backend , not a form ------

//class Form extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ListView(
//      children: <Widget>[
//        Container(
//          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              profile(),
//              SizedBox(
//                height: 30.0,
//              ),
//              Text(
//                "Donee's Information",
//                style: TextStyle(
//                  fontSize: 18.5,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//              SizedBox(
//                height: 10.0,
//              ),
//              doneeInfo(
//                text: "Baby's Name",
//                img: Icon(Icons.menu),
//              ),
//              SizedBox(
//                height: 10.0,
//              ),
//              doneeInfo(
//                text: "Date of Birth",
//                img: Icon(Icons.menu),
//              ),
//              SizedBox(
//                height: 10.0,
//              ),
//              doneeInfo(
//                text: "Medical Condition",
//                img: Icon(Icons.menu),
//              ),
//              SizedBox(
//                height: 10.0,
//              ),
//              doneeInfo(
//                text: "Hospital / Location",
//                img: Icon(Icons.menu),
//              ),
//              SizedBox(
//                height: 10.0,
//              ),
//              doneeInfo(
//                text: "Parent's Name",
//                img: Icon(Icons.menu),
//              ),
//              SizedBox(
//                height: 10.0,
//              ),
//              doneeInfo(
//                text: "Parent's Phone Number",
//                img: Icon(Icons.menu),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              Text(
//                "Attach Image",
//                style: TextStyle(
//                  fontSize: 18.5,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//              SizedBox(
//                height: 15.0,
//              ),
//              requestImage(
//                text: "Attach here the Baby's Image",
//                img: "assets/ic_image.png",
//              ),
//              requestImage(
//                text: "Attach Parent's Valid ID Image",
//                img: "assets/ic_image.png",
//              ),
//              requestImage(
//                text: "Attach Medical Certificate Image",
//                img: "assets/ic_image.png",
//              ),
//              SizedBox(
//                height: 15.0,
//              ),
//              Divider(color: Colors.black26),
//              Align(
//                alignment: Alignment.bottomRight,
//                child: RaisedButton(
//                  padding: EdgeInsets.symmetric(horizontal: 30),
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(12.0)),
//                  color: const Color(0xFFF3A494),
//                  onPressed: () {
////                        Navigator.of(context).push(
////                          MaterialPageRoute(
////                            builder: (context) => requestForm(),
////                          ),
////                        );
//                  },
//                  child: Text(
//                    'POST',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ],
//    );
//  }
//}
