import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';
import 'webview_screen.dart';

class NewsGridScreen extends StatelessWidget {
  const NewsGridScreen({super.key});

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
        'assets/images/newshub_banner.jpg',
        width: double.infinity,
      ),
    );
  }

  /// Builds the uddokta grid with all partnership options
  Widget _buildUddoktaGrid(BuildContext context) {
    final List<UddoktaOption> uddoktaOptions = [

      UddoktaOption(
        thumbnail:
            'https://www.bd-pratidin.com/front/img/logo.png',
        websiteUrl: 'https://www.bd-pratidin.com/',

        gradientColors: [Colors.green.shade400, Colors.green.shade600],
      ),
      UddoktaOption(
        thumbnail:
        'https://cdn6.aptoide.com/imgs/1/3/8/1380470209c8058cd0fedc4092d5c8fa_icon.png',
        websiteUrl: 'https://www.prothomalo.com/',

        gradientColors: [Colors.green.shade400, Colors.green.shade600],
      ),
      UddoktaOption(
        thumbnail:
            'https://www.ennayadiganta.com/resources/img/sitesetup/1_1.png',
        websiteUrl: 'https://www.dailynayadiganta.com/',

        gradientColors: [Colors.purple.shade400, Colors.purple.shade600],
      ),
      UddoktaOption(
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzn5mvHiyxPfh60feb2eZEqLPLtLDGjOefGQ&s',
        websiteUrl: 'https://www.dailystar.net/',

        gradientColors: [Colors.teal.shade400, Colors.teal.shade600],
      ),
      UddoktaOption(
        thumbnail:
            'https://logovectordl.com/wp-content/uploads/2019/12/kaler-kantho-logo-vector.png',
        websiteUrl: 'https://www.kalerkantho.com/',

        gradientColors: [Colors.indigo.shade400, Colors.indigo.shade600],
      ),
      UddoktaOption(
        thumbnail:
            'https://cdn.brandfetch.io/ittefaq.com.bd/fallback/lettermark/theme/dark/h/256/w/256/icon?c=1bfwsmEH20zzEfSNTed',
        websiteUrl: 'https://www.ittefaq.com.bd/',

        gradientColors: [Colors.green.shade800, Colors.green.shade800],
      ),
      UddoktaOption(
        thumbnail:
            'https://www.cfsbangladesh.org/wp-content/uploads/Daily-Inqilab-Logo.png',
        websiteUrl: 'https://www.dailyinqilab.com/',

        gradientColors: [Colors.red.shade400, Colors.red.shade600],
      ),


      UddoktaOption(
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz_3CxAv41XTLaR23167FXFIpnkz5Wn9VzCg&s',
        websiteUrl: 'https://mzamin.com/',

        gradientColors: [Colors.amber, Colors.amber],
      ),
      UddoktaOption(
        thumbnail:
            'https://upload.wikimedia.org/wikipedia/bn/thumb/3/3a/%E0%A6%B8%E0%A6%AE%E0%A6%95%E0%A6%BE%E0%A6%B2%E0%A7%87%E0%A6%B0_%E0%A6%B2%E0%A7%8B%E0%A6%97%E0%A7%8B.svg/1280px-%E0%A6%B8%E0%A6%AE%E0%A6%95%E0%A6%BE%E0%A6%B2%E0%A7%87%E0%A6%B0_%E0%A6%B2%E0%A7%8B%E0%A6%97%E0%A7%8B.svg.png',
        websiteUrl: 'https://samakal.com/',

        gradientColors: [Colors.pink.shade400, Colors.pink.shade600],
      ),
      UddoktaOption(
        thumbnail:
            'https://upload.wikimedia.org/wikipedia/bn/7/78/%E0%A6%A6%E0%A7%88%E0%A6%A8%E0%A6%BF%E0%A6%95_%E0%A6%9C%E0%A6%A8%E0%A6%95%E0%A6%A3%E0%A7%8D%E0%A6%A0_%E0%A6%B2%E0%A7%8B%E0%A6%97%E0%A7%8B.png',
        websiteUrl: 'https://www.dailyjanakantha.com/',

        gradientColors: [Colors.cyan.shade400, Colors.cyan.shade600],
      ),
      UddoktaOption(
        thumbnail:
        'https://upload.wikimedia.org/wikipedia/bn/7/7d/%E0%A6%AE%E0%A6%BE%E0%A6%B8%E0%A6%BF%E0%A6%95_%E0%A6%86%E0%A6%B2_%E0%A6%95%E0%A6%BE%E0%A6%89%E0%A6%B8%E0%A6%BE%E0%A6%B0%E0%A7%87%E0%A6%B0_%E0%A6%B2%E0%A7%8B%E0%A6%97%E0%A7%8B.jpeg',
        websiteUrl: 'https://www.alkawsar.com/bn/',

        gradientColors: [Colors.blue.shade400, Colors.blue.shade600],
      ),

      UddoktaOption(
        thumbnail:
        'https://finevpn.org/wp-content/uploads/2024/02/al-jazeera-logo-logo.png',
        websiteUrl: 'https://www.aljazeera.com/',

        gradientColors: [Colors.blue.shade400, Colors.blue.shade600],
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
            builder: (context) => WebViewScreen(url: option.websiteUrl),
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
