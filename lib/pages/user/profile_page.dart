import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 40, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("User Id : 321977854",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text("Email Id : paresh@gmail.com",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                TextButton(onPressed: (){}, child: Text("Verify Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
              ],
            ),
          ),
          Text("Created : 11/06/2024 ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),)
        ],
      ),
    );
  }
}