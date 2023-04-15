import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

String username = "";
String password = "";
  
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: RegisterScreen(),
    );
  }
} 

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState  createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameValue = TextEditingController();
  final TextEditingController passwordValue = TextEditingController();

  void handleRegister() {
    final String usernamenew = usernameValue.text;
    final String passwordnew = passwordValue.text;
    username = usernamenew;
    password = passwordnew; 
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(
              height: 75,
              child: 
              Text(
                'Register',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
              ),
            ),
            Text(
              'Silahkan Buat akun dulu',
                style: TextStyle(
                  color: Color.fromARGB(255, 11, 15, 230),
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: usernameValue,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(117, 128, 125, 125),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Username',
                  floatingLabelStyle: TextStyle(color:Colors.blue),
                  hintText: 'Masukkan Username',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: passwordValue,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(117, 128, 125, 125),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Password',
                  floatingLabelStyle: TextStyle(color:Colors.blue),
                  hintText: 'Masukkan Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () {
                  if (username == '' || password =='') {
                    handleRegister();
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => LoginPage(
                          usernamen: username,
                          passwordn: password,
                        ),
                      ),
                    );
                  }
                },
                child : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Text('Register',
                      style: TextStyle(fontSize: 20)),
                    )
                  ],
                  ),
              ),    
          ],
        ),
      ),
    );
  }
}
