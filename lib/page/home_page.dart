import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class HomePage extends StatefulWidget {
  final String usernamenew;
  HomePage({required this.usernamenew});

  @override
  State<HomePage> createState() => HomePageState();
}


class HomePageState extends State<HomePage> {
  dynamic status = '';
  dynamic result = '';
  final TextEditingController tinggiValue = TextEditingController();
  final TextEditingController beratValue = TextEditingController();


  void cekBMI() {
    double tinggi = double.parse(tinggiValue.text);
    double berat = double.parse(beratValue.text);
    dynamic hasil = berat / ((tinggi / 100) * (tinggi / 100));
    dynamic cekBMI = hasil.toStringAsFixed(1);

     if (hasil < 18.5) {
      setState(() {
        result = cekBMI; 
        status = 'Berat Badan Anda Kurang';
      });
    } else if (hasil > 18.5 && hasil < 22.9) {
      setState(() {
        result = cekBMI;
        status = 'Berat Badan Anda Normal';
      });
    } else if (hasil > 23 && hasil < 29.9) {
      setState(() {
        result = cekBMI;
        status = 'Berat Badan Anda Berlebih';
      });
    } else {
      setState(() {
        result = cekBMI;
        status = 'Berat Badan Anda Berlebihan';
      });
    }
  }
  validate() {
    if (tinggiValue.text != '' && beratValue.text != '') {
      cekBMI();
    } else {
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: const Text('isikan dengan benar')));
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Penghitungan BMI")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              child: Text("Holla $username",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            SizedBox(
              height: 60,
              child: Text('Hasil BMI : ${result}',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Text(
              '${status}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              controller: tinggiValue,
              decoration: InputDecoration(
                labelText: 'Tinggi Badan',
                hintText: 'Masukkan Tinggi Badan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              controller: beratValue,
              decoration: InputDecoration(
                labelText: 'Berat Badan',
                hintText: 'Masukkan Berat Badan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  validate();
                });
              }, child: Text('Hitung BMI'),
            ),
          ],
        ),
      ),
    );
  }
}



  