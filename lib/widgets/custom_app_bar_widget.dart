import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Custom reusable AppBar widget
class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool showLogo;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool automaticallyImplyLeading;

  const CustomAppBarWidget({
    super.key,
    this.title,
    this.showLogo = true,
    this.centerTitle = true,
    this.actions,
    this.backgroundColor,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppConstants.primaryColor,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: showLogo ? _buildLogoTitle() : _buildTextTitle(),
      centerTitle: centerTitle,
      actions: actions ?? _buildDefaultActions(),
    );
  }

  /// Builds logo title
  Widget _buildLogoTitle() {
    return Image.asset(
      'assets/images/logo.png',
      height: 40,
      errorBuilder: (context, error, stackTrace) {
        return const Text(
          'Advance IT',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        );
      },
    );
  }

  /// Builds text title
  Widget? _buildTextTitle() {
    if (title == null) return null;
    return Text(
      title!,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  /// Builds default actions
  List<Widget> _buildDefaultActions() {
    return [
      IconButton(
        icon: const Icon(
          Icons.notifications_none,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {
          // Handle notification button press
        },
      ),
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
