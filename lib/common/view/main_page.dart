import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:parking_pay_service/common/component/widgets/loading_widget.dart';
import 'package:parking_pay_service/common/layout/app_text.dart';
import 'package:parking_pay_service/common/view/find_near_page.dart';
import 'package:parking_pay_service/common/view/map_page.dart';
import 'package:parking_pay_service/common/view/map_select_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF149D9B),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 0.5],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                // 아래로 이동
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(18),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  LoadingScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) =>
                                NaverMapPage(selectedMapType: MapType.NaverMap),
                            settings:
                                RouteSettings(arguments: Color(0xFF149D9B)),
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Color(0xFF149D9B),
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black45,
                              blurRadius: 8,
                              offset: Offset(0, 4)),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(MdiIcons.car, size: 60.0, color: Colors.white),
                            const SizedBox(height: 10),
                            const Text("주차정보안내", style: AppTextTheme.white30b),
                            const Text("주차장 검색 및 안내 서비스",
                                style: AppTextTheme.white14b),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                // 위로 이동
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(18),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  LoadingScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => FindNearPage(),
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF16ACAA), width: 3),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black45,
                              blurRadius: 8,
                              offset: Offset(0, -4)),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(MdiIcons.telescope,
                                size: 60.0, color: const Color(0xFF16ACAA)),
                            const SizedBox(height: 20),
                            const Text("Find 기능",
                                style:
                                    AppTextTheme.businessDiaryStepSelected30b),
                            const SizedBox(height: 5),
                            const Text("인접 주차장 찾기 서비스",
                                style:
                                    AppTextTheme.businessDiaryStepSelected18b),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
