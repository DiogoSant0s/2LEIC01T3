import 'package:flutter/material.dart';


class MainPageSuggestedWidget extends StatefulWidget {
  const MainPageSuggestedWidget({super.key});
  @override
  MainPageSuggestedWidgetState createState() => MainPageSuggestedWidgetState();
}

class MainPageSuggestedWidgetState extends State<MainPageSuggestedWidget> {
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
                  left: 175,
                  child: Container(
                      width: 96,
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
                  top: 69,
                  left: 92,
                  child: Text('Following', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),const Positioned(
                  top: 69,
                  left: 185,
                  child: Text('Suggested', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 145,
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
                  top: 104,
                  left: 47,
                  child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color : Color.fromRGBO(217, 217, 217, 1),
                        borderRadius : BorderRadius.all(Radius.elliptical(32, 32)),
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
                  top: 111,
                  left: 89,
                  child: Text('aeicbas', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),const Positioned(
                  top: 328,
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
                  top: 344,
                  left: 47,
                  child: Text('21 Mar - 24 Mar', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 387,
                  left: 47,
                  child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color : Color.fromRGBO(217, 217, 217, 1),
                        borderRadius : BorderRadius.all(Radius.elliptical(32, 32)),
                      )
                  )
              ),const Positioned(
                  top: 394,
                  left: 89,
                  child: Text('aeisep', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),const Positioned(
                  top: 611,
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
                  top: 627,
                  left: 47,
                  child: Text('20 Mar - 24 Mar', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 677,
                  left: 47,
                  child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color : Color.fromRGBO(217, 217, 217, 1),
                        borderRadius : BorderRadius.all(Radius.elliptical(32, 32)),
                      )
                  )
              ),const Positioned(
                  top: 684,
                  left: 89,
                  child: Text('aac', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 16,
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
                  top: 297,
                  left: 252,
                  child: Text('See more', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(148, 148, 148, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 428,
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
                  top: 580,
                  left: 252,
                  child: Text('See more', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(148, 148, 148, 1),
                      fontFamily: 'Inter',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 723,
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
                      'assets/calendar_icon.svg',
                      scale: 4
                  )
              ),Positioned(
                  top: 19,
                  left: 48,
                  child: Image.asset(
                      'assets/search_icon.png',
                      scale: 4 ,
                  )
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
              ),
            ]
        )
    );
  }
}