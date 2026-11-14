import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final educationList = [
      {
        'institution': 'Institut Teknologi dan Bisnis Bina Sarana Global',
        'degree': 'S1 Teknik Informatika - Konsentrasi Software Engineering',
        'period': '2024 - Sekarang (Semester 5)',
      },
      {
        'institution': 'SMK Tiara Aksara', // Silakan sesuaikan nama sekolahmu
        'degree': 'Pendidikan Menengah Kejuruan',
        'period': 'Lulus 2024',
      },
    ];

    final skillsAndHobbies = [
      {
        'icon': Icons.code,
        'title': 'Design UI/UX',
        'subtitle': 'Membuat tampilan desain untuk website di figma',
      },
      {
        'icon': Icons.storage,
        'title': 'Database ',
        'subtitle': 'MySQL, dan Git / GitHub',
      },
      {
        'icon': Icons.directions_run,
        'title': 'Hobi & Aktivitas',
        'subtitle': 'Hobi main bola dan aktivitas sekarang freelance PNS(Pegawai Negri Shopeefood)',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Header Card Singkat
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, Saya Fadhil Abi Untoro',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Mahasiswa semester 5 dengan minat kuat pada desain website atau UI/UX',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Bagian 1: Riwayat Pendidikan
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Text(
              'Riwayat Pendidikan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...educationList.map((edu) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12.0),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                leading: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  child: Icon(
                    Icons.school,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                title: Text(
                  edu['institution']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text('${edu['degree']}\n${edu['period']}'),
                ),
              ),
            );
          }),

          const SizedBox(height: 12),

          // Bagian 2: Keahlian & Hobi
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Text(
              'Keahlian & Hobi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...skillsAndHobbies.map((item) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12.0),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                leading: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    item['icon'] as IconData,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                title: Text(
                  item['title'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(item['subtitle'] as String),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}