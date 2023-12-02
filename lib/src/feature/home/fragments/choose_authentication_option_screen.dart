import 'package:flutter/material.dart';

class ChooseAuthenticationOptionScreen extends StatelessWidget {
  const ChooseAuthenticationOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("RDVeda"),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text("Continue with Email"),
              trailing: Icon(Icons.arrow_right),
              tileColor: Colors.green.shade300,
            ),
            ListTile(
              title: Text("Login to an existing account"),
              trailing: Icon(Icons.arrow_right),
            )
          ],
        ),
      ),
    );
  }
}
