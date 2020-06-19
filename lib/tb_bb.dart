import 'package:flutter/material.dart';
import 'package:kalkulator_gizi/widgets/back_header.dart';
import 'package:kalkulator_gizi/constant.dart';
import 'dart:convert' as JSON;

String dropdownValue;
double _value = 0.0;
int _valueSlide=0;
final bbController = TextEditingController();
final tbController = TextEditingController();

class BbTb extends StatefulWidget {
  @override
  _BbTbState createState() => _BbTbState();
}

class _BbTbState extends State<BbTb> {
  final controller = ScrollController();
  double offset = 0;
  String _hasil = "";
  var _warna;

  
  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.blue,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Termasuk Dalam Kategori:'
                      '\n',
                      style: TextStyle(fontSize: 15, color: Colors.black, ),
                    )
                  ],
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$_hasil",
                      style: TextStyle(fontSize: 20, color: _warna, ),
                    )
                  ],
                ),

                Row(  
                  children: [
                    Text(
                      "*Rumus Perhitungan Berdasarkan Peraturan Kemenkes 2020",
                      style: TextStyle(fontSize: 10, color: Colors.black, ),
                    )
                  ],
                ),
            
              ],
            ),
          ),
        );
      },
    );
  }


    _rumus_bb_tb(String _x, double _y,String jk) {
    var temp=_x.split(".");
    var angkaAwal=temp[0];
    int angkabelakang=int.parse(temp[1]);
    String valTinggi="";
    if(angkabelakang>=5){
      valTinggi=angkaAwal+".5";
    }else{
      valTinggi=angkaAwal;
    }
    print(valTinggi);
    if(jk=="Laki-laki"){
      var dataList = '{"45":[1.9,2,2.7,3,3.3],"45.5":[1.9,2.1,2.8,3.1,3.4],"46":[2,2.2,2.9,3.1,3.5],"46.5":[2.1,2.3,3,3.2,3.6],"47":[2.1,2.3,3,3.3,3.7],"47.5":[2.2,2.4,3.1,3.4,3.8],"48":[2.3,2.5,3.2,3.6,3.9],"48.5":[2.3,2.6,3.3,3.7,4],"49":[2.4,2.6,3.4,3.8,4.2],"49.5":[2.5,2.7,3.5,3.9,4.3],"50":[2.6,2.8,3.6,4,4.4],"50.5":[2.7,2.9,3.8,4.1,4.5],"51":[2.7,3,3.9,4.2,4.7],"51.5":[2.8,3.1,4,4.4,4.8],"52":[2.9,3.2,4.1,4.5,5],"52.5":[3,3.3,4.2,4.6,5.1],"53":[3.1,3.4,4.4,4.8,5.3],"53.5":[3.2,3.5,4.5,4.9,5.4],"54":[3.3,3.6,4.7,5.1,5.6],"54.5":[3.4,3.7,4.8,5.3,5.8],"55":[3.6,3.8,5,5.4,6],"55.5":[3.7,4,5.1,5.6,6.1],"56":[3.8,4.1,5.3,5.8,6.3],"56.5":[3.9,4.2,5.4,5.9,6.5],"57":[4,4.3,5.6,6.1,6.7],"57.5":[4.1,4.5,5.7,6.3,6.9],"58":[4.3,4.6,5.9,6.4,7.1],"58.5":[4.4,4.7,6.1,6.6,7.2],"59":[4.5,4.8,6.2,6.8,7.4],"59.5":[4.6,5,6.4,7,7.6],"60":[4.7,5.1,6.5,7.1,7.8],"60.5":[4.8,5.2,6.7,7.3,8],"61":[4.9,5.3,6.8,7.4,8.1],"61.5":[5,5.4,7,7.6,8.3],"62":[5.1,5.6,7.1,7.7,8.5],"62.5":[5.2,5.7,7.2,7.9,8.6],"63":[5.3,5.8,7.4,8,8.8],"63.5":[5.4,5.9,7.5,8.2,8.9],"64":[5.5,6,7.6,8.3,9.1],"64.5":[5.6,6.1,7.8,8.5,9.3],"65":[5.7,6.2,7.9,8.6,9.4],"65.5":[5.8,6.3,8,8.7,9.6],"66":[5.9,6.4,8.2,8.9,9.7],"66.5":[6,6.5,8.3,9,9.9],"67":[6.1,6.6,8.4,9.2,10],"67.5":[6.2,6.7,8.5,9.3,10.2],"68":[6.3,6.8,8.7,9.4,10.3],"68.5":[6.4,6.9,8.8,9.6,10.5],"69":[6.5,7,8.9,9.7,10.6],"69.5":[6.6,7.1,9,9.8,10.8],"70":[6.6,7.2,9.2,10,10.9],"70.5":[6.7,7.3,9.3,10.1,11.1],"71":[6.8,7.4,9.4,10.2,11.2],"71.5":[6.9,7.5,9.5,10.4,11.3],"72":[7,7.6,9.6,10.5,11.5],"72.5":[7.1,7.6,9.8,10.6,11.6],"73":[7.2,7.7,9.9,10.8,11.8],"73.5":[7.2,7.8,10,10.9,11.9],"74":[7.3,7.9,10.1,11,12.1],"74.5":[7.4,8,10.2,11.2,12.2],"75":[7.5,8.1,10.3,11.3,12.3],"75.5":[7.6,8.2,10.4,11.4,12.5],"76":[7.6,8.3,10.6,11.5,12.6],"76.5":[7.7,8.3,10.7,11.6,12.7],"77":[7.8,8.4,10.8,11.7,12.8],"77.5":[7.9,8.5,10.9,11.9,13],"78":[7.9,8.6,11,12,13.1],"78.5":[8,8.7,11.1,12.1,13.2],"79":[8.1,8.7,11.2,12.2,13.3],"79.5":[8.2,8.8,11.3,12.3,13.4],"80":[8.2,8.9,11.4,12.4,13.6],"80.5":[8.3,9,11.5,12.5,13.7],"81":[8.4,9.1,11.6,12.6,13.8],"81.5":[8.5,9.1,11.7,12.7,13.9],"82":[8.5,9.2,11.8,12.8,14],"82.5":[8.6,9.3,11.9,13,14.2],"83":[8.7,9.4,12,13.1,14.3],"83.5":[8.8,9.5,12.1,13.2,14.4],"84":[8.9,9.6,12.2,13.3,14.6],"84.5":[9,9.7,12.4,13.5,14.7],"85":[9.1,9.8,12.5,13.6,14.9],"85.5":[9.2,9.9,12.6,13.7,15],"86":[9.3,10,12.8,13.9,15.2],"86.5":[9.4,10.1,12.9,14,15.3],"87":[9.5,10.2,13,14.2,15.5],"87.5":[9.6,10.4,13.2,14.3,15.6],"88":[9.7,10.5,13.3,14.5,15.8],"88.5":[9.8,10.6,13.4,14.6,15.9],"89":[9.9,10.7,13.5,14.7,16.1],"89.5":[10,10.8,13.7,14.9,16.2],"90":[10.1,10.9,13.8,15,16.4],"90.5":[10.2,11,13.9,15.1,16.5],"91":[10.3,11.1,14.1,15.3,16.7],"91.5":[10.4,11.2,14.2,15.4,16.8],"92":[10.5,11.3,14.3,15.6,17],"92.5":[10.6,11.4,14.4,15.7,17.1],"93":[10.7,11.5,14.6,15.8,17.3],"93.5":[10.7,11.6,14.7,16,17.4],"94":[10.8,11.7,14.8,16.1,17.6],"94.5":[10.9,11.8,14.9,16.3,17.7],"95":[11,11.9,15.1,16.4,17.9],"95.5":[11.1,12,15.2,16.5,18],"96":[11.2,12.1,15.3,16.7,18.2],"96.5":[11.3,12.2,15.5,16.8,18.4],"97":[11.4,12.3,15.6,17,18.5],"97.5":[11.5,12.4,15.7,17.1,18.7],"98":[11.6,12.5,15.9,17.3,18.9],"98.5":[11.7,12.6,16,17.5,19.1],"99":[11.8,12.7,16.2,17.6,19.2],"99.5":[11.9,12.8,16.3,17.8,19.4],"100":[12,12.9,16.5,18,19.6],"100.5":[12.1,13,16.6,18.1,19.8],"101":[12.2,13.2,16.8,18.3,20],"101.5":[12.3,13.3,16.9,18.5,20.2],"102":[12.4,13.4,17.1,18.7,20.4],"102.5":[12.5,13.5,17.3,18.8,20.6],"103":[12.6,13.6,17.4,19,20.8],"103.5":[12.7,13.7,17.6,19.2,21],"104":[12.8,13.9,17.8,19.4,21.2],"104.5":[12.9,14,17.9,19.6,21.5],"105":[13,14.1,18.1,19.8,21.7],"105.5":[13.2,14.2,18.3,20,21.9],"106":[13.3,14.4,18.5,20.2,22.1],"106.5":[13.4,14.5,18.6,20.4,22.4],"107":[13.5,14.6,18.8,20.6,22.6],"107.5":[13.6,14.7,19,20.8,22.8],"108":[13.7,14.9,19.2,21,23.1],"108.5":[13.8,15,19.4,21.2,23.3],"109":[14,15.1,19.6,21.4,23.6],"109.5":[14.1,15.3,19.8,21.7,23.8],"110":[14.2,15.4,20,21.9,24.1]}';
      final json=JSON.jsonDecode(dataList);
      print(json[valTinggi][0]);
    if (_y < json[valTinggi][0]) {
       setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Gizi buruk"
      "\n"
      "(severely wasted)"
      "\n";
    } else if (_y >= json[valTinggi][0] && _y < json[valTinggi][1]) {
       setState(() {
                 _warna=Colors.orange;
                }
  );
      _hasil = "Gizi kurang"
      "\n"
      "(wasted)"
      "\n";
    } else if (_y >= json[valTinggi][1] && _y < json[valTinggi][2]) {
       setState(() {
                 _warna=Colors.green;
                }
  );
      _hasil = "Gizi baik"
      "\n"
      "(normal)"
      "\n";
    }else if (_y >= json[valTinggi][2] && _y < json[valTinggi][3]) {
       setState(() {
                 _warna=Colors.orangeAccent;
                }
  );
      _hasil = "Berisiko gizi lebih"
      "\n"
      "(possible risk of overweight)"
      "\n";
    }else if (_y >= json[valTinggi][3] && _y < json[valTinggi][4]) {
       setState(() {
                 _warna=Colors.redAccent;
                }
  );
      _hasil = "Gizi lebih"
      "\n"
      "(overweight)"
      "\n";
    } else {
       setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Obesitas"
      "\n"
      "(obese)"
      "\n";
    }
    }else{
      var dataList = '{"45":[1.9,2.1,2.7,3,3.3],"45.5":[2,2.1,2.8,3.1,3.4],"46":[2,2.2,2.9,3.2,3.5],"46.5":[2.1,2.3,3,3.3,3.6],"47":[2.2,2.4,3.1,3.4,3.7],"47.5":[2.2,2.4,3.2,3.5,3.8],"48":[2.3,2.5,3.3,3.6,4],"48.5":[2.4,2.6,3.4,3.7,4.1],"49":[2.4,2.6,3.5,3.8,4.2],"49.5":[2.5,2.7,3.6,3.9,4.3],"50":[2.6,2.8,3.7,4,4.5],"50.5":[2.7,2.9,3.8,4.2,4.6],"51":[2.8,3,3.9,4.3,4.8],"51.5":[2.8,3.1,4,4.4,4.9],"52":[2.9,3.2,4.2,4.6,5.1],"52.5":[3,3.3,4.3,4.7,5.2],"53":[3.1,3.4,4.4,4.9,5.4],"53.5":[3.2,3.5,4.6,5,5.5],"54":[3.3,3.6,4.7,5.2,5.7],"54.5":[3.4,3.7,4.8,5.3,5.9],"55":[3.5,3.8,5,5.5,6.1],"55.5":[3.6,3.9,5.1,5.7,6.3],"56":[3.7,4,5.3,5.8,6.4],"56.5":[3.8,4.1,5.4,6,6.6],"57":[3.9,4.3,5.6,6.1,6.8],"57.5":[4,4.4,5.7,6.3,7],"58":[4.1,4.5,5.9,6.5,7.1],"58.5":[4.2,4.6,6,6.6,7.3],"59":[4.3,4.7,6.2,6.8,7.5],"59.5":[4.4,4.8,6.3,6.9,7.7],"60":[4.5,4.9,6.4,7.1,7.8],"60.5":[4.6,5,6.6,7.3,8],"61":[4.7,5.1,6.7,7.4,8.2],"61.5":[4.8,5.2,6.9,7.6,8.4],"62":[4.9,5.3,7,7.7,8.5],"62.5":[5,5.4,7.1,7.8,8.7],"63":[5.1,5.5,7.3,8,8.8],"63.5":[5.2,5.6,7.4,8.1,9],"64":[5.3,5.7,7.5,8.3,9.1],"64.5":[5.4,5.8,7.6,8.4,9.3],"65":[5.5,5.9,7.8,8.6,9.5],"65.5":[5.5,6,7.9,8.7,9.6],"66":[5.6,6.1,8,8.8,9.8],"66.5":[5.7,6.2,8.1,9,9.9],"67":[5.8,6.3,8.3,9.1,10],"67.5":[5.9,6.4,8.4,9.2,10.2],"68":[6,6.5,8.5,9.4,10.3],"68.5":[6.1,6.6,8.6,9.5,10.5],"69":[6.1,6.7,8.7,9.6,10.6],"69.5":[6.2,6.8,8.8,9.7,10.7],"70":[6.3,6.9,9,9.9,10.9],"70.5":[6.4,6.9,9.1,10,11],"71":[6.5,7,9.2,10.1,11.1],"71.5":[6.5,7.1,9.3,10.2,11.3],"72":[6.6,7.2,9.4,10.3,11.4],"72.5":[6.7,7.3,9.5,10.5,11.5],"73":[6.8,7.4,9.6,10.6,11.7],"73.5":[6.9,7.4,9.7,10.7,11.8],"74":[6.9,7.5,9.8,10.8,11.9],"74.5":[7,7.6,9.9,10.9,12],"75":[7.1,7.7,10,11,12.2],"75.5":[7.1,7.8,10.1,11.1,12.3],"76":[7.2,7.8,10.2,11.2,12.4],"76.5":[7.3,7.9,10.3,11.4,12.5],"77":[7.4,8,10.4,11.5,12.6],"77.5":[7.4,8.1,10.5,11.6,12.8],"78":[7.5,8.2,10.6,11.7,12.9],"78.5":[7.6,8.2,10.7,11.8,13],"79":[7.7,8.3,10.8,11.9,13.1],"79.5":[7.7,8.4,10.9,12,13.3],"80":[7.8,8.5,11,12.1,13.4],"80.5":[7.9,8.6,11.2,12.3,13.5],"81":[8,8.7,11.3,12.4,13.7],"81.5":[8.1,8.8,11.4,12.5,13.8],"82":[8.1,8.8,11.5,12.6,13.9],"82.5":[8.2,8.9,11.6,12.8,14.1],"83":[8.3,9,11.8,12.9,14.2],"83.5":[8.4,9.1,11.9,13.1,14.4],"84":[8.5,9.2,12,13.2,14.5],"84.5":[8.6,9.3,12.1,13.3,14.7],"85":[8.7,9.4,12.3,13.5,14.9],"85.5":[8.8,9.5,12.4,13.6,15],"86":[8.9,9.7,12.6,13.8,15.2],"86.5":[9,9.8,12.7,13.9,15.4],"87":[9.1,9.9,12.8,14.1,15.5],"87.5":[9.2,10,13,14.2,15.7],"88":[9.3,10.1,13.1,14.4,15.9],"88.5":[9.4,10.2,13.2,14.5,16],"89":[9.5,10.3,13.4,14.7,16.2],"89.5":[9.6,10.4,13.5,14.8,16.4],"90":[9.7,10.5,13.7,15,16.5],"90.5":[9.8,10.6,13.8,15.1,16.7],"91":[9.9,10.7,13.9,15.3,16.9],"91.5":[10,10.8,14.1,15.5,17],"92":[10.1,10.9,14.2,15.6,17.2],"92.5":[10.1,11,14.3,15.8,17.4],"93":[10.2,11.1,14.5,15.9,17.5],"93.5":[10.3,11.2,14.6,16.1,17.7],"94":[10.4,11.3,14.7,16.2,17.9],"94.5":[10.5,11.4,14.9,16.4,18],"95":[10.6,11.5,15,16.5,18.2],"95.5":[10.7,11.6,15.2,16.7,18.4],"96":[10.8,11.7,15.3,16.8,18.6],"96.5":[10.9,11.8,15.4,17,18.7],"97":[11,12,15.6,17.1,18.9],"97.5":[11.1,12.1,15.7,17.3,19.1],"98":[11.2,12.2,15.9,17.5,19.3],"98.5":[11.3,12.3,16,17.6,19.5],"99":[11.4,12.4,16.2,17.8,19.6],"99.5":[11.5,12.5,16.3,18,19.8],"100":[11.6,12.6,16.5,18.1,20],"100.5":[11.7,12.7,16.6,18.3,20.2],"101":[11.8,12.8,16.8,18.5,20.4],"101.5":[11.9,13,17,18.7,20.6],"102":[12,13.1,17.1,18.9,20.8],"102.5":[12.1,13.2,17.3,19,21],"103":[12.3,13.3,17.5,19.2,21.3],"103.5":[12.4,13.5,17.6,19.4,21.5],"104":[12.5,13.6,17.8,19.6,21.7],"104.5":[12.6,13.7,18,19.8,21.9],"105":[12.7,13.8,18.2,20,22.2],"105.5":[12.8,14,18.4,20.2,22.4],"106":[13,14.1,18.5,20.5,22.6],"106.5":[13.1,14.3,18.7,20.7,22.9],"107":[13.2,14.4,18.9,20.9,23.1],"107.5":[13.3,14.5,19.1,21.1,23.4],"108":[13.5,14.7,19.3,21.3,23.6],"108.5":[13.6,14.8,19.5,21.6,23.9],"109":[13.7,15,19.7,21.8,24.2],"109.5":[13.9,15.1,20,22,24.4],"110":[14,15.3,20.2,22.3,24.7]}';
      final json=JSON.jsonDecode(dataList);
      print(json[valTinggi][0]);
    if (_y < json[valTinggi][0]) {
       setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Gizi buruk"
      "\n"
      "(severely wasted)"
      "\n";
    } else if (_y >= json[valTinggi][0] && _y < json[valTinggi][1]) {
       setState(() {
                 _warna=Colors.orange;
                }
  );
      _hasil = "Gizi kurang"
      "\n"
      "(wasted)"
      "\n";
    } else if (_y >= json[valTinggi][1] && _y < json[valTinggi][2]) {
       setState(() {
                 _warna=Colors.green;
                }
  );
      _hasil = "Gizi baik"
      "\n"
      "(normal)"
      "\n";
    }else if (_y >= json[valTinggi][2] && _y < json[valTinggi][3]) {
       setState(() {
                 _warna=Colors.orangeAccent;
                }
  );
      _hasil = "Berisiko gizi lebih"
      "\n"
      "(possible risk of overweight)"
      "\n";
    }else if (_y >= json[valTinggi][3] && _y < json[valTinggi][4]) {
       setState(() {
                 _warna=Colors.redAccent;
                }
  );
      _hasil = "Gizi lebih"
      "\n"
      "(overweight)"
      "\n";
    } else {
       setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Obesitas"
      "\n"
      "(obese)"
      "\n";
    }
    }
    return _hasil;
  }

  void _prosesBBTB() {
    _hasil = bbController.text;
    double _bb = double.parse(bbController.text);
    // double _tb = double.parse(tbController.text);
    setState(() {
      _hasil = _rumus_bb_tb(tbController.text, _bb,dropdownValue);
    });
    _showModalBottomSheet(context);
  }

 Widget form_bb_tinggi() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Center(
              child: Text(
            "Untuk Usia 0-24 Bulan",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
        ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.black38)),
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: DropdownButton(
                isExpanded: true,
                value: dropdownValue,
                hint: Text("Jenis Kelamin"),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Laki-laki', 'Perempuan']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.expand(height: 60),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: bbController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Berat Badan (Kg)',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      // controller: _usernameController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.expand(height: 60),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: tbController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Tinggi Badan (Cm)',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      // controller: _usernameController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                  color: kPrimaryColor,
                  child: MaterialButton(
                    onPressed: () {
                      _prosesBBTB();
                    },
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    // onPressed: state is! RegisLoading ? _onRegisButtonPressed : null,
                    child: Text(
                      'Cek Status Gizi Anak',
                      style: kBtnStyle,
                      ),
                    ),
                  )),
             SizedBox(
              height: 16,
            ),
      ],
    );
  }


  @override
  void initState() {
    
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BackHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Tinggi Badan ",
              textBottom: "Menurut Berat",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  form_bb_tinggi(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

 