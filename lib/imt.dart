import 'package:flutter/material.dart';
import 'package:kalkulator_gizi/widgets/back_header.dart';
import 'package:kalkulator_gizi/constant.dart';


String dropdownValue;
double _value = 0.0;
int _valueSlide=0;
final bbController = TextEditingController();
final tbController = TextEditingController();

class Imt extends StatefulWidget {
  @override
  _ImtState createState() => _ImtState();
}

class _ImtState extends State<Imt> {
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
      _hasil = "Gizi buruk"
      "\n"
      "(severely wasted)"
      "\n";
    } else if (imt >= dataList[_valueSlide][0] && imt < dataList[_valueSlide][1]) {
      setState(() {
                 _warna=Colors.orangeAccent;
                }
  );
      _hasil = "Gizi kurang"
      "\n"
      "(wasted)"
      "\n";
    } else if (imt >= dataList[_valueSlide][1] && imt < dataList[_valueSlide][2]) {
      _hasil = "Gizi baik"
      "\n"
      "(normal)"
      "\n";
      setState(() {
                 _warna=Colors.green;
                }
  );
    }else if (imt >= dataList[_valueSlide][2] && imt < dataList[_valueSlide][3]) {
      _hasil = "Berisiko gizi lebih"
      "\n"
      "(possible risk of overweight)"
      "\n";
      setState(() {
                 _warna=Colors.orange;
                }
  );
    }else if (imt >= dataList[_valueSlide][3] && imt < dataList[_valueSlide][4]) {
      _hasil = "Gizi lebih"
      "\n"
      "(overweight)"
      "\n";
      setState(() {
                 _warna=Colors.redAccent;
                }
  );
    } else {
      _hasil = "Obesitas"
      "\n"
      "(obese)"
      "\n";
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
      _hasil = "Gizi buruk"
      "\n"
      "(severely wasted)"
      "\n";
    } else if (imt >= dataList[_valueSlide][0] && imt < dataList[_valueSlide][1]) {
      setState(() {
                 _warna=Colors.orangeAccent;
                }
  );
      _hasil = "Gizi kurang"
      "\n"
      "(wasted)"
      "\n";
    } else if (imt >= dataList[_valueSlide][1] && imt < dataList[_valueSlide][2]) {
      _hasil = "Gizi baik"
      "\n"
      "(normal)"
      "\n";
      setState(() {
                 _warna=Colors.green;
                }
  );
    }else if (imt >= dataList[_valueSlide][2] && imt < dataList[_valueSlide][3]) {
      _hasil = "Berisiko gizi lebih"
      "\n"
      "(possible risk of overweight)"
      "\n";
      setState(() {
                 _warna=Colors.orange;
                }
  );
    }else if (imt >= dataList[_valueSlide][3] && imt < dataList[_valueSlide][4]) {
      _hasil = "Gizi lebih"
      "\n"
      "(overweight)";
      setState(() {
                 _warna=Colors.redAccent;
                }
  );
    } else {
      _hasil = "Obesitas"
      "\n"
      "(obese)"
      "\n";
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
     _showModalBottomSheet(context);
  }
  Widget form_imt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Center(
              child: Text(
            "Untuk Usia 0-60 Bulan",
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
                constraints: BoxConstraints.expand(height: 87),
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
                            activeTrackColor: kPrimaryColor,
                            inactiveTrackColor: kInActiveColor,
                            trackShape: RoundedRectSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            thumbColor: kPrimaryColor,
                            overlayColor: kPrimaryColor,
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 28.0),
                            tickMarkShape: RoundSliderTickMarkShape(),
                            activeTickMarkColor: kPrimaryColor,
                            inactiveTickMarkColor: kInActiveColor,
                            valueIndicatorShape:
                                PaddleSliderValueIndicatorShape(),
                            valueIndicatorColor: kPrimaryColor,
                            valueIndicatorTextStyle: TextStyle(
                              color: kBackgroundColor,
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
                  color: kPrimaryColor,
                  child: MaterialButton(
                    onPressed: () {
                      _prosesIMT();
                    },
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    // onPressed: state is! RegisLoading ? _onRegisButtonPressed : null,
                    child: Text(
                      'Cek Status Gizi Anak',
                      style: kBtnStyle,
                    ),
                  )),
            ),
            Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: Text(
              ""
            )
            ,
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
              textTop: "Index Masa",
              textBottom: "Tubuh",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
            
                  form_imt(),
                ],
              ),
            )
          ],
        ),
      ),
    );
    
  }
}

 