import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final screenHeight = constraints.maxHeight;
              final screenWidth = constraints.maxWidth;

              // Responsive calculations
              final isTablet = screenWidth > 600;
              final logoSize = isTablet ? 100.0 : 100.0;
              final horizontalPadding = isTablet ? 60.0 : 24.0;
              final inputFieldHeight = isTablet ? 60.0 : 50.0;
              final buttonHeight = isTablet ? 60.0 : 50.0;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Top spacing
                    SizedBox(height: screenHeight * 0.05),

                    // Logo Section
                    Center(child: _LogoSection(size: logoSize)),

                    SizedBox(height: screenHeight * 0.02),

                    // Sign Up text outside the card
                    Text(
                      'আপনার একাউন্টে প্রবেশ করুন',
                      style: TextStyle(
                        fontSize: isTablet ? 28 : 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    // White Card Container
                    Container(
                      //height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Center(
                                child: Text(
                                  'লগইন',
                                  style: TextStyle(
                                    fontSize: isTablet ? 32 : 30,
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.02),

                              // Email Field
                              _buildInputField(
                                height: inputFieldHeight,
                                hintText: 'Phone Number',
                                prefixIcon: Icons.call,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!value.contains('@') ||
                                      !value.contains('.')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 16),

                              // Password Field
                              _buildInputField(
                                height: inputFieldHeight,
                                hintText: 'Password',
                                prefixIcon: Icons.lock_outline,
                                obscureText: !_isPasswordVisible,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                'পাসওয়ার্ড ভুলে গিয়েছেন?',
                                textAlign: TextAlign.end,
                                style: TextStyle(color: Colors.amber),
                              ),

                              SizedBox(height: screenHeight * 0.02),

                              // Sign Up Button
                              _SignUpButton(
                                height: buttonHeight,
                                width: screenWidth * 2 / 3,
                              ),

                              SizedBox(height: 20),

                              // Already have account text
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'একাউন্ট নেই? ',
                                    style: TextStyle(
                                      fontSize: isTablet ? 16 : 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/sign-up',
                                      );
                                    },
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: isTablet ? 16 : 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              registerButton(
                                height: buttonHeight,
                                width: screenWidth * 2 / 3,
                              ),

                              SizedBox(height: screenHeight * 0.28),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required double height,
    required String hintText,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return SizedBox(
      height: height,
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black45, fontSize: 16),
          prefixIcon: Icon(prefixIcon, color: Colors.black54),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Color(0xFFE8F5E9), // Light mint green color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height / 2),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height / 2),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height / 2),
            borderSide: BorderSide(color: AppTheme.primaryColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height / 2),
            borderSide: BorderSide(color: Colors.red.shade300, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height / 2),
            borderSide: BorderSide(color: Colors.red, width: 1.5),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        validator: validator,
      ),
    );
  }
}

class _LogoSection extends StatelessWidget {
  final double size;

  const _LogoSection({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.red, Colors.amber],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          child: ClipOval(
            child: Image.asset(
              'assets/images/logo.png',
              width: size * 0.7,
              height: size * 0.7,
              color: Color(0xFFFED700),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  final double height;
  final double width;

  const _SignUpButton({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Navigate to sign up screen
          Navigator.pushNamed(context, '/dashboard');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height / 2),
          ),
          padding: EdgeInsets.zero,
        ),
        child: const Text(
          'লগইন করুন',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}

class registerButton extends StatelessWidget {
  final double height;
  final double width;

  const registerButton({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: () {
          // TODO: Navigate to sign in screen
          Navigator.pushNamed(context, '/sign-up');
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(color: Colors.black, width: 2),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height / 2),
          ),
          padding: EdgeInsets.zero,
        ),
        child: const Text(
          'রেজিস্টার করুন',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
