import 'package:flutter/material.dart';
import '../main.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'about_page.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 
  late Profile _profile;

  @override
  void initState() {
    super.initState();
    _profile = Profile(
      nama: 'Fadhil Abi Untoro',
      nim: '1124160100',
      prodi: 'Teknik Informatika',
      kelas: 'Semester 5',
      bio: 'Mahasiswa Software Engineering di Institut Teknologi dan Bisnis Bina Sarana Global.',
      email: 'fadhilabiuntoro@gmail.com', 
      hp: '085782240359',             
      github: 'github.com/fadhilabi22',
    );
  }

 
  Future<void> _navigateToEdit() async {
    final updatedProfile = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: _profile),
      ),
    );

    if (updatedProfile != null) {
      setState(() {
        _profile = updatedProfile;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil berhasil diperbarui!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            tooltip: isDarkMode ? 'Mode Terang' : 'Mode Gelap',
            onPressed: () {
              MyApp.updateThemeMode(
                context,
                isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
            const SizedBox(height: 16),

            
            Text(
              _profile.nama,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '${_profile.nim} • ${_profile.prodi} (${_profile.kelas})',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 12),

            
            Text(
              _profile.bio,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 24),

            
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  InfoTile(
                    icon: Icons.email,
                    title: 'Email',
                    subtitle: _profile.email,
                  ),
                  const Divider(height: 1),
                  InfoTile(
                    icon: Icons.phone,
                    title: 'Nomor HP',
                    subtitle: _profile.hp,
                  ),
                  const Divider(height: 1),
                  InfoTile(
                    icon: Icons.code,
                    title: 'GitHub',
                    subtitle: _profile.github,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Navigasi ke Halaman Tentang Saya
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
              icon: const Icon(Icons.info_outline),
              label: const Text('Tentang Saya'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
      // FloatingActionButton untuk Edit Profil
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToEdit,
        icon: const Icon(Icons.edit),
        label: const Text('Edit Profil'),
      ),
    );
  }
}