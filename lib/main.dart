import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MayDayApp',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    List<Contact> contactList = [
      Contact('เหตุด่วยเหตุร้าย (ตำรวจ)','191','assets/images/police.png'),
      Contact('เจ็บป่วยฉุกเฉิน (ทั่วไทย)', '1669','assets/images/ambulance.png'),
      Contact('อัคคีภัย สัตว์เข้าบ้าน', '199', 'assets/images/Emergency.png'),
      Contact('แจ้งรถหาย', '1192','assets/images/car.png'),
      Contact('แจ้งคนหาย', '1300','assets/images/people.png'),
      Contact('ตำรวจท่องเที่ยว', '1155','assets/images/policeman.png'),
      Contact('ศูนย์จราจรอุบัติเหตุ จส.100', '1137','assets/images/traffic-barrier.png'),
      Contact('กรมทางหลวงชนบท', '1146','assets/images/RuralRoad.png'),
      Contact('กรมทางหลวง มอเตอร์เวย์', '1586','assets/images/motorway.png'),
    ];

    return Scaffold(
       appBar : AppBar(
        title: Text('MayDay App'),
       ),
       body: ListView.builder(
         itemCount: contactList.length,
         itemBuilder: (BuildContext context, int index) {
           Contact contact = contactList[index];

           return ListTile(
             leading: Image.asset(contact.imageSource),
             title: Text(contact.name),
             subtitle: Text(contact.phoneNumber),
             onTap: () {
               launch('tel:${contact.phoneNumber}');
             },
           );
         }
      )
    );
  }
}