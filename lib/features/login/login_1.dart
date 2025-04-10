import 'package:flutter/material.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> with TickerProviderStateMixin {
  TabController? _tabController;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF121212), // dark background
        body: SafeArea(
          bottom: true,
          top: false, // optional: to avoid affecting top
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const SizedBox(height: 90),
                        const Padding(
                          padding: EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Go ahead and set up your account',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 32),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Sign in-up to enjoy the best managing experience',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                            ),
                            // Your form content goes here
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                              child: Column(mainAxisSize: MainAxisSize.min, children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      height: 50,
                                      padding: const EdgeInsets.all(4), // spacing between outer and inner container
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEDEDED), // soft grey background
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: TabBar(
                                        controller: _tabController,
                                        indicator: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 6,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        labelColor: Colors.black,
                                        unselectedLabelColor: Colors.grey,
                                        labelStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                        indicatorPadding: EdgeInsets.zero,
                                        tabs: const [
                                          Tab(text: "Login"),
                                          Tab(text: "Register"),
                                        ],
                                      ),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .75,
                                  width: double.maxFinite,
                                  child: TabBarView(controller: _tabController, children: [
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          // Email field
                                          const SizedBox(height: 24),
                                          TextFormField(
                                            controller: _emailController,
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(Icons.email_outlined),
                                              labelText: 'Email Address',
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          TextFormField(
                                            controller: _passwordController,
                                            obscureText: true,
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(Icons.lock_outline),
                                              labelText: 'Password',
                                              border: OutlineInputBorder(),
                                              suffixIcon: Icon(Icons.visibility_off),
                                            ),
                                          ),
                                          const SizedBox(height: 8),

                                          // Remember me and Forgot Password
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Checkbox(
                                                    value: _rememberMe,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _rememberMe = value ?? false;
                                                      });
                                                    },
                                                  ),
                                                  const Text('Remember me'),
                                                ],
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  // Handle forgot password
                                                },
                                                child: const Text(
                                                  'Forgot Password?',
                                                  style: TextStyle(
                                                    color: Color(0xFF7AA97C),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 24),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 50,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (_formKey.currentState!.validate()) {
                                                  // Simulate an error
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(
                                                      content: Text('HandshakeException: Handshake\nCERTIFICATE_VERIFY_FAILED: unable to get local'),
                                                      backgroundColor: Colors.red,
                                                    ),
                                                  );
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(0xFF7AA97C),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(32),
                                                ),
                                              ),
                                              child: const Text(
                                                "Login",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          // Login button

                                          const SizedBox(height: 24),

                                          // Or login with divider
                                          const Row(
                                            children: [
                                              Expanded(child: Divider()),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8),
                                                child: Text('Or login with'),
                                              ),
                                              Expanded(child: Divider()),
                                            ],
                                          ),
                                          const SizedBox(height: 16),

                                          // Social login buttons
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 45,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: .4,
                                                  ),
                                                  borderRadius: BorderRadius.circular(32), // Uniform radius
                                                ),
                                                child: const Center(child: Text('Google')),
                                              ),
                                              const SizedBox(width: 16),
                                              Container(
                                                height: 45,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: .4,
                                                  ),
                                                  borderRadius: BorderRadius.circular(32), // Uniform radius
                                                ),
                                                child: const Center(child: Text('Facebook')),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text('akjsadkjask')
                                  ]),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
