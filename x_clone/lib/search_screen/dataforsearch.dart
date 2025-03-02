import 'package:flutter/material.dart';

class DataforSearchScreen extends StatelessWidget {
  const DataforSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String query = ModalRoute.of(context)!.settings.arguments as String;
    
    // ตัวอย่างเนื้อหาสุ่มที่เกี่ยวข้องกับหัวข้อ
    final Map<String, List<String>> relatedContent = {
      "#FlutterDev": [
        "Flutter 3.10 เปิดตัวแล้ว!",
        "เรียนรู้การใช้ Riverpod ใน Flutter",
        "Flutter กับอนาคตของ Mobile Development"
      ],
      "#TechNews": [
        "AI กำลังเปลี่ยนโลกอย่างไร?",
        "สมาร์ทโฟนรุ่นใหม่มาพร้อมชิปสุดล้ำ!",
        "เทคโนโลยี Blockchain นอกเหนือจาก Crypto"
      ],
      "#AI": [
        "ChatGPT 5.0 กำลังมา!",
        "AI จะมาแทนที่งานของเราหรือไม่?",
        "เทคนิคใหม่ในการ Train โมเดล AI"
      ],
      "#Crypto": [
        "Bitcoin ราคาพุ่งทะลุจุดสูงสุดใหม่!",
        "Ethereum อัปเกรดครั้งใหญ่!",
        "อนาคตของ Stablecoins เป็นอย่างไร?"
      ],
      "#WorldCup": [
        "ทีมชาติไหนจะคว้าแชมป์ปีนี้?",
        "5 นักเตะดาวรุ่งที่น่าจับตามอง!",
        "ผลการแข่งขันล่าสุดของ World Cup"
      ],
      "#MusicAwards": [
        "ศิลปินที่ได้รางวัลมากที่สุดปีนี้!",
        "Top 10 เพลงยอดฮิตจาก Music Awards",
        "การแสดงที่ดีที่สุดในงานประกาศรางวัล"
      ],
    };

    // สุ่มเนื้อหาที่เกี่ยวข้อง (ถ้ามีหัวข้อใน Map)
    final List<String> contents = relatedContent[query] ?? ["ไม่มีข้อมูลที่เกี่ยวข้องกับหัวข้อนี้"];
    final String randomContent = (contents..shuffle()).first;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("$query", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            randomContent,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class DataforSearchScreen extends StatelessWidget {
//   const DataforSearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final String query = ModalRoute.of(context)!.settings.arguments as String;

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(color: Colors.white), // ไอคอนเป็นสีขาว
//         title: Text("$query", style: TextStyle(color: Colors.white)),
//       ),
//       body: Center(
//         child: Text(
//           "Showing search results for: $query", 
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }