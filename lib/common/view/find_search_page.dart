import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:parking_pay_service/common/component/widgets/box_widgets.dart';
import 'package:parking_pay_service/common/layout/app_text.dart';
import 'package:parking_pay_service/common/view/main_page.dart';

class FindSearchPage extends StatefulWidget {
  @override
  _FindNearPageState createState() => _FindNearPageState();
}

class _FindNearPageState extends State<FindSearchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectedRange = 'null';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: IconButton(
            icon: Icon(MdiIcons.menu, size: 30, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        title: Row(
          children: [
            Icon(MdiIcons.telescope, size: 45, color: Colors.white),
            SizedBox(width: 5),
            Text("Find 기능 사용 중", style: AppTextTheme.white24b), // 텍스트
          ],
        ),
        backgroundColor: Color(0xFF16ACAA),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(MdiIcons.home), // 홈 아이콘
              title: Text('홈'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(MdiIcons.cog),
              title: Text('설정'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(MdiIcons.help),
              title: Text('도움말'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF16ACAA),
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
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildExtendedBottomSection(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExtendedBottomSection(BuildContext context) {
    return Container(
      height: 680,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF16ACAA), width: 5),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(MdiIcons.close, color: Color(0xFF16ACAA), size: 30),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF16ACAA), width: 1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            child: const Text(
              "인접 주차장 찾기 메시지",
              style: AppTextTheme.businessDiaryStepSelected18b,
            ),
          ),
          const SizedBox(height: 20),
          const Text("주차장을 검색하였습니다.", style: AppTextTheme.grey20b),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () => _showModalBottomSheet(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("100m 이내",
                          style: AppTextTheme.businessDiaryStepSelected30m),
                      Icon(MdiIcons.menuDown, size: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Opacity(
            opacity: 0.3,
            child: Container(
              width: double.infinity,
              height: 5,
              color: const Color(0xFF16ACAA),
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    for (var parkingLot in [
                      '주차장 1',
                      '주차장 2',
                    ]) ...[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFF16ACAA), width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text("텍스트1", textAlign: TextAlign.center),
                            ),
                            const Expanded(
                              child: Text("텍스트2", textAlign: TextAlign.center),
                            ),
                            Expanded(
                              child: BoxWidgets.infoBox(
                                  "20 / 50", Color(0xff1D9798)),
                            ),
                            Expanded(
                              child:
                                  BoxWidgets.infoBox("여유", Color(0xff187F81)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "주차장을 선택하세요.",
            style: AppTextTheme.businessDiaryStepSelected24b,
          ),
          const SizedBox(height: 30),
          const Text(
            "선택된 주차장으로 \n\n안내 받으시겠습니까?",
            style: AppTextTheme.grey20b,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF16ACAA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("안내 받기", style: AppTextTheme.white24b),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Color(0xFF16ACAA), width: 2),
                        ),
                      ),
                      child: Text("취소",
                          style: AppTextTheme.businessDiaryStepSelected24b),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: ListView(
            children:
                <String>['100m', '300m', '500m', '1km'].map((String value) {
              return ListTile(
                title: Text(value),
                onTap: () {
                  setState(() {
                    _selectedRange = value;
                    Navigator.pop(context);
                  });
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
