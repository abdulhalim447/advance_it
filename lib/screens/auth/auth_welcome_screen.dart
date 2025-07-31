import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_theme.dart';

class AuthWelcomeScreen extends StatelessWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppTheme.primaryColor, Colors.amber.shade600],
            ),
          ),
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return _AuthWelcomeContent(constraints: constraints);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthWelcomeContent extends StatelessWidget {
  final BoxConstraints constraints;

  const _AuthWelcomeContent({required this.constraints});

  @override
  Widget build(BuildContext context) {
    final screenHeight = constraints.maxHeight;
    final screenWidth = constraints.maxWidth;

    // Responsive calculations
    final isTablet = screenWidth > 600;
    final logoSize = isTablet ? 160.0 : 150.0;
    final titleFontSize = isTablet ? 36.0 : 28.0;
    final subtitleFontSize = isTablet ? 18.0 : 14.0;
    final buttonHeight = isTablet ? 60.0 : 50.0;
    final buttonWidth = isTablet ? 280.0 : 240.0;
    final horizontalPadding = isTablet ? 60.0 : 32.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          // Top spacing
          SizedBox(height: screenHeight * 0.15),

          // Welcome text section
          _WelcomeTextSection(
            titleFontSize: titleFontSize,
            subtitleFontSize: subtitleFontSize,
          ),

          // Spacer
          SizedBox(height: screenHeight * 0.12),

          // Logo section
          _LogoSection(logoSize: logoSize),

          // Flexible spacer to push buttons to bottom
          const Spacer(),

          // Buttons section
          _ButtonsSection(buttonHeight: buttonHeight, buttonWidth: buttonWidth),

          // Bottom spacing
          SizedBox(height: screenHeight * 0.15),
        ],
      ),
    );
  }
}

class _WelcomeTextSection extends StatelessWidget {
  final double titleFontSize;
  final double subtitleFontSize;

  const _WelcomeTextSection({
    required this.titleFontSize,
    required this.subtitleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome to',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black.withValues(alpha: 0.7),
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5,
          ),
        ),
        //const SizedBox(height: 8),
        Text(
          'ADVANCE',
          style: TextStyle(
            fontSize: 36,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        //const SizedBox(height: 12),
        Text(
          'We make it for you',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black.withValues(alpha: 0.8),
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

class _LogoSection extends StatelessWidget {
  final double logoSize;

  const _LogoSection({required this.logoSize});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final avatarRadius = (screenHeight * 0.06).clamp(40.0, 55.0);

    return Container(
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
          radius: avatarRadius,
          backgroundColor: Colors.black,
          child: ClipOval(
            child: Image.asset(
              'assets/images/logo.png',
              width: avatarRadius * 1.6,
              height: avatarRadius * 1.6,
              color: Color(0xFFFED700),
              //fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonsSection extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;

  const _ButtonsSection({
    required this.buttonHeight,
    required this.buttonWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sign Up Button
        _SignUpButton(height: buttonHeight, width: buttonWidth),

        const SizedBox(height: 16),

        // Sign In Button
        _SignInButton(height: buttonHeight, width: buttonWidth),
      ],
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
          Navigator.pushNamed(context, '/sign-up');
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
          'REGISTER',
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

class _SignInButton extends StatelessWidget {
  final double height;
  final double width;

  const _SignInButton({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: () {
          // TODO: Navigate to sign in screen
          Navigator.pushNamed(context, '/sign-in');
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
          'LOGIN',
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
