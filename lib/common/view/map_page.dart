import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:parking_pay_service/common/layout/app_text.dart';
import 'package:parking_pay_service/common/view/main_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class NaverMapPage extends StatefulWidget {
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
  List<NMarker> markers = [];

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _fetchParkingData();
  }

  void _fetchParkingData() async {
    var url = Uri.parse(
        'http://api.data.go.kr/openapi/tn_pubr_prkplce_info_api?serviceKey=AcXPVDNbg6ydVavYUvR1AQHlUjRrfwOw8cPeb7t4smcn0OpqZbVmrbMELc3sPye8GKlOM1wOlznC2uzpN5l/Pg==');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      _addParkingMarkers(data);
    } else {
      print('API 호출 실패: ${response.statusCode}');
    }
  }

  void _addParkingMarkers(dynamic data) {
    for (var parkingLot in data['parkingLots']) {
      NMarker parkingMarker = NMarker(
        id: parkingLot['id'],
        position: NLatLng(parkingLot['latitude'], parkingLot['longitude']),
        // infoWindow: NInfoWindow(title: parkingLot['name'], snippet: '주차 가능') // 정보창 (옵션)
      );

      setState(() {
        markers.add(parkingMarker); // 마커 리스트에 추가
      });
    }
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

  void _launchNaverMap(double lat, double lng) async {
    var naverMapUrl = Uri.parse(
        "nmap://route/car?dlat=$lat&dlng=$lng&appname=com.example.fluttermap1");
    var naverMapStoreUrl;

    if (Platform.isAndroid) {
      naverMapStoreUrl = Uri.parse(
          "https://play.google.com/store/apps/details?id=com.nhn.android.nmap");
    } else if (Platform.isIOS) {
      naverMapStoreUrl = Uri.parse("https://apps.apple.com/app/id311867728");
    }

    if (await canLaunchUrl(naverMapUrl)) {
      await launchUrl(naverMapUrl);
    } else if (naverMapStoreUrl != null &&
        await canLaunchUrl(naverMapStoreUrl)) {
      await launchUrl(naverMapStoreUrl);
    } else {
      print('네이버 지도 앱을 열 수 없습니다.');
    }
  }

  void _showMapPopup(double lat, double lng) async {
    bool? openMap = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('지도 열기'),
          content: Text('지도를 여시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: Text('아니오'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('예'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (openMap == true) {
      _launchNaverMap(lat, lng);
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
            padding: EdgeInsets.only(left: 15),
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
                leading: Icon(MdiIcons.home), // Home icon
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
        body: Stack(
          children: [
            NaverMap(
              onMapReady: (controller) {
                mapController = controller;
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
              onMapTapped: (point, latLng) {
                _showMapPopup(latLng.latitude, latLng.longitude);
              },
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
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0xFF16ACAA).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedTime,
                            icon: Icon(MdiIcons.menuDown, color: Colors.white),
                            underline: SizedBox(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedTime = newValue!;
                              });
                            },
                            style: TextStyle(color: Colors.black),
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
                          icon: Icon(MdiIcons.tune, color: Color(0xFF16ACAA)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
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
