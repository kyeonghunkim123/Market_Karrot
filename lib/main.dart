import 'package:clone_marketkarrot/splash_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //퓨처 함수로 로딩구현
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 900), //페이드인아웃 효과
            child: _splashLodingWidget(snapshot), //스냅샷실행 위젯지정
          );
        });
  }
  //스플래쉬로딩위젯 선언(인스턴스)
  StatelessWidget _splashLodingWidget(AsyncSnapshot<Object> snapshot) {
    if(snapshot.hasError) {print('에러가 발생하였습니다.');return Text('Error');}
    else if(snapshot.hasData) {return HomeScreen();} //정상
    else{return SplashScreen();} //그외
  }
}
