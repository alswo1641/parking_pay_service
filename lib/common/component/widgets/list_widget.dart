// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:xml/xml.dart' as xml;
//
// class ListWidget extends StatelessWidget {
//   Future<List<ParkingLot>> fetchData() async {
//     var url = Uri.parse(
//         'http://api.data.go.kr/openapi/tn_pubr_prkplce_info_api?serviceKey=tKYNdIfVhMZ3d4PkGdCHBU5nHK8IvOHOl44nM%2ByFYDSRdrtD%2FHkrJHtK5bSm5%2FG2krGAkBefIHchJcnU9dRJ8Q%3D%3D&pageNo=1&numOfRows=1000&type=xml');
//     var response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       var document = xml.XmlDocument.parse(response.body);
//       var items = document.findAllElements('item');
//       return items.map((node) => ParkingLot.fromXml(node)).toList();
//     } else {
//       throw Exception('Failed to load data from API');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ParkingLot>>(
//       future: fetchData(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<ParkingLot> data = snapshot.data!;
//           return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(data[index].prkplceNm),
//                 );
//               });
//         } else if (snapshot.hasError) {
//           return Text("${snapshot.error}");
//         }
//
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }
//
// class ParkingLot {
//   String prkplceNo;
//   String prkplceNm;
//
//   ParkingLot({required this.prkplceNo, required this.prkplceNm});
//
//   factory ParkingLot.fromXml(xml.XmlElement xmlNode) {
//     return ParkingLot(
//       prkplceNo: xmlNode.findElements('prkplceNo').single.text,
//       prkplceNm: xmlNode.findElements('prkplceNm').single.text,
//     );
//   }
// }
