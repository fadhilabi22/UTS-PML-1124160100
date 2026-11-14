import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatelessWidget {
  final Profile profile;
  const EditProfilePage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: const Center(child: Text('Halaman Edit Profil akan dibuat selanjutnya')),
    );
  }
}