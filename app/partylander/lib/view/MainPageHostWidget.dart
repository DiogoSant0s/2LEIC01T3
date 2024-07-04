import 'package:flutter/material.dart';


class MainPageHostWidget extends StatefulWidget {
  const MainPageHostWidget({super.key});

  @override
  MainPageHostWidgetState createState() => MainPageHostWidgetState();
}

class MainPageHostWidgetState extends State<MainPageHostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        height: 800,
        decoration: const BoxDecoration(
          color : Color.fromRGBO(38, 37, 37, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 60,
                  left: 127,
                  child: Container(
                      width: 99,
                      height: 31,
                      decoration: const BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(17),
                          topRight: Radius.circular(17),
                          bottomLeft: Radius.circular(17),
                          bottomRight: Radius.circular(17),
                        ),
                        color : Color.fromRGBO(61, 61, 61, 1),
                      )
                  )
              ),const Positioned(
                  top: 66,
                  left: 153,
                  child: Text('Events', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 123,
                  left: 40,
                  child: Container(
                      width: 280,
                      height: 180,
                      decoration: const BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color : Color.fromRGBO(217, 217, 217, 1),
                      )
                  )
              ),Positioned(
                  top: 14,
                  left: 314,
                  child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color : Color.fromRGBO(217, 217, 217, 1),
                        borderRadius : BorderRadius.all(Radius.elliptical(32, 32)),
                      )
                  )
              ),const Positioned(
                  top: 306,
                  left: 47,
                  child: Text('Semana do Emprego', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),const Positioned(
                  top: 322,
                  left: 47,
                  child: Text('21 Mar - 24 Mar', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),const Positioned(
                  top: 550,
                  left: 47,
                  child: Text('Semana Cultural do ISEP 2023', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),const Positioned(
                  top: 566,
                  left: 47,
                  child: Text('20 Mar - 24 Mar', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),const Positioned(
                  top: 902,
                  left: 47,
                  child: Text('Workshop - Investir através de fundos ETF', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),const Positioned(
                  top: 917,
                  left: 47,
                  child: Text('23 Fev', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),const Positioned(
                  top: 275,
                  left: 252,
                  child: Text('Manage', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(148, 148, 148, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 367,
                  left: 40,
                  child: Container(
                      width: 280,
                      height: 180,
                      decoration: const BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color : Color.fromRGBO(217, 217, 217, 1),
                      )
                  )
              ),const Positioned(
                  top: 519,
                  left: 252,
                  child: Text('Manage', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(148, 148, 148, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),const Positioned(
                  top: 879,
                  left: 252,
                  child: Text('Ver mais', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(148, 148, 148, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 18,
                  left: 11,
                  child: Image.asset(
                      'assets/calendar_icon.png',
                      scale: 4 ,
                  ),
              ),Positioned(
                  top: 19,
                  left: 48,
                  child: Image.asset(
                      'assets/search_icon.png',
                      scale: 4 ,
                  ),
              ),const Positioned(
                  top: 16,
                  left: 116,
                  child: Text('PartyLander', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 20,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 620,
                  left: 147,
                  child: Image.asset(
                      'assets/add_icon.png',
                      scale: 4 ,
                  ),
              ),
            ]
        )
    );
  }
}
