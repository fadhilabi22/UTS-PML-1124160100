import 'package:flutter/material.dart';
import 'package:uts_fadhilabiuntoro_1124160100/profile_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile Fadhil Abi Untoro",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ) ,
      themeMode: ThemeMode.system,
      home:ProfilePage()
    );
  }
  
}
