import 'package:kalkulator_gizi/constant.dart';
import 'package:kalkulator_gizi/imt.dart';
import 'package:kalkulator_gizi/tb_bb.dart';
import 'package:kalkulator_gizi/tb_bb2.dart';
import 'package:kalkulator_gizi/umur_bb.dart';
import 'package:kalkulator_gizi/umur_tb.dart';
import 'package:kalkulator_gizi/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Gizi',
       theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            bodyText2: TextStyle(color: kBodyTextColor),
          )),
      home: HomeScreen(),
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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;

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
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Kalkulator",
              textBottom: "Gizi Anak",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Menu", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  new GestureDetector(
                     onTap: () {
                      Navigator.pushNamed(context, '/umurbb');
                      // print("Tap");
                    },
                    child: 
                   MenuListCard(
                    text: "Usia 0-60 Bulan",
                    image: "assets/images/kids.png",
                    title: "Berat Badan menurut Umur",

                  ),
                  ),


                  new GestureDetector(
                     onTap: () {
                      Navigator.pushNamed(context, '/umurtb');
                      // print("Tap");
                    },
                    child:
                  MenuListCard(
                    text: "Usia 0-60 Bulan",
                    image: "assets/images/height.png",
                    title: "Tinggi Badan Menurut Umur",
                  ),
                  ),


                  new GestureDetector(
                     onTap: () {
                      Navigator.pushNamed(context, '/bbtb');
                      // print("Tap");
                    },
                    child:
                  MenuListCard(
                    text:
                        "Usia 0-24 Bulan",
                    image: "assets/images/weight.png",
                    title: "Berat Badan menurut Tinggi Badan",
                  ),
                  ),



                  new GestureDetector(
                     onTap: () {
                      Navigator.pushNamed(context, '/bbtb2');
                      // print("Tap");
                    },
                    child:
                  MenuListCard(
                    text: "Usia 24-60 Bulan",
                    image: "assets/images/weight.png",
                    title: "Berat Badan menurut Tinggi Badan",

                  ),
                  ),

                  new GestureDetector(
                     onTap: () {
                      Navigator.pushNamed(context, '/imt');
                      // print("Tap");
                    },
                    child:
                  MenuListCard(
                    text: "Usia 0-60 Bulan",
                    image: "assets/images/bmi.png",
                    title: "Index Masa Tubuh menurut Umur",

                  ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuListCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const MenuListCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kActiveShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}