import 'package:flutter/material.dart';
import 'dart:convert' as JSON;
void main() => runApp(BbTb2());
String dropdownValue;
double _value = 0.0;
int _valueSlide=0;
final bbController = TextEditingController();
final tbController = TextEditingController();



class BbTb2 extends StatefulWidget {
  BbTb2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BbTb2State createState() => _BbTb2State();
}

class _BbTb2State extends State<BbTb2> {
  String _hasil = "";
  var _warna;
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
      var dataList = '{"65":[5.9,6.3,8.1,8.8,9.6],"65.5":[6,6.4,8.2,8.9,9.8],"66":[6.1,6.5,8.3,9.1,9.9],"66.5":[6.1,6.6,8.5,9.2,10.1],"67":[6.2,6.7,8.6,9.4,10.2],"67.5":[6.3,6.8,8.7,9.5,10.4],"68":[6.4,6.9,8.8,9.6,10.5],"68.5":[6.5,7,9,9.8,10.7],"69":[6.6,7.1,9.1,9.9,10.8],"69.5":[6.7,7.2,9.2,10,11],"70":[6.8,7.3,9.3,10.2,11.1],"70.5":[6.9,7.4,9.5,10.3,11.3],"71":[6.9,7.5,9.6,10.4,11.4],"71.5":[7,7.6,9.7,10.6,11.6],"72":[7.1,7.7,9.8,10.7,11.7],"72.5":[7.2,7.8,9.9,10.8,11.8],"73":[7.3,7.9,10,11,12],"73.5":[7.4,7.9,10.2,11.1,12.1],"74":[7.4,8,10.3,11.2,12.2],"74.5":[7.5,8.1,10.4,11.3,12.4],"75":[7.6,8.2,10.5,11.4,12.5],"75.5":[7.7,8.3,10.6,11.6,12.6],"76":[7.7,8.4,10.7,11.7,12.8],"76.5":[7.8,8.5,10.8,11.8,12.9],"77":[7.9,8.5,10.9,11.9,13],"77.5":[8,8.6,11,12,13.1],"78":[8,8.7,11.1,12.1,13.3],"78.5":[8.1,8.8,11.2,12.2,13.4],"79":[8.2,8.8,11.3,12.3,13.5],"79.5":[8.3,8.9,11.4,12.4,13.6],"80":[8.3,9,11.5,12.6,13.7],"80.5":[8.4,9.1,11.6,12.7,13.8],"81":[8.5,9.2,11.7,12.8,14],"81.5":[8.6,9.3,11.8,12.9,14.1],"82":[8.7,9.3,11.9,13,14.2],"82.5":[8.7,9.4,12.1,13.1,14.4],"83":[8.8,9.5,12.2,13.3,14.5],"83.5":[8.9,9.6,12.3,13.4,14.6],"84":[9,9.7,12.4,13.5,14.8],"84.5":[9.1,9.9,12.5,13.7,14.9],"85":[9.2,10,12.7,13.8,15.1],"85.5":[9.3,10.1,12.8,13.9,15.2],"86":[9.4,10.2,12.9,14.1,15.4],"86.5":[9.5,10.3,13.1,14.2,15.5],"87":[9.6,10.4,13.2,14.4,15.7],"87.5":[9.7,10.5,13.3,14.5,15.8],"88":[9.8,10.6,13.5,14.7,16],"88.5":[9.9,10.7,13.6,14.8,16.1],"89":[10,10.8,13.7,14.9,16.3],"89.5":[10.1,10.9,13.9,15.1,16.4],"90":[10.2,11,14,15.2,16.6],"90.5":[10.3,11.1,14.1,15.3,16.7],"91":[10.4,11.2,14.2,15.5,16.9],"91.5":[10.5,11.3,14.4,15.6,17],"92":[10.6,11.4,14.5,15.8,17.2],"92.5":[10.7,11.5,14.6,15.9,17.3],"93":[10.8,11.6,14.7,16,17.5],"93.5":[10.9,11.7,14.9,16.2,17.6],"94":[11,11.8,15,16.3,17.8],"94.5":[11.1,11.9,15.1,16.5,17.9],"95":[11.1,12,15.3,16.6,18.1],"95.5":[11.2,12.1,15.4,16.7,18.3],"96":[11.3,12.2,15.5,16.9,18.4],"96.5":[11.4,12.3,15.7,17,18.6],"97":[11.5,12.4,15.8,17.2,18.8],"97.5":[11.6,12.5,15.9,17.4,18.9],"98":[11.7,12.6,16.1,17.5,19.1],"98.5":[11.8,12.8,16.2,17.7,19.3],"99":[11.9,12.9,16.4,17.9,19.5],"99.5":[12,13,16.5,18,19.7],"100":[12.1,13.1,16.7,18.2,19.9],"100.5":[12.2,13.2,16.9,18.4,20.1],"101":[12.3,13.3,17,18.5,20.3],"101.5":[12.4,13.4,17.2,18.7,20.5],"102":[12.5,13.6,17.3,18.9,20.7],"102.5":[12.6,13.7,17.5,19.1,20.9],"103":[12.8,13.8,17.7,19.3,21.1],"103.5":[12.9,13.9,17.8,19.5,21.3],"104":[13,14,18,19.7,21.6],"104.5":[13.1,14.2,18.2,19.9,21.8],"105":[13.2,14.3,18.4,20.1,22],"105.5":[13.3,14.4,18.5,20.3,22.2],"106":[13.4,14.5,18.7,20.5,22.5],"106.5":[13.5,14.7,18.9,20.7,22.7],"107":[13.7,14.8,19.1,20.9,22.9],"107.5":[13.8,14.9,19.3,21.1,23.2],"108":[13.9,15.1,19.5,21.3,23.4],"108.5":[14,15.2,19.7,21.5,23.7],"109":[14.1,15.3,19.8,21.8,23.9],"109.5":[14.3,15.5,20,22,24.2],"110":[14.4,15.6,20.2,22.2,24.4],"110.5":[14.5,15.8,20.4,22.4,24.7],"111":[14.6,15.9,20.7,22.7,25],"111.5":[14.8,16,20.9,22.9,25.2],"112":[14.9,16.2,21.1,23.1,25.5],"112.5":[15,16.3,21.3,23.4,25.8],"113":[15.2,16.5,21.5,23.6,26],"113.5":[15.3,16.6,21.7,23.9,26.3],"114":[15.4,16.8,21.9,24.1,26.6],"114.5":[15.6,16.9,22.1,24.4,26.9],"115":[15.7,17.1,22.4,24.6,27.2],"115.5":[15.8,17.2,22.6,24.9,27.5],"116":[16,17.4,22.8,25.1,27.8],"116.5":[16.1,17.5,23,25.4,28],"117":[16.2,17.7,23.3,25.6,28.3],"117.5":[16.4,17.9,23.5,25.9,28.6],"118":[16.5,18,23.7,26.1,28.9],"118.5":[16.7,18.2,23.9,26.4,29.2],"119":[16.8,18.3,24.1,26.6,29.5],"119.5":[16.9,18.5,24.4,26.9,29.8],"120":[17.1,18.6,24.6,27.2,30.1]}';
      final json=JSON.jsonDecode(dataList);
      print(json[valTinggi][0]);
    if (_y < json[valTinggi][0]) {
       setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Gizi buruk (severely wasted)";
    } else if (_y >= json[valTinggi][0] && _y < json[valTinggi][1]) {
       setState(() {
                 _warna=Colors.orange;
                }
  );
      _hasil = "Gizi kurang (wasted)";
    } else if (_y >= json[valTinggi][1] && _y < json[valTinggi][2]) {
       setState(() {
                 _warna=Colors.green;
                }
  );
      _hasil = "Gizi baik (normal)";
    }else if (_y >= json[valTinggi][2] && _y < json[valTinggi][3]) {
       setState(() {
                 _warna=Colors.orangeAccent;
                }
  );
      _hasil = "Berisiko gizi lebih(possible risk of overweight)";
    }else if (_y >= json[valTinggi][3] && _y < json[valTinggi][4]) {
       setState(() {
                 _warna=Colors.redAccent;
                }
  );
      _hasil = "Gizi lebih (overweight)";
    } else {
       setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Obesitas (obese)";
    }
    }else{
      var dataList = '{"65":[5.6,6.1,7.9,8.7,9.7],"65.5":[5.7,6.2,8.1,8.9,9.8],"66":[5.8,6.3,8.2,9,10],"66.5":[5.8,6.4,8.3,9.1,10.1],"67":[5.9,6.4,8.4,9.3,10.2],"67.5":[6,6.5,8.5,9.4,10.4],"68":[6.1,6.6,8.7,9.5,10.5],"68.5":[6.2,6.7,8.8,9.7,10.7],"69":[6.3,6.8,8.9,9.8,10.8],"69.5":[6,6.9,9,9.9,10.9],"70":[6.4,7,9.1,10,11.1],"70.5":[6.5,7.1,9.2,10.1,11.2],"71":[6.6,7.1,9.3,10.3,11.3],"71.5":[6.7,7.2,9.4,10.4,11.5],"72":[6.7,7.3,9.5,10.5,11.6],"72.5":[6.8,7.4,9.7,10.6,11.7],"73":[6.9,7.5,9.8,10.7,11.8],"73.5":[7,7.6,9.9,10.8,12],"74":[7,7.6,10,11,12.1],"74.5":[7.1,7.7,10.1,11.1,12.2],"75":[7.2,7.8,10.2,11.2,12.3],"75.5":[7.2,7.9,10.3,11.3,12.5],"76":[7.3,8,10.4,11.4,12.6],"76.5":[7.4,8,10.5,11.5,12.7],"77":[7.5,8.1,10.6,11.6,12.8],"77.5":[7.5,8.2,10.7,11.7,12.9],"78":[7.6,8.3,10.8,11.8,13.1],"78.5":[7.7,8.4,10.9,12,13.2],"79":[7.8,8.4,11,12.1,13.3],"79.5":[7.8,8.5,11.1,12.2,13.4],"80":[7.9,8.6,11.2,12.3,13.6],"80.5":[8,8.7,11.3,12.4,13.7],"81":[8.1,8.8,11.4,12.6,13.9],"81.5":[8.2,8.9,11.6,12.7,14],"82":[8.3,9,11.7,12.8,14.1],"82.5":[8.4,9.1,11.8,13,14.3],"83":[8.5,9.2,11.9,13.1,14.5],"83.5":[8.5,9.3,12.1,13.3,14.6],"84":[8.6,9.4,12.2,13.4,14.8],"84.5":[8.7,9.5,12.3,13.5,14.9],"85":[8.8,9.6,12.5,13.7,15.1],"85.5":[8.9,9.7,12.6,13.8,15.3],"86":[9,9.8,12.7,14,15.4],"86.5":[9.1,9.9,12.9,14.2,15.6],"87":[9.2,10,13,14.3,15.8],"87.5":[9.3,10.1,13.2,14.5,15.9],"88":[9.4,10.2,13.3,14.6,16.1],"88.5":[9.5,10.3,13.4,14.8,16.3],"89":[9.6,10.4,13.6,14.9,16.4],"89.5":[9.7,10.5,13.7,15.1,16.6],"90":[9.8,10.6,13.8,15.2,16.8],"90.5":[9.9,10.7,14,15.4,16.9],"91":[10,10.9,14.1,15.5,17.1],"91.5":[10.1,11,14.3,15.7,17.3],"92":[10.2,11.1,14.4,15.8,17.4],"92.5":[10.3,11.2,14.5,16,17.6],"93":[10.4,11.3,14.7,16.1,17.8],"93.5":[10.5,11.4,14.8,16.3,17.9],"94":[10.6,11.5,14.9,16.4,18.1],"94.5":[10.7,11.6,15.1,16.6,18.3],"95":[10.8,11.7,15.2,16.7,18.5],"95.5":[10.8,11.8,15.4,16.9,18.6],"96":[10.9,11.9,15.5,17,18.8],"96.5":[11,12,15.6,17.2,19],"97":[11.1,12.1,15.8,17.4,19.2],"97.5":[11.2,12.2,15.9,17.5,19.3],"98":[11.3,12.3,16.1,17.7,19.5],"98.5":[11.4,12.4,16.2,17.9,19.7],"99":[11.5,12.5,16.4,18,19.9],"99.5":[11.6,12.7,16.5,18.2,20.1],"100":[11.7,12.8,16.7,18.4,20.3],"100.5":[11.9,12.9,16.9,18.6,20.5],"101":[12,13,17,18.7,20.7],"101.5":[12.1,13.1,17.2,18.9,20.9],"102":[12.2,13.3,17.4,19.1,21.1],"102.5":[12.3,13.4,17.5,19.3,21.4],"103":[12.4,13.5,17.7,19.5,21.6],"103.5":[12.5,13.6,17.9,19.7,21.8],"104":[12.6,13.8,18.1,19.9,22],"104.5":[12.8,13.9,18.2,20.1,22.3],"105":[12.9,14,18.4,20.3,22.5],"105.5":[13,14.2,18.6,20.5,22.7],"106":[13.1,14.3,18.8,20.8,23],"106.5":[13.3,14.5,19,21,23.2],"107":[13.4,14.6,19.2,21.2,23.5],"107.5":[13.5,14.7,19.4,21.4,23.7],"108":[13.7,14.9,19.6,21.7,24],"108.5":[13.8,15,19.8,21.9,24.3],"109":[13.9,15.2,20,22.1,24.5],"109.5":[14.1,15.4,20.3,22.4,24.8],"110":[14.2,15.5,20.5,22.6,25.1],"110.5":[14.4,15.7,20.7,22.9,25.4],"111":[14.5,15.8,20.9,23.1,25.7],"111.5":[14.7,16,21.2,23.4,26],"112":[14.8,16.2,21.4,23.6,26.2],"112.5":[15,16.3,21.6,23.9,26.5],"113":[15.1,16.5,21.8,24.2,26.8],"113.5":[15.3,16.7,22.1,24.4,27.1],"114":[15.4,16.8,22.3,24.7,27.4],"114.5":[15.6,17,22.6,25,27.8],"115":[15.7,17.2,22.8,25.2,28.1],"115.5":[15.9,17.3,23,25.5,28.4],"116":[16,17.5,23.3,25.8,28.7],"116.5":[16.2,17.7,23.5,26.1,29],"117":[16.3,17.8,23.8,26.3,29.3],"117.5":[16.5,18,24,26.6,29.6],"118":[16.6,18.2,24.2,26.9,29.9],"118.5":[16.8,18.4,24.5,27.2,30.3],"119":[16.9,18.5,24.7,27.4,30.6],"119.5":[17.1,18.7,25,27.7,30.9],"120":[17.3,18.9,25.2,28,31.2]}';
      final json=JSON.jsonDecode(dataList);
      print(json[valTinggi][0]);
    if (_y < json[valTinggi][0]) {
       setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Gizi buruk (severely wasted)";
    } else if (_y >= json[valTinggi][0] && _y < json[valTinggi][1]) {
       setState(() {
                 _warna=Colors.orange;
                }
  );
      _hasil = "Gizi kurang (wasted)";
    } else if (_y >= json[valTinggi][1] && _y < json[valTinggi][2]) {
       setState(() {
                 _warna=Colors.green;
                }
  );
      _hasil = "Gizi baik (normal)";
    }else if (_y >= json[valTinggi][2] && _y < json[valTinggi][3]) {
       setState(() {
                 _warna=Colors.orangeAccent;
                }
  );
      _hasil = "Berisiko gizi lebih(possible risk of overweight)";
    }else if (_y >= json[valTinggi][3] && _y < json[valTinggi][4]) {
       setState(() {
                 _warna=Colors.redAccent;
                }
  );
      _hasil = "Gizi lebih (overweight)";
    } else {
       setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Obesitas (obese)";
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
  }

  Widget form_bb_tinggi() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Center(
              child: Text(
            "Tinggi Badan menurut Berat Badan",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          child: Center(
              child: Text(
            "Umur 24 - 60 Bulan",
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          )),
        ),
        SizedBox(
          height: 8,
        ),
        Card(
            child: Column(
          children: <Widget>[
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
                  color: Color(0xFF29B6F6),
                  child: MaterialButton(
                    onPressed: () {
                      _prosesBBTB();
                    },
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    // onPressed: state is! RegisLoading ? _onRegisButtonPressed : null,
                    child: Text(
                      'Cek Status Gizi Anak',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  )),
            ),
             SizedBox(
              height: 16,
            ),
            Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _warna,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:
                  Text('$_hasil',textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)
                  )
          ],
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tinggi Badan menurut Berat Badan "),
      ),
      body:
          
          SingleChildScrollView(child:
          Padding(padding: EdgeInsets.all(16),
            child:form_bb_tinggi()
            )),
    );
  }
}
