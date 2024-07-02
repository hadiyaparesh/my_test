import 'package:flutter/material.dart';
import 'package:my_test/pages/login_page.dart';
import 'package:my_test/pages/sidebar/sidebar.dart';
import 'package:my_test/pages/user/changepassword_page.dart';
import 'package:my_test/pages/user/dashbord_page.dart';
import 'package:my_test/pages/user/profile_page.dart';


class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UaseHomeState();
}

class _UaseHomeState extends State<UserHomePage> {
  int _selectedindex = 0;
  static List<Widget> _widgetoption = <Widget>[
    Dashboard(),
    Profile(),
    Changepassword(),
  ];

  void _onitemtap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarPage(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
            Colors.pink,
            Colors.yellow,
            Colors.blue,
            ])
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Welcome User",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.indigo),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:const Color.fromARGB(255, 54, 30, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                      (route) => false);
                      
                },
                
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
      body: _widgetoption.elementAt(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(items: const<BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: "DashBoard"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person),
        label: "My Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),
        label: "Change Password")
      ],
      currentIndex: _selectedindex,
      selectedItemColor: Colors.amber[800],
      selectedFontSize: 20,
      onTap: _onitemtap,
      ),
    );
  }
}
