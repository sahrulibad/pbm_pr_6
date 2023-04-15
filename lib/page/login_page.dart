import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';

class LoginPage extends StatelessWidget {
  final String usernamen;
  final String passwordn;
  LoginPage({required this.usernamen, required this.passwordn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(
        username: usernamen,
        password: passwordn,
      ),
    );
  }
}

class Login extends StatefulWidget {
  final String username;
  final String password;
  Login({required this.username, required this.password});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController usernameValue = TextEditingController();
  final TextEditingController passwordValue = TextEditingController();

  bool loginSuccesfull = false;
  void login() {
    String usernamenew = usernameValue.text;
    String passwordnew = passwordValue.text;

    if (usernamenew == username && passwordnew == password) {
      loginSuccesfull= true;
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => HomePage(usernamenew: usernamenew),),);
    }
    else {
      loginSuccesfull = false;
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Text('Password atau Username Salah'),
          );
        }
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(
            height: 50,
            child:
            Text(
                'Selamat Datang Di Halaman Login',
            )
          ),
          Text(
                'Nama : Muhammad Sahrul Ibad',
            ),
          Text(
                'NIM : 212410102040',
            ),
            Text(
                'Kelas : Pemrograman Berbasis Mobile A',
            ),
          SizedBox(
              height: 70,
              child: 
              Text(
                'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
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
                onPressed: login,
                child: Text('Login',
                style: TextStyle(fontSize: 20)),
              ),
          ],
        ),
      ),
    );
  }
}


