import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Mahasiswa"),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.center),
                ProfileAvatar(),
                Text(
                  "Fadhil Abi Untoro",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 20),
                Text(
                  "1124160100",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 18),
                Text("Teknik Informatika"),
                SizedBox(height: 16),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsetsGeometry.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        const InfoTile(
                          ikon: Icons.email,
                          label: "Email",
                          value: "fadhilabie4567@gmail.com",
                        ),
                        const SizedBox(height: 30),
                        const InfoTile(
                          ikon: Icons.call,
                          label: "Hp",
                          value: "085792240379",
                        ),
                        const SizedBox(height: 28),
                        const InfoTile(
                          ikon: Icons.code,
                          label: "Github",
                          value: "fadhilabi22",
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      const InfoTile(
                        ikon: Icons.sports,
                        label: "Hobi",
                        value: "bermain bola",
                      ),
                      const SizedBox(height: 28),
                      const InfoTile(
                        ikon: Icons.gamepad,
                        label: "Game",
                        value: "bermain game",
                      ),
                      const SizedBox(height: 26),
                      const InfoTile(
                        ikon: Icons.run_circle,
                        label: "Running",
                        value: "Lari",
                      ),
                    ],
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Terimkasih telah melihat profile saya"))
                    );
                  },
                  child: Icon(
                    Icons.thumb_up
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey,
      child: Icon(Icons.person),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.ikon,
    required this.label,
    required this.value,
  });
  final IconData ikon;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(ikon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
