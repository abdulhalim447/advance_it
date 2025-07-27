import 'package:advance_it_ltd/screens/mediahub/video_player_screen.dart';
import 'package:advance_it_ltd/screens/newshub/webview_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';

class LiveTvScreen extends StatelessWidget {
  const LiveTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildHeader(),
            const SizedBox(height: 15),
            _buildUddoktaGrid(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Builds the header section
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      //padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xE63969E7), Color(0xFF7D2AE7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(
        'assets/images/livetvbanner.jpg',
        width: double.infinity,
      ),
    );
  }

  /// Builds the uddokta grid with all partnership options
  Widget _buildUddoktaGrid(BuildContext context) {
    final List<UddoktaOption> uddoktaOptions = [
      UddoktaOption(
        thumbnail:
            'https://1000logos.net/wp-content/uploads/2023/01/Al-Jazeera-Logo.png',
        websiteUrl: 'https://www.youtube.com/watch?v=gCNeDWCI0vo',

        gradientColors: [Colors.blue.shade400, Colors.blue.shade600],
      ), UddoktaOption(
        thumbnail:
            'https://logos-world.net/wp-content/uploads/2024/12/BBC-News-Logo.png',
        websiteUrl: 'https://www.youtube.com/watch?v=Q_OoLm57loM',

        gradientColors: [Colors.blue.shade400, Colors.blue.shade600],
      ),
      UddoktaOption(
        thumbnail:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Jamuna_TV_logo.svg/1024px-Jamuna_TV_logo.svg.png',
        websiteUrl: 'https://www.youtube.com/watch?v=JMpC2znPECg',

        gradientColors: [Colors.blue.shade400, Colors.blue.shade600],
      ),
      UddoktaOption(
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpqcAosr93Nqp6wDUoMAEpX-9uIUbBZcJhfQ&s',
        websiteUrl: 'https://www.youtube.com/watch?v=ufv2PEytQaA',

        gradientColors: [Colors.green.shade400, Colors.green.shade600],
      ),
      UddoktaOption(
        thumbnail:
            'https://cdn.jagonews24.com/media/imgAllNew/BG/2023March/ea-20240827110907.jpg',
        websiteUrl: 'https://www.youtube.com/watch?v=TdwhCOFh9OA',

        gradientColors: [Colors.purple.shade400, Colors.purple.shade600],
      ),
      UddoktaOption(
        thumbnail:
            'https://upload.wikimedia.org/wikipedia/en/thumb/8/88/Channel-i.svg/1200px-Channel-i.svg.png',
        websiteUrl: 'https://www.youtube.com/watch?v=fqoBzhjldZw',

        gradientColors: [Colors.teal.shade400, Colors.teal.shade600],
      ),
      UddoktaOption(
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2p8IeQgVP_hJkzS0y0vVzCB372H4GKG25XQ&s',
        websiteUrl: 'https://www.youtube.com/watch?v=BlauKrctUls',

        gradientColors: [Colors.indigo.shade400, Colors.indigo.shade600],
      ),
      UddoktaOption(
        thumbnail:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/ATN_News_logo.svg/1200px-ATN_News_logo.svg.png',
        websiteUrl: 'https://www.youtube.com/watch?v=oRxf4aGMz2E',

        gradientColors: [Colors.green.shade800, Colors.green.shade800],
      ),
      UddoktaOption(
        thumbnail:
            'https://upload.wikimedia.org/wikipedia/en/thumb/5/57/Ekattor_TV_logo.svg/1200px-Ekattor_TV_logo.svg.png',
        websiteUrl: 'https://www.youtube.com/watch?v=uJJgvxW84qs',

        gradientColors: [Colors.red.shade400, Colors.red.shade600],
      ),

    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Increased columns for smaller grid items
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.0, // Perfect square for compact cards
            ),
            itemCount: uddoktaOptions.length,
            itemBuilder: (context, index) {
              try {
                return _buildUddoktaCard(uddoktaOptions[index], context);
              } catch (e) {
                // Fallback widget in case of error
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(child: Text("Loading error")),
                );
              }
            },
          );
        },
      ),
    );
  }

  /// Builds individual uddokta card
  Widget _buildUddoktaCard(UddoktaOption option, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VideoPlayerScreen(youtubeUrl: option.websiteUrl),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: option.gradientColors.first.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon with gradient background
              Expanded(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      option.thumbnail!,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              option.gradientColors.first,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            color: option.gradientColors.first.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.image_not_supported,
                            color: option.gradientColors.first,
                            size: 30,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // Title
            ],
          ),
        ),
      ),
    );
  }
}

/// Data model for uddokta options
class UddoktaOption {
  final String? thumbnail;
  final String websiteUrl;

  final List<Color> gradientColors;

  UddoktaOption({
    this.thumbnail,
    required this.websiteUrl,

    required this.gradientColors,
  });
}
