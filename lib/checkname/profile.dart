import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<Color> colors = [Colors.yellow, Colors.red, Colors.blue, Colors.green, Colors.orange];
  List<IconData> icons = [Icons.star, Icons.heart_broken_sharp, Icons.local_fire_department, Icons.emoji_emotions, Icons.computer_sharp];

  @override
  void initState() {
    super.initState();
    randomPool();
  }
  void randomPool() async{
    while(true){
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        colors.shuffle();
        icons.shuffle();
      });
      print(colors);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: Image.asset('assets/profile.jpg').image,
                ),
                const Center(child:Text('Natthaphon Rueangwaraphit', style: TextStyle(fontSize: 20))),
                const Text('650710077', style: TextStyle(fontSize: 15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icons[0], color: colors[0], size: 50,),
                    Icon(icons[1], color: colors[1], size: 50),
                    Icon(icons[2], color: colors[2], size: 50),
                    Icon(icons[3], color: colors[3], size: 50),
                    Icon(icons[4], color: colors[4], size: 50),
                  ])]
        )
      ),
    ));
  }
}

// this is the ready_for_exam