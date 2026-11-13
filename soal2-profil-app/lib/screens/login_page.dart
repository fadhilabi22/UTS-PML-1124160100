import 'package:flutter/material.dart';
import 'profile_page.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  
 
  bool _isLoading = false;

  
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nimController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  
  Future<void> _login() async {
    
    if (_formKey.currentState!.validate()) {
      
      setState(() {
        _isLoading = true;
      });

     
      await Future.delayed(const Duration(seconds: 2));

      
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Aplikasi'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.lock_person,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Silakan Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                
                // TextFormField untuk NIM dengan Validator
                TextFormField(
                  controller: _nimController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'NIM',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIM tidak boleh kosong';
                    }
                    if (value.length < 5) {
                      return 'NIM minimal 5 digit';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // TextFormField untuk Password dengan Validator
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                
                // Tombol Login
                ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  // Menampilkan indikator loading atau teks berdasarkan state
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 16),
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