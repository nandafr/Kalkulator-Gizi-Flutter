import 'package:flutter/material.dart';
import 'dart:convert' as JSON;
void main() => runApp(Imt());
String dropdownValue;
double _value = 0.0;
int _valueSlide=0;
final bbController = TextEditingController();
final tbController = TextEditingController();



class Imt extends StatefulWidget {
  Imt({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ImtState createState() => _ImtState();
}

class _ImtState extends State<Imt> {
  String _hasil = "";
  var _warna;
  _rumus_imt(double _x, double _y,String jk) {
    _x=_x/100;
     double imt=_y/(_x*_x);
    if(jk=="Laki-laki"){
     
      print(imt);
      var dataList = [
        [10.2,11.1,14.8,16.3,18.1],
[11.3,12.4,16.3,17.8,19.4],
[12.5,13.7,17.8,19.4,21.1],
[13.1,14.3,18.4,20,21.8],
[13.4,14.5,18.7,20.3,22.1],
[13.5,14.7,18.8,20.5,22.3],
[13.6,14.7,18.8,20.5,22.3],
[13.7,14.8,18.8,20.5,22.3],
[13.6,14.7,18.7,20.4,22.2],
[13.6,14.7,18.6,20.3,22.1],
[13.5,14.6,18.5,20.1,22],
[13.4,14.5,18.4,20,21.8],
[13.4,14.4,18.2,19.8,21.6],
[13.3,14.3,18.1,19.7,21.5],
[13.2,14.2,18,19.5,21.3],
[13.1,14.1,17.8,19.4,21.2],
[13.1,14,17.7,19.3,21],
[13,13.9,17.6,19.1,20.9],
[12.9,13.9,17.5,19,20.8],
[12.9,13.8,17.4,18.9,20.7],
[12.8,13.7,17.3,18.8,20.6],
[12.8,13.7,17.2,18.7,20.5],
[12.7,13.6,17.2,18.7,20.4],
[12.7,13.6,17.1,18.6,20.3],
[12.9,13.8,17.3,18.9,20.6],
[12.8,13.8,17.3,18.8,20.5],
[12.8,13.7,17.3,18.8,20.5],
[12.7,13.7,17.2,18.7,20.4],
[12.7,13.6,17.2,18.7,20.4],
[12.7,13.6,17.1,18.6,20.3],
[12.6,13.6,17.1,18.6,20.2],
[12.6,13.5,17.1,18.5,20.2],
[12.5,13.5,17,18.5,20.1],
[12.5,13.5,17,18.5,20.1],
[12.5,13.4,17,18.4,20],
[12.4,13.4,16.9,18.4,20],
[12.4,13.4,16.9,18.4,20],
[12.4,13.3,16.9,18.3,19.9],
[12.3,13.3,16.8,18.3,19.9],
[12.3,13.3,16.8,18.3,19.9],
[12.3,13.2,16.8,18.2,19.9],
[12.2,13.2,16.8,18.2,19.9],
[12.2,13.2,16.8,18.2,19.8],
[12.2,13.2,16.7,18.2,19.8],
[12.2,13.1,16.7,18.2,19.8],
[12.2,13.1,16.7,18.2,19.8],
[12.1,13.1,16.7,18.2,19.8],
[12.1,13.1,16.7,18.2,19.9],
[12.1,13.1,16.7,18.2,19.9],
[12.1,13,16.7,18.2,19.9],
[12.1,13,16.7,18.2,19.9],
[12.1,13,16.6,18.2,19.9],
[12,13,16.6,18.2,19.9],
[12,13,16.6,18.2,20],
[12,13,16.6,18.2,20],
[12,13,16.6,18.2,20],
[12,12.9,16.6,18.2,20.1],
[12,12.9,16.6,18.2,20.1],
[12,12.9,16.6,18.3,20.2],
[12,12.9,16.6,18.3,20.2],
[12,12.9,16.6,18.3,20.3]
      ];
    if (imt < dataList[_valueSlide][0]) {
      setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Gizi buruk (severely wasted)";
    } else if (imt >= dataList[_valueSlide][0] && imt < dataList[_valueSlide][1]) {
      setState(() {
                 _warna=Colors.orangeAccent;
                }
  );
      _hasil = "Gizi kurang (wasted)";
    } else if (imt >= dataList[_valueSlide][1] && imt < dataList[_valueSlide][2]) {
      _hasil = "Gizi baik (normal)";
      setState(() {
                 _warna=Colors.green;
                }
  );
    }else if (imt >= dataList[_valueSlide][2] && imt < dataList[_valueSlide][3]) {
      _hasil = "Berisiko gizi lebih(possible risk of overweight)";
      setState(() {
                 _warna=Colors.orange;
                }
  );
    }else if (imt >= dataList[_valueSlide][3] && imt < dataList[_valueSlide][4]) {
      _hasil = "Gizi lebih (overweight)";
      setState(() {
                 _warna=Colors.redAccent;
                }
  );
    } else {
      _hasil = "Obesitas (obese)";
      setState(() {
                 _warna=Colors.red;
                }
  );
    }
    }else{
      var dataList = [
        [10.1,11.1,14.6,16.1,17.7],
[10.8,12,16,17.5,19.1],
[11.8,13,17.3,19,20.7],
[12.4,13.6,17.9,19.7,21.5],
[12.7,13.9,18.3,20,22],
[12.9,14.1,18.4,20.2,22.2],
[13,14.1,18.5,20.3,22.3],
[13,14.2,18.5,20.3,22.3],
[13,14.1,18.4,20.2,22.2],
[12.9,14.1,18.3,20.1,22.1],
[12.9,14,18.2,19.9,21.9],
[12.8,13.9,18,19.8,21.8],
[12.7,13.8,17.9,19.6,21.6],
[12.6,13.7,17.7,19.5,21.4],
[12.6,13.6,17.6,19.3,21.3],
[12.5,13.5,17.5,19.2,21.1],
[12.4,13.5,17.4,19.1,21],
[12.4,13.4,17.3,18.9,20.9],
[12.3,13.3,17.2,18.8,20.8],
[12.3,13.3,17.1,18.8,20.7],
[12.2,13.2,17,18.7,20.6],
[12.2,13.2,17,18.6,20.5],
[12.2,13.1,16.9,18.5,20.4],
[12.2,13.1,16.9,18.5,20.4],
[12.4,13.3,17.1,18.7,20.6],
[12.4,13.3,17.1,18.7,20.6],
[12.3,13.3,17,18.7,20.6],
[12.3,13.3,17,18.6,20.5],
[12.3,13.3,17,18.6,20.5],
[12.3,13.2,17,18.6,20.4],
[12.3,13.2,16.9,18.5,20.4],
[12.2,13.2,16.9,18.5,20.4],
[12.2,13.2,16.9,18.5,20.4],
[12.2,13.1,16.9,18.5,20.3],
[12.2,13.1,16.8,18.5,20.3],
[12.1,13.1,16.8,18.4,20.3],
[12.1,13.1,16.8,18.4,20.3],
[12.1,13.1,16.8,18.4,20.3],
[12.1,13,16.8,18.4,20.3],
[12,13,16.8,18.4,20.3],
[12,13,16.8,18.4,20.3],
[12,13,16.8,18.4,20.4],
[12,12.9,16.8,18.4,20.4],
[11.9,12.9,16.8,18.4,20.4],
[11.9,12.9,16.8,18.5,20.4],
[11.9,12.9,16.8,18.5,20.5],
[11.9,12.9,16.8,18.5,20.5],
[11.8,12.8,16.8,18.5,20.5],
[11.8,12.8,16.8,18.5,20.6],
[11.8,12.8,16.8,18.5,20.6],
[11.8,12.8,16.8,18.6,20.7],
[11.8,12.8,16.8,18.6,20.7],
[11.7,12.8,16.8,18.6,20.7],
[11.7,12.7,16.8,18.6,20.8],
[11.7,12.7,16.8,18.7,20.8],
[11.7,12.7,16.8,18.7,20.9],
[11.7,12.7,16.8,18.7,20.9],
[11.7,12.7,16.9,18.7,21],
[11.7,12.7,16.9,18.8,21],
[11.6,12.7,16.9,18.8,21],
[11.6,12.7,16.9,18.8,21.1]
      ];
    if (imt < dataList[_valueSlide][0]) {
      setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Gizi buruk (severely wasted)";
    } else if (imt >= dataList[_valueSlide][0] && imt < dataList[_valueSlide][1]) {
      setState(() {
                 _warna=Colors.orangeAccent;
                }
  );
      _hasil = "Gizi kurang (wasted)";
    } else if (imt >= dataList[_valueSlide][1] && imt < dataList[_valueSlide][2]) {
      _hasil = "Gizi baik (normal)";
      setState(() {
                 _warna=Colors.green;
                }
  );
    }else if (imt >= dataList[_valueSlide][2] && imt < dataList[_valueSlide][3]) {
      _hasil = "Berisiko gizi lebih(possible risk of overweight)";
      setState(() {
                 _warna=Colors.orange;
                }
  );
    }else if (imt >= dataList[_valueSlide][3] && imt < dataList[_valueSlide][4]) {
      _hasil = "Gizi lebih (overweight)";
      setState(() {
                 _warna=Colors.redAccent;
                }
  );
    } else {
      _hasil = "Obesitas (obese)";
      setState(() {
                 _warna=Colors.red;
                }
  );
    }
    }
    return _hasil;
  }
  void _prosesIMT() {
    _hasil = bbController.text;
    double _bb = double.parse(bbController.text);
    double _tb = double.parse(tbController.text);
    setState(() {
      _hasil = _rumus_imt(_tb, _bb,dropdownValue);
    });
  }
  Widget form_imt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Center(
              child: Text(
            "Index Masa Tubuh",
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
            "Umur 0 - 60 Bulan",
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
                constraints: BoxConstraints.expand(height: 85),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            style: BorderStyle.solid, color: Colors.black38)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 5),
                          child: Text(
                            "Umur : $_valueSlide Bulan",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.blue[700],
                            inactiveTrackColor: Colors.blue[100],
                            trackShape: RoundedRectSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            thumbColor: Colors.blueAccent,
                            overlayColor: Colors.blue.withAlpha(32),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 28.0),
                            tickMarkShape: RoundSliderTickMarkShape(),
                            activeTickMarkColor: Colors.blue[700],
                            inactiveTickMarkColor: Colors.blue[100],
                            valueIndicatorShape:
                                PaddleSliderValueIndicatorShape(),
                            valueIndicatorColor: Colors.blueAccent,
                            valueIndicatorTextStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          child: Slider(
                            value: _value,
                            min: 0.0,
                            max: 60.0,
                            divisions: 60,
                            label: '$_valueSlide Bulan',
                            onChanged: (value) {
                              setState(
                                () {
                                  _value = value;
                                  _valueSlide=value.round();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ))),
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
                      _prosesIMT();
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
        title: Text("Index Masa Tubuh Menurut Umur"),
      ),
      body:
          // Column(children: <Widget>[
          //   Padding(padding: EdgeInsets.all(16),
          //   child:menu_gizi()
          //   )

          // ],)
          SingleChildScrollView(child:
          Padding(padding: EdgeInsets.all(16),
            child:form_imt()
            )),
    );
  }
}
