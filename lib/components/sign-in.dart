import 'package:flutter/material.dart';
import 'package:tugas/components/listUsers.dart';
import 'package:tugas/components/login.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    bool isUsernameEmpty = false;
    bool isPasswordEmpty = false;

    return Scaffold(
      appBar: AppBar(
         title:const Text(
          'Sign In', 
          style: TextStyle(
            fontSize: 25, 
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      errorText: isUsernameEmpty == true ? "Username harus diisi" : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      errorText: isPasswordEmpty == true ? "Kata sandi harus diisi" : null,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;
            
                addUser(username, password);
            
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(), 
                  ),
                );
              },
              child: Text('Sign In'),
            ),

          ],
        ),
      ),
    );
  }
}
