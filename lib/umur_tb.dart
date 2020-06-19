import 'package:flutter/material.dart';
import 'dart:convert' as JSON;
void main() => runApp(UmurTB());
String dropdownValue;
double _value = 0.0;
int _valueSlide=0;
final bbController = TextEditingController();
final tbController = TextEditingController();



class UmurTB extends StatefulWidget {
  UmurTB({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UmurTBState createState() => _UmurTBState();
}

class _UmurTBState extends State<UmurTB> {
  String _hasil = "";
  var _warna;
  
  _rumus_umur_tb(int _x, double _y,String jk) {
    if(jk=="Laki-laki"){
      var dataList = [
        [44.2,46.1,55.6],
[48.9,50.8,60.6],
[52.4,54.4,64.4],
[55.3,57.3,67.6],
[57.6,59.7,70.1],
[59.6,61.7,72.2],
[61.2,63.3,74],
[62.7,64.8,75.7],
[64,66.2,77.2],
[65.2,67.5,78.7],
[66.4,68.7,80.1],
[67.6,69.9,81.5],
[68.6,71,82.9],
[69.6,72.1,84.2],
[70.6,73.1,85.5],
[71.6,74.1,86.7],
[72.5,75,88],
[73.3,76,89.2],
[74.2,76.9,90.4],
[75,77.7,91.5],
[75.8,78.6,92.6],
[76.5,79.4,93.8],
[77.2,80.2,94.9],
[78,81,95.9],
[78.7,81.7,97],
[78.6,81.7,97.3],
[79.3,82.5,98.3],
[79.9,83.1,99.3],
[80.5,83.8,100.3],
[81.1,84.5,101.2],
[81.7,85.1,102.1],
[82.3,85.7,103],
[82.8,86.4,103.9],
[83.4,86.9,104.8],
[83.9,87.5,105.6],
[84.4,88.1,106.4],
[85,88.7,107.2],
[85.5,89.2,108],
[86,89.8,108.8],
[86.5,90.3,109.5],
[87,90.9,110.3],
[87.5,91.4,111],
[88,91.9,111.7],
[88.4,92.4,112.5],
[88.9,93,113.2],
[89.4,93.5,113.9],
[89.8,94,114.6],
[90.3,94.4,115.2],
[90.7,94.9,115.9],
[91.2,95.4,116.6],
[91.6,95.9,117.3],
[92.1,96.4,117.9],
[92.5,96.9,118.6],
[93,97.4,119.2],
[93.4,97.8,119.9],
[93.9,98.3,20.1],
[94.3,98.8,20.3],
[94.7,99.3,20.6],
[95.2,99.7,20.8],
[95.6,100.2,21],
[96.1,100.7,21.2]
      ];
    if (_y < dataList[_x][0]) {
      setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Sangat pendek (severely stunted)";
    } else if (_y >= dataList[_x][0] && _y < dataList[_x][1]) {
      setState(() {
                 _warna=Colors.orange;
                }
  );
      _hasil = "Pendek (stunted)";
    } else if (_y >= dataList[_x][1] && _y < dataList[_x][2]) {
      setState(() {
                 _warna=Colors.green;
                }
  );
      _hasil = "Normal";
    } else {
      setState(() {
                 _warna=Colors.redAccent;
                }
  );
      _hasil = "Tinggi";
    }
    }else{
      var dataList = [
        [43.6,45.4,54.7],
[47.8,49.8,59.5],
[51,53,63.2],
[53.5,55.6,66.1],
[55.6,57.8,68.6],
[57.4,59.6,70.7],
[58.9,61.2,72.5],
[60.3,62.7,74.2],
[61.7,64,75.8],
[62.9,65.3,77.4],
[64.1,66.5,78.9],
[65.2,67.7,80.3],
[66.3,68.9,81.7],
[67.3,70,83.1],
[68.3,71,84.4],
[69.3,72,85.7],
[70.2,73,87],
[71.1,74,88.2],
[72,74.9,89.4],
[72.8,75.8,90.6],
[73.7,76.7,91.7],
[74.5,77.5,92.9],
[75.2,78.4,94],
[76,79.2,95],
[76.7,80,96.1],
[76.8,80,96.4],
[77.5,80.8,97.4],
[78.1,81.5,98.4],
[78.8,82.2,99.4],
[79.5,82.9,100.3],
[80.1,83.6,101.3],
[80.7,84.3,102.2],
[81.3,84.9,103.1],
[81.9,85.6,103.9],
[82.5,86.2,104.8],
[83.1,86.8,105.6],
[83.6,87.4,106.5],
[84.2,88,107.3],
[84.7,88.6,108.1],
[85.3,89.2,108.9],
[85.8,89.8,109.7],
[86.3,90.4,110.5],
[86.8,90.9,111.2],
[87.4,91.5,112],
[87.9,92,112.7],
[88.4,92.5,113.5],
[88.9,93.1,114.2],
[89.3,93.6,114.9],
[89.8,94.1,115.7],
[90.3,94.6,116.4],
[90.7,95.1,117.1],
[91.2,95.6,117.7],
[91.7,96.1,118.4],
[92.1,96.6,119.1],
[92.6,97.1,119.8],
[93,97.6,120.4],
[93.4,98.1,121.1],
[93.9,98.5,121.8],
[94.3,99,122.4],
[94.7,99.5,123.1],
[95.2,99.9,123.7]
      ];
   if (_y < dataList[_x][0]) {
      setState(() {
                 _warna=Colors.red;
                }
  );
      _hasil = "Sangat pendek (severely stunted)";
    } else if (_y >= dataList[_x][0] && _y < dataList[_x][1]) {
      setState(() {
                 _warna=Colors.orange;
                }
  );
      _hasil = "Pendek (stunted)";
    } else if (_y >= dataList[_x][1] && _y < dataList[_x][2]) {
      setState(() {
                 _warna=Colors.green;
                }
  );
      _hasil = "Normal";
    } else {
      setState(() {
                 _warna=Colors.redAccent;
                }
  );
      _hasil = "Tinggi";
    }
    }
    return _hasil;
  }
 
  void _prosesUTB() {
    _hasil = bbController.text;
    double _bb = double.parse(bbController.text);
    int _xx = _value.toInt();
    setState(() {
      _hasil = _rumus_umur_tb(_xx, _bb,dropdownValue);
    });
  }
  
 
  Widget form_umur_tinggi() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Center(
              child: Text(
            "Tinggi Badan menurut Umur",
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
                      _prosesUTB();
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
        title: Text("Tinggi Badan menurut Umur"),
      ),
      body:
          SingleChildScrollView(child:
          Padding(padding: EdgeInsets.all(16),
            child:form_umur_tinggi()
            )),
    );
  }
}
