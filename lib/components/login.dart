import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugas/components/listUsers.dart';
import 'package:tugas/components/sign-in.dart';
import 'package:tugas/screens/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool ?isUsernameEmpty;
  bool ?isPasswordEmpty;

  String errorText = '';
  
  @override
  void initState() {
    usernamecontroller.text = "";
    isUsernameEmpty = false;
    isPasswordEmpty = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title:const Text(
          'Login', 
          style: TextStyle(
            fontSize: 25, 
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        centerTitle: true,
      ),
     body: SafeArea(
    child: Container(
    padding: EdgeInsets.all(10),
    height: MediaQuery.of(context).size.height,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


//LoginForm
Center(
  child: SizedBox(
    width: MediaQuery.of(context).size.width * 0.5, 
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        TextField(
          controller: usernamecontroller,
          decoration: InputDecoration(
            labelText: "Username", 
            errorText: errorText.isNotEmpty ? "Harap isi username yang valid" : null,
          ),
        ),
        SizedBox(height: 20), 
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: "Password", 
            errorText: errorText.isNotEmpty ? "Harap isi password yang valid" : null,
          ),
        ),

      ],
    ),
  ),
),

SizedBox(height: 20),

//LoginButton
ElevatedButton(
  onPressed: () {
    setState(() {
      errorText = '';

      isUsernameEmpty = usernamecontroller.text.isEmpty;
      isPasswordEmpty = passwordController.text.isEmpty;

      bool isUserExist = false;
      for (var user in listUsers) {
        if (user['username'] == usernamecontroller.text && user['password'] == passwordController.text) {
          isUserExist = true;
          break;
        }
      }

      if (isUsernameEmpty! || isPasswordEmpty == null) {
        errorText = "Username dan password harus diisi";
      } else if (!isUserExist) {
        errorText = "Username atau password salah";
      }
    });

    if (!isUsernameEmpty! && !isPasswordEmpty! && errorText.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(username: usernamecontroller.text),
        ),
      );
    }
  },
  child: Text('Login'),
  style: ElevatedButton.styleFrom(
    minimumSize: Size(
      MediaQuery.of(context).size.width / 4,
      50,
    ),
  ),
),

              SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: Text("Belum punya akun?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



