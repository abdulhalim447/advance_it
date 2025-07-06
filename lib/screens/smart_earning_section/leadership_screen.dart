
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LeadershipScreen extends StatefulWidget {
  const LeadershipScreen({super.key});

  @override
  State<LeadershipScreen> createState() => _LeadershipScreenState();
}

class _LeadershipScreenState extends State<LeadershipScreen>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers = [];
  late final List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();

    // Create controllers for different animations
    _controllers.add(
      AnimationController(duration: const Duration(seconds: 2), vsync: this)
        ..repeat(reverse: true),
    );

    _controllers.add(
      AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      )..repeat(reverse: true),
    );

    _controllers.add(
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat(),
    );

    _controllers.add(
      AnimationController(
        duration: const Duration(milliseconds: 2500),
        vsync: this,
      )..repeat(reverse: true),
    );

    // Create animations
    _animations.add(
      Tween<double>(begin: 0.95, end: 1.05).animate(
        CurvedAnimation(parent: _controllers[0], curve: Curves.easeInOut),
      ),
    );

    _animations.add(
      Tween<double>(begin: 0.97, end: 1.03).animate(
        CurvedAnimation(parent: _controllers[1], curve: Curves.easeInOut),
      ),
    );

    _animations.add(
      Tween<double>(
        begin: 0.0,
        end: 2 * math.pi,
      ).animate(CurvedAnimation(parent: _controllers[2], curve: Curves.linear)),
    );

    _animations.add(
      Tween<double>(begin: 0.98, end: 1.02).animate(
        CurvedAnimation(parent: _controllers[3], curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomNavBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFF5F5DC)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildAnimatedLeadershipCard(
                  title: 'অ্যাডভান্স লিডারশিপ',
                  description:
                      'আপনার সরাসরি রেফারে ১০টি কোর্স প্লাস ৫টি প্রিমিয়াম প্যাক রিচার্জ',
                  color: Colors.amber,
                  animation: _animations[0],
                  index: 0,
                ),
                const SizedBox(height: 16),
                _buildAnimatedLeadershipCard(
                  title: 'সিনিয়র অ্যাডভান্স লিডারশিপ',
                  description: 'আপনার সরাসরি রেফারে ৫ জন অ্যাডভান্স লিডার',
                  color: Colors.amber,
                  animation: _animations[1],
                  index: 1,
                ),
                const SizedBox(height: 16),
                _buildAnimatedLeadershipCard(
                  title: 'কো অর্ডিনেটর লিডারশিপ',
                  description:
                      'আপনার সরাসরি রেফারে ৫জন সিনিয়র অ্যাডভান্স লিডার',
                  color: Colors.green,
                  showTrophy: true,
                  animation: _animations[2],
                  index: 2,
                ),
                const SizedBox(height: 16),
                _buildAnimatedLeadershipCard(
                  title: 'সিনিয়র কো অর্ডিনেটর লিডারশিপ',
                  description: 'আপনার সরাসরি রেফারে ৫জন কো অর্ডিনেটর লিডার',
                  color: Colors.green,
                  showTrophy: true,
                  animation: _animations[3],
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedLeadershipCard({
    required String title,
    required String description,
    required Color color,
    bool showTrophy = false,
    required Animation<double> animation,
    required int index,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        // Different animation effects based on index
        if (index == 0) {
          // Scale animation
          return Transform.scale(scale: animation.value, child: child!);
        } else if (index == 1) {
          // Subtle pulsing animation
          return Transform.scale(scale: animation.value, child: child!);
        } else if (index == 2 && showTrophy) {
          // Card with rotating trophy
          return child!;
        } else {
          // Subtle hover animation
          return Transform.scale(scale: animation.value, child: child!);
        }
      },
      child: _buildCardContent(title, description, color, showTrophy),
    );
  }

  // Extracted card content to avoid duplication
  Widget _buildCardContent(
    String title,
    String description,
    Color color,
    bool showTrophy,
  ) {
    return Card(
      elevation: 8,
      shadowColor: color.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: color,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, color.withOpacity(0.8)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'SolaimanLipi',
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3.0,
                            color: Color.fromARGB(50, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (showTrophy)
                    AnimatedBuilder(
                      animation: _animations[2],
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _animations[2].value,
                          child: const Icon(
                            Icons.emoji_events,
                            color: Colors.amber,
                            size: 32,
                          ),
                        );
                      },
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontFamily: 'SolaimanLipi',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildButton('এক্টিভেট'),
                  const SizedBox(width: 12),
                  _buildButton('রিওয়ার্ড'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 5,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'SolaimanLipi',
        ),
      ),
    );
  }

  //appbar=============================================================================
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.amber,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black, size: 30),
        onPressed: () {
          // Handle menu button press
        },
      ),
      title: Image.asset(
        'assets/images/logo.png', // Make sure to add your logo in the assets folder
        height: 40,
        // As a fallback, if the logo is not available, show text.
        errorBuilder: (context, error, stackTrace) {
          return const Text(
            'SELF',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          );
        },
      ),
      centerTitle: true,
    );
  }

  /// Builds the Bottom Navigation Bar.
  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.amber,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'হোম'),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'উদ্দ্যোক্তা',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'ওয়ালেট'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'লাইভ চ্যাট'),
      ],
      currentIndex: 0, // Set the current index
      onTap: (index) {
        // Handle navigation
      },
    );
  }
}
