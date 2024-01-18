import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MapType { KakaoMap, KakaoNavi, NaverMap, TMap }

class MapSelectPage extends StatefulWidget {
  final Function(MapType) onMapSelected;

  MapSelectPage({required this.onMapSelected});

  @override
  _MapSelectPageState createState() => _MapSelectPageState();
}

class _MapSelectPageState extends State<MapSelectPage> {
  MapType selectedMapType = MapType.NaverMap;

  @override
  void initState() {
    super.initState();
    _loadSelectedMapType();
  }

  void _loadSelectedMapType() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMapTypeIndex =
        prefs.getInt('selectedMapType') ?? MapType.NaverMap.index;
    setState(() {
      selectedMapType = MapType.values[savedMapTypeIndex];
    });
  }

  Future<void> _saveSelectedMapType(MapType mapType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedMapType', mapType.index);
  }

  void _showMapOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildMapOption(
                  MapType.KakaoMap, "카카오맵", "assets/images/kakaomap.jpg"),
              _buildMapOption(
                  MapType.KakaoNavi, "카카오네비", "assets/images/kakaonavi.jpg"),
              _buildMapOption(
                  MapType.NaverMap, "네이버지도", "assets/images/navermap.jpg"),
              _buildMapOption(MapType.TMap, "티맵", "assets/images/tmap.jpg"),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMapOption(MapType mapType, String title, String imagePath) {
    final isSelected = selectedMapType == mapType;

    return ListTile(
      title: Row(
        children: <Widget>[
          Image.asset(imagePath, width: 24, height: 30),
          const SizedBox(width: 16),
          Text(title),
        ],
      ),
      trailing: isSelected ? Icon(MdiIcons.check) : null,
      onTap: () {
        setState(() {
          selectedMapType = mapType;
        });
        _saveSelectedMapType(mapType);
        widget.onMapSelected(mapType);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(MdiIcons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("네비게이션 선택"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("네비게이션"),
            onTap: () {
              _showMapOptions(context);
            },
          ),
        ],
      ),
    );
  }
}
