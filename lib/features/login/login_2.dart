import 'package:flutter/material.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  bool _isLogin = true;
  bool _useEmail = true;
  final _phoneController = TextEditingController(text: '+44-000-000-000');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with toggle between create account/login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => setState(() => _isLogin = false),
                  style: TextButton.styleFrom(
                    foregroundColor: !_isLogin ? Colors.blue : Colors.grey,
                  ),
                  child: const Text('Create an account'),
                ),
                const Text(' | '),
                TextButton(
                  onPressed: () => setState(() => _isLogin = true),
                  style: TextButton.styleFrom(
                    foregroundColor: _isLogin ? Colors.blue : Colors.grey,
                  ),
                  child: const Text('Login'),
                ),
              ],
            ),
            const SizedBox(height: 32),

            if (!_isLogin) ...[
              // Create account content
              const Text(
                'Welcome to Leafboard!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
            ],

            // Phone/Email toggle
            Row(
              children: [
                ChoiceChip(
                  label: const Text('Phone Number'),
                  selected: !_useEmail,
                  onSelected: (selected) {
                    setState(() => _useEmail = !selected);
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Email'),
                  selected: _useEmail,
                  onSelected: (selected) {
                    setState(() => _useEmail = selected);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Phone/Email input field
            TextField(
              controller: _useEmail ? _emailController : _phoneController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: _useEmail ? 'Enter your email' : 'Enter phone number',
              ),
              keyboardType: _useEmail ? TextInputType.emailAddress : TextInputType.phone,
            ),
            const SizedBox(height: 16),

            // Password field (only for login)
            if (_isLogin) ...[
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 24),
            ],

            // Login/Create Account button
            ElevatedButton(
              onPressed: () {
                // Handle authentication
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(_isLogin ? 'Log in' : 'Continue'),
            ),
            const SizedBox(height: 24),

            // Divider with "or continue with"
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('or continue with'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),

            // Social login buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
                    height: 24,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg',
                    height: 24,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Toggle between login/create account at bottom
            TextButton(
              onPressed: () => setState(() => _isLogin = !_isLogin),
              child: Text(
                _isLogin ? 'New to Leafboard? Create Account' : 'Already have an account? Login',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
