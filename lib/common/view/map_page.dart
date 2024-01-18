import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:parking_pay_service/common/component/widgets/list_widget.dart';
import 'package:parking_pay_service/common/layout/app_text.dart';
import 'package:parking_pay_service/common/model/parking_model.dart';
import 'package:parking_pay_service/common/view/main_page.dart';
import 'package:parking_pay_service/common/view/map_select_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class NaverMapPage extends StatefulWidget {
  final MapType selectedMapType;

  NaverMapPage({required this.selectedMapType});

  @override
  _NaverMapPageState createState() => _NaverMapPageState();
}

class _NaverMapPageState extends State<NaverMapPage> {
  String _selectedTime = '1시간';
  final List<String> _timeOptions = ['1시간', '2시간', '3시간', '4시간'];
  final double latitude = 37.5666102;
  final double longitude = 126.9783881;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double? currentLatitude;
  double? currentLongitude;
  NaverMapController? mapController;
  List<NMarker> _markers = [];
  MapType? _selectedMapType;
  @override
  void initState() {
    super.initState();
    _determinePosition();
    _fetchParkingData();
    _selectedMapType = widget.selectedMapType;
  }

  void _fetchParkingData() async {
    var url = Uri.parse(
        'http://api.data.go.kr/openapi/tn_pubr_prkplce_info_api?serviceKey=tKYNdIfVhMZ3d4PkGdCHBU5nHK8IvOHOl44nM%2ByFYDSRdrtD%2FHkrJHtK5bSm5%2FG2krGAkBefIHchJcnU9dRJ8Q%3D%3D&pageNo=1&numOfRows=1000&type=xml');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = _convertXmlToJson(response.body);
      _addParkingMarkers(jsonData!);
    } else {
      print('API 호출 실패: ${response.statusCode}');
    }
  }

  List<ParkingLot>? _convertXmlToJson(String xmlString) {
    var document = xml.XmlDocument.parse(xmlString);
    var items = document.findAllElements('item');
    return items.map((node) {
      return ParkingLot(
        prkplceNo: node.findElements('prkplceNo').single.text,
        prkplceNm: node.findElements('prkplceNm').single.text,
        latitude: double.tryParse(node.findElements('latitude').single.text),
        longitude: double.tryParse(node.findElements('longitude').single.text),
        parkingchrgeInfo: node.findElements('parkingchrgeInfo').single.text,
        prkcmprt: int.tryParse(node.findElements('prkcmprt').single.text),
        basicTime: int.tryParse(node.findElements('basicTime').single.text),
        basicCharge: int.tryParse(node.findElements('basicCharge').single.text),
        dayCmmtkt: int.tryParse(node.findElements('dayCmmtkt').single.text),
        phoneNumber: node.findElements('phoneNumber').single.text,
        weekdayOperOpenHhmm:
            node.findElements('weekdayOperOpenHhmm').single.text,
        weekdayOperColseHhmm:
            node.findElements('weekdayOperColseHhmm').single.text,
      );
    }).toList();
  }

  void _addParkingMarkers(List<ParkingLot> data) {
    for (var parkingLot in data) {
      if (parkingLot.latitude == null || parkingLot.longitude == null) {
        continue;
      }

      var marker = NMarker(
        id: parkingLot.prkplceNo,
        position: NLatLng(parkingLot.latitude!, parkingLot.longitude!),
        caption: NOverlayCaption(
          text: parkingLot.prkplceNm,
          color: Colors.blue,
        ),
      );

      mapController?.addOverlay(marker);

      marker.setOnTapListener((_) {
        _showParkingDetails(parkingLot);
      });
    }
  }

  void _showMapPopup(double lat, double lng) async {
    bool? openMap = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('지도 열기'),
          content: const Text('지도를 여시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: const Text('아니오'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('예'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
    if (openMap == true) {
      _launchMap(
          lat, lng, _selectedMapType); // Pass _selectedMapType as an argument
    }
  }

  void _showParkingDetails(ParkingLot parkingLot) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
            border: Border(
              top: BorderSide(width: 5, color: Color(0xFF16ACAA)),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              Center(
                child: Text(
                    parkingLot.dayCmmtkt != null && parkingLot.dayCmmtkt! > 0
                        ? '당일 주차권 구매 이용 가능 주차장입니다.'
                        : '당일 주차권 구매 이용 불가능 주차장입니다.',
                    style: AppTextTheme.businessDiaryStepSelected18b),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 130,
                    height: 100,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(parkingLot.prkplceNm,
                            style: AppTextTheme.black16b),
                        const Divider(),
                        Text(
                          '주차요금  ${parkingLot.basicTime ?? '정보없음'} 분 ${parkingLot.basicCharge ?? '정보없음'} 원',
                          style: AppTextTheme.black16m,
                        ),
                        const Divider(),
                        Text(
                          '운영시간  ${parkingLot.weekdayOperOpenHhmm ?? '정보없음'} ~ ${parkingLot.weekdayOperColseHhmm ?? '정보없음'}',
                          style: AppTextTheme.black16m,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC4F0EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("카드결제",
                        style: AppTextTheme.businessDiaryStepSelected15m),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC4F0EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("주차권 결제",
                        style: AppTextTheme.businessDiaryStepSelected15m),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC4F0EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("현금 결제",
                        style: AppTextTheme.businessDiaryStepSelected15m),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  customButton("네비게이션", () {
                    _showMapPopup(parkingLot.latitude!, parkingLot.longitude!);
                  }),
                  customButton("전화 연결", () {
                    launchUrl(Uri.parse("tel:${parkingLot.phoneNumber}"));
                  }),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  customButton("주차요금 결제", () {}),
                  customButton("예약하기", () {}),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;
    });

    print("현재 위치: 위도 $currentLatitude, 경도 $currentLongitude");
  }

  bool _isNightTime() {
    var now = DateTime.now();
    return now.hour >= 18 || now.hour < 6;
  }

  void _launchMap(double lat, double lng, MapType? mapType) async {
    final MapType effectiveMapType = _selectedMapType ?? MapType.NaverMap;
    String url;

    switch (effectiveMapType) {
      case MapType.KakaoMap:
        url =
            'kakaomap://route?sp=$currentLatitude,$currentLongitude&ep=$lat,$lng&by=CAR';
        break;
      case MapType.KakaoNavi:
        url =
            'kakaonavi://route?sp=$currentLatitude,$currentLongitude&ep=$lat,$lng&by=CAR';
        break;
      case MapType.NaverMap:
        url =
            'nmap://route/car?slat=$currentLatitude&slng=$currentLongitude&dlat=$lat&dlng=$lng&appname=com.example.fluttermap1';
        break;
      case MapType.TMap:
        url =
            'tmap://route?startX=$currentLongitude&startY=$currentLatitude&endX=$lng&endY=$lat&appname=com.example.fluttermap1';
        break;
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      String appStoreUrl = '';
      switch (effectiveMapType) {
        case MapType.KakaoMap:
          appStoreUrl = Platform.isAndroid
              ? "https://play.google.com/store/apps/details?id=net.daum.android.map"
              : "https://apps.apple.com/app/id304608425";
          break;
        case MapType.KakaoNavi:
          appStoreUrl = Platform.isAndroid
              ? "https://play.google.com/store/apps/details?id=com.locnall.KimGiSa"
              : "https://apps.apple.com/app/id417698849";
          break;
        case MapType.NaverMap:
          appStoreUrl = Platform.isAndroid
              ? "https://play.google.com/store/apps/details?id=com.nhn.android.nmap"
              : "https://apps.apple.com/app/id311867728";
          break;
        case MapType.TMap:
          appStoreUrl = Platform.isAndroid
              ? "https://play.google.com/store/apps/details?id=com.skt.tmap.ku"
              : "https://apps.apple.com/app/id431589174";
          break;
      }

      if (appStoreUrl.isNotEmpty && await canLaunch(appStoreUrl)) {
        await launch(appStoreUrl);
      } else {
        print('Could not launch $url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool nightMode = _isNightTime();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
              icon: Icon(MdiIcons.menu, size: 30, color: Colors.white),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
          title: const Row(
            children: [
              Text("목적지를 입력하세요.", style: AppTextTheme.white24m),
            ],
          ),
          backgroundColor: Color(0xFF16ACAA),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(MdiIcons.home),
                title: const Text('홈'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(MdiIcons.cog),
                title: const Text('설정'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(MdiIcons.help),
                title: const Text('도움말'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            NaverMap(
              onMapReady: (controller) {
                mapController = controller;
                _fetchParkingData();

                mapController?.addOverlayAll(_markers.toSet());
                if (currentLatitude != null && currentLongitude != null) {
                  controller.updateCamera(
                    NCameraUpdate.fromCameraPosition(
                      NCameraPosition(
                        target: NLatLng(currentLatitude!, currentLongitude!),
                        zoom: 12,
                      ),
                    ),
                  );
                }
              },
              options: NaverMapViewOptions(
                locationButtonEnable: true,
                indoorEnable: true,
                initialCameraPosition: NCameraPosition(
                  target: NLatLng(currentLatitude ?? 37.5666102,
                      currentLongitude ?? 126.9783881),
                  zoom: 12,
                  bearing: 0,
                  tilt: 0,
                ),
                mapType: NMapType.navi,
                nightModeEnable: nightMode,
                activeLayerGroups: [
                  NLayerGroup.transit,
                ],
              ),
              onMapTapped: (point, latLng) {},
              onSymbolTapped: (symbol) {
                _showMapPopup(
                    symbol.position.latitude, symbol.position.longitude);
              },
              onCameraIdle: () {
                print("카메라 이동 종료");
              },
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF16ACAA).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedTime,
                            icon: Icon(MdiIcons.menuDown, color: Colors.white),
                            underline: const SizedBox(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedTime = newValue!;
                              });
                            },
                            style: const TextStyle(color: Colors.black),
                            items: _timeOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child:
                                    Text(value, style: AppTextTheme.white16m),
                              );
                            }).toList(),
                          ),
                        ),
                        IconButton(
                          icon: Icon(MdiIcons.tune,
                              color: const Color(0xFF16ACAA)),
                          onPressed: () async {
                            final selectedMap =
                                await Navigator.of(context).push<MapType>(
                              MaterialPageRoute(
                                builder: (context) => MapSelectPage(
                                  onMapSelected: (selectedMap) {
                                    setState(() {
                                      _selectedMapType = selectedMap;
                                    });
                                  },
                                ),
                              ),
                            );
                            if (selectedMap != null) {
                              setState(() {
                                _selectedMapType = selectedMap; // 선택된 지도 타입 저장
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black26,
                            ),
                            child: const Text('목록',
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black26,
                            ),
                            child: const Text('제보',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget customButton(String text, Function() onPressed) {
  return SizedBox(
    width: 170,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Color(0xFF16ACAA)),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 20,
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Color(0xFF16ACAA)),
      ),
    ),
  );
}
