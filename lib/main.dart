import 'package:flutter/material.dart';
import 'package:cek_gizi/menu_cek_gizi.dart';
import 'package:cek_gizi/umur_bb.dart';
import 'package:cek_gizi/umur_tb.dart';
import 'package:cek_gizi/tb_bb.dart';
import 'package:cek_gizi/tb_bb2.dart';
import 'package:cek_gizi/imt.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: MenuGizi(),
       routes: {
        '/umurbb':(context)=> UmurBB(),
        '/umurtb':(context)=> UmurTB(),
        '/bbtb':(context)=> BbTb(),
        '/bbtb2':(context)=> BbTb2(),
        '/imt':(context)=> Imt(),
          }
    );
  
  }
}