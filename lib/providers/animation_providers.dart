import 'package:flutter/material.dart';

/// Provider for managing grid animations
class GridAnimationProvider extends ChangeNotifier {
  AnimationController? _controller;
  List<Animation<double>> _slideAnimations = [];
  List<Animation<double>> _fadeAnimations = [];
  List<Animation<double>> _scaleAnimations = [];
  bool _isAnimating = false;
  bool _animationInitialized = false;
  int _itemCount = 0;

  // Getters
  bool get isAnimating => _isAnimating;
  bool get animationInitialized => _animationInitialized;
  int get itemCount => _itemCount;

  /// Initialize animations for grid items
  void initializeAnimations(int itemCount, TickerProvider ticker) {
    if (_animationInitialized) return;

    _itemCount = itemCount;
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: ticker,
    );

    // Create staggered animations for each item
    _slideAnimations.clear();
    _fadeAnimations.clear();
    _scaleAnimations.clear();

    for (int i = 0; i < itemCount; i++) {
      // Calculate staggered timing
      final double startTime = (i * 0.1).clamp(0.0, 0.8);
      final double endTime = (startTime + 0.4).clamp(0.4, 1.0);

      // Slide animation (from bottom)
      final slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _controller!,
          curve: Interval(startTime, endTime, curve: Curves.easeOutBack),
        ),
      );

      // Fade animation
      final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller!,
          curve: Interval(startTime, endTime, curve: Curves.easeOut),
        ),
      );

      // Scale animation
      final scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller!,
          curve: Interval(startTime, endTime, curve: Curves.easeOutBack),
        ),
      );

      _slideAnimations.add(slideAnimation);
      _fadeAnimations.add(fadeAnimation);
      _scaleAnimations.add(scaleAnimation);
    }

    _animationInitialized = true;
    notifyListeners();
  }

  /// Start the staggered animation
  void startStaggeredAnimation() {
    if (!_animationInitialized || _isAnimating) return;

    _isAnimating = true;
    notifyListeners();

    _controller!.forward().then((_) {
      _isAnimating = false;
      notifyListeners();
    });
  }

  /// Reset animations
  void resetAnimation() {
    if (_controller != null) {
      _controller!.reset();
      _isAnimating = false;
      notifyListeners();
    }
  }

  /// Get slide animation for specific item
  Animation<double> getSlideAnimation(int index) {
    if (index < _slideAnimations.length) {
      return _slideAnimations[index];
    }
    return AlwaysStoppedAnimation(0.0);
  }

  /// Get fade animation for specific item
  Animation<double> getFadeAnimation(int index) {
    if (index < _fadeAnimations.length) {
      return _fadeAnimations[index];
    }
    return AlwaysStoppedAnimation(1.0);
  }

  /// Get scale animation for specific item
  Animation<double> getScaleAnimation(int index) {
    if (index < _scaleAnimations.length) {
      return _scaleAnimations[index];
    }
    return AlwaysStoppedAnimation(1.0);
  }

  /// Dispose animation controller
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

/// Provider for managing page transitions
class PageTransitionProvider extends ChangeNotifier {
  bool _pageTransitionComplete = false;

  bool get pageTransitionComplete => _pageTransitionComplete;

  /// Mark page transition as complete
  void onPageTransitionComplete() {
    _pageTransitionComplete = true;
    notifyListeners();
  }

  /// Reset page transition state
  void resetPageTransition() {
    _pageTransitionComplete = false;
    notifyListeners();
  }
}

/// Animation presets enum
enum AnimationPreset { bouncy, smooth, elegant, quick }

/// Provider for animation settings
class AnimationSettingsProvider extends ChangeNotifier {
  AnimationPreset _currentPreset = AnimationPreset.bouncy;
  bool _animationsEnabled = true;

  AnimationPreset get currentPreset => _currentPreset;
  bool get animationsEnabled => _animationsEnabled;

  /// Set animation preset
  void setAnimationPreset(AnimationPreset preset) {
    _currentPreset = preset;
    notifyListeners();
  }

  /// Toggle animations on/off
  void setAnimationsEnabled(bool enabled) {
    _animationsEnabled = enabled;
    notifyListeners();
  }

  /// Get animation duration based on preset
  Duration getAnimationDuration() {
    switch (_currentPreset) {
      case AnimationPreset.bouncy:
        return const Duration(milliseconds: 800);
      case AnimationPreset.smooth:
        return const Duration(milliseconds: 600);
      case AnimationPreset.elegant:
        return const Duration(milliseconds: 1000);
      case AnimationPreset.quick:
        return const Duration(milliseconds: 400);
    }
  }

  /// Get animation curve based on preset
  Curve getAnimationCurve() {
    switch (_currentPreset) {
      case AnimationPreset.bouncy:
        return Curves.easeOutBack;
      case AnimationPreset.smooth:
        return Curves.easeOutCubic;
      case AnimationPreset.elegant:
        return Curves.easeOutQuart;
      case AnimationPreset.quick:
        return Curves.easeOut;
    }
  }
}
