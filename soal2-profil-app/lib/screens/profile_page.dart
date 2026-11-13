import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Profil")),
      body: const Center(child: Text("Profil akan dibuat di tahap selanjutnya")),
    );
  }
}