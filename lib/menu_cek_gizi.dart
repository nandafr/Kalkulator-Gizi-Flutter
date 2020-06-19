import 'package:flutter/material.dart';
import 'dart:convert' as JSON;
void main() => runApp(MenuGizi());


class MenuGizi extends StatefulWidget {
  @override
  _MenuGiziState createState() => _MenuGiziState();
}

class _MenuGiziState extends State<MenuGizi> {
 
  Widget menu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 80),
          child: 
          Card(
             child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/umurbb');
                      },
              child: Row(
            children: <Widget>[
              Expanded(
                child:  Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset("assets/safety-harness.png", width: 40),
                ),
                flex: 1,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Berat Badan menurut Umur (BB/U)",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Anak Umur 0 - 60 Bulan",
                          style:
                              TextStyle(fontSize: 12, fontFamily: "RobotoMono"),
                        ),
                      ),
                    )
                  ],
                ),
                flex: 5,
              ),
              Expanded(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 40,
                ),
                flex: 1,
              ),
            ],
          ))),
        ),
        
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 80),
          child: Card(
            child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/umurtb');
                      },
              child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset("assets/height.png", width: 40),
                ),
                flex: 1,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Tinggi Badan menurut Umur (TB/U)",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Anak Umur 0 - 60 Bulan",
                          style:
                              TextStyle(fontSize: 12, fontFamily: "RobotoMono"),
                        ),
                      ),
                    )
                  ],
                ),
                flex: 5,
              ),
              Expanded(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 40,
                ),
                flex: 1,
              ),
            ],
          ))),
        ),
       
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 80),
          child: Card(
             child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/bbtb');
                      },
              child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Image.asset("assets/human.png", width: 40),
                ),
                flex: 1,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Berat Badan menurut Tinggi Badan (BB/TB)",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Anak Umur 0 - 24 Bulan",
                          style:
                              TextStyle(fontSize: 12, fontFamily: "RobotoMono"),
                        ),
                      ),
                    )
                  ],
                ),
                flex: 5,
              ),
              Expanded(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 40,
                ),
                flex: 1,
              ),
            ],
          ))),
        ),
        
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 80),
          child: Card(
             child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/bbtb2');
                      },
              child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Image.asset("assets/human.png", width: 40),
                ),
                flex: 1,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Berat Badan menurut Tinggi Badan (BB/TB)",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Anak Umur 24 - 60 Bulan",
                          style:
                              TextStyle(fontSize: 12, fontFamily: "RobotoMono"),
                        ),
                      ),
                    )
                  ],
                ),
                flex: 5,
              ),
              Expanded(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 40,
                ),
                flex: 1,
              ),
            ],
          ))),
        ),
        
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 80),
          child: Card(
             child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/imt');
                      },
              child: Row(
            children: <Widget>[
              Expanded(
                child:Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset("assets/homework.png", width: 40),
                ),
                flex: 1,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Index Masa Tubuh menurut Umur (IMT/U)",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Anak Umur 0- 60 Bulan",
                          style:
                              TextStyle(fontSize: 12, fontFamily: "RobotoMono"),
                        ),
                      ),
                    )
                  ],
                ),
                flex: 5,
              ),
              Expanded(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 40,
                ),
                flex: 1,
              ),
            ],
          ))),
        ),
      ],
    );
  }

  Widget header() {
    return Column(
      children: <Widget>[    
        SizedBox(
          height: 8,
        ),
        Image.asset("assets/father.png", width: 100),
         SizedBox(
          height: 8,
        ),
       Card(
 child: 
        Padding(padding: EdgeInsets.all(16),
          child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  "Rumus Perhitungan Berdasarkan Peraturan Kemenkes 2020",
                  textAlign: TextAlign.center,
                ),
              )),
        )
       ),
        
      ],
    );
  }

  Widget menu_gizi() {
    return Column(
      children: <Widget>[
        header(),
        SizedBox(
          height: 16,
        ),
        menu(),
        
      ],
    );
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Kalkulator Gizi"),
      ),
      body:
          SingleChildScrollView(child:
          Padding(padding: EdgeInsets.all(16),
            child:menu_gizi()
            )),
    );
  }
}
