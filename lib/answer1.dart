import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1), // Adjust duration if needed
        behavior: SnackBarBehavior
            .floating, // Makes it appear above bottom navigation
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('โปรไฟล์ผู้ใช้'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          // margin: const EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: Image.network(
                          'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png')
                      .image,
                ),
                const SizedBox(height: 8),
                const Center(
                    child: Text('ชื่อผู้ใช้: John Doe',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                const Text('อีเมล: johndoe@example.com',
                    style: TextStyle(fontSize: 15, color: Colors.grey)),
                const SizedBox(height: 15),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.blue),
                  title:
                      const Text('การตั้งค่า', style: TextStyle(fontSize: 18)),
                  onTap: () {
                    _showSnackBar(context, 'การตั้งค่า');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.lock, color: Colors.blue),
                  title: const Text('เปลี่ยนรหัสผ่าน',
                      style: TextStyle(fontSize: 18)),
                  onTap: () {
                    _showSnackBar(context, 'เปลี่ยนรหัสผ่าน');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip,
                      color: Colors.blue), // ผมหา icon นี้ไม่เจอครับ
                  title: const Text('ความเป็นส่วนตัว',
                      style: TextStyle(fontSize: 18)),
                  onTap: () {
                    _showSnackBar(context, 'ความเป็นส่วนตัว');
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: () {
                        _showSnackBar(context, "แก้ไขโปรไฟล์");
                      },
                      child: const Text("แก้ไขโปรไฟล์")),
                ),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          _showSnackBar(context, "ออกจากระบบ");
                        },
                        child: const Text("ออกจากระบบ"))),
              ]),
        ));
  }
}
