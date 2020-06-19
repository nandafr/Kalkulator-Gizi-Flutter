import 'package:flutter/material.dart';
import 'dart:convert' as JSON;
void main() => runApp(UmurBB());
String dropdownValue;
double _value = 0.0;
int _valueSlide=0;
final bbController = TextEditingController();
final tbController = TextEditingController();



class UmurBB extends StatefulWidget {
  UmurBB({Key key, this.title}) : super(key: key);

  final String title;
  
  @override
  _UmurBBState createState() => _UmurBBState();
}
var _warna;
class _UmurBBState extends State<UmurBB> {
  String _hasil = "";
  
  
  _rumus_umur_bb(int _x, double _y,String jk) {
    if(jk=="Laki-laki"){
      var dataList = [
      [2.1, 2.5, 3.9],
      [2.9, 3.4, 5.1],
      [3.8, 4.3, 6.3],
      [4.4, 5, 7.2],
      [4.9, 5.6, 7.8],
      [5.3, 6, 8.4],
      [5.7, 6.4, 8.8],
      [5.9, 6.7, 9.2],
      [6.2, 6.9, 9.6],
      [6.4, 7.1, 9.9],
      [6.6, 7.4, 10.2],
      [6.8, 7.6, 10.5],
      [6.9, 7.7, 10.8],
      [7.1, 7.9, 11],
      [7.2, 8.1, 11.3],
      [7.4, 8.3, 11.5],
      [7.5, 8.4, 11.7],
      [7.7, 8.6, 12],
      [7.8, 8.8, 12.2],
      [8, 8.9, 12.5],
      [8.1, 9.1, 12.7],
      [8.2, 9.2, 12.9],
      [8.4, 9.4, 13.2],
      [8.5, 9.5, 13.4],
      [8.6, 9.7, 13.6],
      [8.8, 9.8, 13.9],
      [8.9, 10, 14.1],
      [9, 10.1, 14.3],
      [9.1, 10.2, 14.5],
      [9.2, 10.4, 14.8],
      [9.4, 10.5, 15],
      [9.5, 10.7, 15.2],
      [9.6, 10.8, 15.4],
      [9.7, 10.9, 15.6],
      [9.8, 11, 15.8],
      [9.9, 11.2, 16],
      [10, 11.3, 16.2],
      [10.1, 11.4, 16.4],
      [10.2, 11.5, 16.6],
      [10.3, 11.6, 16.8],
      [10.4, 11.8, 17],
      [10.5, 11.9, 17.2],
      [10.6, 12, 17.4],
      [10.7, 12.1, 17.6],
      [10.8, 12.2, 17.8],
      [10.9, 12.4, 18],
      [11, 12.5, 18.2],
      [11.1, 12.6, 18.4],
      [11.2, 12.7, 18.6],
      [11.3, 12.8, 18.8],
      [11.4, 12.9, 19],
      [11.5, 13.1, 19.2],
      [11.6, 13.2, 19.4],
      [11.7, 13.3, 19.6],
      [11.8, 13.4, 19.8],
      [11.9, 13.5, 20],
      [12, 13.6, 20.2],
      [12.1, 13.7, 20.4],
      [12.2, 13.8, 20.6],
      [12.3, 14, 20.8],
      [12.4, 14.1, 21]
    ];
    if (_y < dataList[_x][0]) {
      setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Berat badan sangat kurang (severely underweight)";
    } else if (_y >= dataList[_x][0] && _y < dataList[_x][1]) {
      setState(() {
                 _warna=Colors.orangeAccent;
                }
  );
      _hasil = "Berat badan kurang (underweight)";
    } else if (_y >= dataList[_x][1] && _y < dataList[_x][2]) {
      setState(() {
                 _warna=Colors.green;
                }
  );
      _hasil = "Berat badan normal";
    } else {
      setState(() {
                 _warna=Colors.redAccent;
                }
  );
      _hasil = "Risiko Berat badan lebih";
    }
    }else{
      var dataList = [
      [2,2.4,3.7],
[2.7,3.2,4.8],
[3.4,3.9,5.8],
[4,4.5,6.6],
[4.4,5,7.3],
[4.8,5.4,7.8],
[5.1,5.7,8.2],
[5.3,6,8.6],
[5.6,6.3,9],
[5.8,6.5,9.3],
[5.9,6.7,9.6],
[6.1,6.9,9.9],
[6.3,7,10.1],
[6.4,7.2,10.4],
[6.6,7.4,10.6],
[6.7,7.6,10.9],
[6.9,7.7,11.1],
[7,7.9,11.4],
[7.2,8.1,11.6],
[7.3,8.2,11.8],
[7.5,8.4,12.1],
[7.6,8.6,12.3],
[7.8,8.7,12.5],
[7.9,8.9,12.8],
[8.1,9,13],
[8.2,9.2,13.3],
[8.4,9.4,13.5],
[8.5,9.5,13.7],
[8.6,9.7,14],
[8.8,9.8,14.2],
[8.9,10,14.4],
[9,10.1,14.7],
[9.1,10.3,14.9],
[9.3,10.4,15.1],
[9.4,10.5,15.4],
[9.5,10.7,15.6],
[9.6,10.8,15.8],
[9.7,10.9,16],
[9.8,11.1,16.3],
[9.9,11.2,16.5],
[10.1,11.3,16.7],
[10.2,11.5,16.9],
[10.3,11.6,17.2],
[10.4,11.7,17.4],
[10.5,11.8,17.6],
[10.6,12,17.8],
[10.7,12.1,18.1],
[10.8,12.2,18.3],
[10.9,12.3,18.5],
[11,12.4,18.8],
[11.1,12.6,19],
[11.2,12.7,19.2],
[11.3,12.8,19.4],
[11.4,12.9,19.7],
[11.5,13,19.9],
[11.6,13.2,20.1],
[11.7,13.3,20.3],
[11.8,13.4,20.6],
[11.9,13.5,20.8],
[12,13.6,21],
[12.1,13.7,21.2],
    ];
    if (_y < dataList[_x][0]) {
      setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Berat badan sangat kurang (severely underweight)";
    } else if (_y >= dataList[_x][0] && _y < dataList[_x][1]) {
      setState(() {
                 _warna=Colors.orangeAccent;
                }
  );
      _hasil = "Berat badan kurang (underweight)";
    } else if (_y >= dataList[_x][1] && _y < dataList[_x][2]) {
      setState(() {
                 _warna=Colors.green;
                }
  );
      _hasil = "Berat badan normal";
    } else {
      setState(() {
                 _warna=Colors.redAccent;
                }
  );
      _hasil = "Risiko Berat badan lebih";
    }
    }
    return _hasil;
  }

  void _prosesUBB() {
    _hasil = bbController.text;
    double _bb = double.parse(bbController.text);
    int _xx = _value.toInt();
    setState(() {
      _hasil = _rumus_umur_bb(_xx, _bb,dropdownValue);
    });
  }

  Widget form_umur_bb() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Center(
              child: Text(
            "Berat Badan menurut Umur",
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
                constraints: BoxConstraints.expand(height: 84),
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
                        labelText: 'Berat Badan/Kg',
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
                      _prosesUBB();
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
        title: Text("Berat Badan menurut Umur"),
      ),
      body:
          // Column(children: <Widget>[
          //   Padding(padding: EdgeInsets.all(16),
          //   child:menu_gizi()
          //   )

          // ],)
          SingleChildScrollView(child:
          Padding(padding: EdgeInsets.all(16),
            child:form_umur_bb()
            )),
    );
  }
}
