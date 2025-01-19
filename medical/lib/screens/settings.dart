import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            // AppBar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                  toolbarHeight: 200,
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Settings',
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text('Current user: Mr Ren',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.8),
                            ))
                      ]),
                  backgroundColor: Colors.blueAccent[700]),
            ),
            // Body with overlap
            Positioned(
              top:
                  180, // Adjust the overlap height (e.g., 20 pixels below the AppBar's height)
              left: 20, // Match the horizontal padding of the body
              right: 20,
              child: Column(children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: 470,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(16), // Optional rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5), // Optional shadow for a 3D effect
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('Login and security',
                            style: TextStyle(color: Colors.grey[500])),
                      ),
                      IconButton(
                        padding: EdgeInsets.symmetric(vertical: 0.5),
                        onPressed: () {},
                        icon: ListTile(
                          leading: Icon(Icons.supervised_user_circle_outlined),
                          title: Text('Username'),
                          trailing: Icon(Icons.navigate_next_sharp),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.symmetric(vertical: 0.5),
                        onPressed: () {},
                        icon: ListTile(
                          leading: Icon(Icons.phone),
                          title: Text('Phone number'),
                          trailing: Icon(Icons.navigate_next_sharp),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.symmetric(vertical: 0.5),
                        onPressed: () {},
                        icon: ListTile(
                          leading: Icon(Icons.mail),
                          title: Text('Email'),
                          trailing: Icon(Icons.navigate_next_sharp),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.symmetric(vertical: 0.5),
                        onPressed: () {},
                        icon: ListTile(
                          leading: Icon(Icons.lock),
                          title: Text('Password'),
                          trailing: Icon(Icons.navigate_next_sharp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text('Data and permission',
                            style: TextStyle(color: Colors.grey[500])),
                      ),
                      IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(vertical: 0.5),
                        icon: ListTile(
                          leading: Icon(Icons.location_city),
                          title: Text('Location'),
                          trailing: Icon(Icons.navigate_next_sharp),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(vertical: 0.5),
                        icon: ListTile(
                          leading: Icon(Icons.app_registration_sharp),
                          title: Text('Apps and Sessions'),
                          trailing: Icon(Icons.navigate_next_sharp),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  /*ivde deactivate idanm*/
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            16), // Optional rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset:
                                Offset(0, 5), // Optional shadow for a 3D effect
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: ListTile(
                          textColor: Colors.red,
                          iconColor: Colors.red,
                          leading: Icon(Icons.error_outlined),
                          title: Text(
                            'Deactivate',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.navigate_next_rounded),
                        ),
                      )),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
