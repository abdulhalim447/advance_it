import 'package:advance_it_ltd/constants/app_constants.dart';
import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:advance_it_ltd/providers/animation_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Custom Right-to-Left Slide Transition with Provider integration
class SlideRightToLeftTransition extends PageRouteBuilder {
  final Widget page;
  final BuildContext parentContext;

  SlideRightToLeftTransition({required this.page, required this.parentContext})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Define the slide transition from right to left
          const begin = Offset(1.0, 0.0); // Start from right (1.0, 0.0)
          const end = Offset.zero; // End at center (0.0, 0.0)
          const curve = Curves.easeInOutCubic; // Smooth curve

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          var offsetAnimation = animation.drive(tween);

          // Listen for animation completion to trigger grid animation
          animation.addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // Use a delay to ensure proper context access
              Future.delayed(const Duration(milliseconds: 200), () {
                try {
                  final pageTransitionProvider =
                      Provider.of<PageTransitionProvider>(
                        parentContext,
                        listen: false,
                      );
                  pageTransitionProvider.onPageTransitionComplete();
                } catch (e) {
                  // Handle case where context is not available
                  debugPrint('Could not access Provider context: $e');
                }
              });
            }
          });

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
}

class SeeMoreProjectsScreen extends StatefulWidget {
  const SeeMoreProjectsScreen({super.key});

  @override
  State<SeeMoreProjectsScreen> createState() => _SeeMoreProjectsScreenState();
}

class _SeeMoreProjectsScreenState extends State<SeeMoreProjectsScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Initialize animations after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeAnimations();
    });
  }

  void _initializeAnimations() {
    final gridProvider = Provider.of<GridAnimationProvider>(
      context,
      listen: false,
    );
    // Initialize animations for 24 service items
    gridProvider.initializeAnimations(24, this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(children: [_buildServiceTabs()]),
      ),
    );
  }

  /// Builds the tabbed section for various services.
  Widget _buildServiceTabs() {
    return Container(
      color: AppConstants.primaryColor,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Animated title
          Consumer<PageTransitionProvider>(
            builder: (context, pageProvider, child) {
              return AnimatedOpacity(
                opacity: pageProvider.pageTransitionComplete ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 100),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "আপকামিং প্রোজেক্ট সমূহ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      //fontFamily: 'SolaimanLipi',
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            width: double.infinity,
            // Remove fixed height to allow dynamic sizing
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            margin: const EdgeInsets.only(top: 0),
            child: _buildServiceGrid(),
          ),
        ],
      ),
    );
  }

  /// Builds the grid of service icons.
  Widget _buildServiceGrid() {
    // Data model for grid items based on the screenshot
    final List<Map<String, dynamic>> serviceItems = [
      {
        'icon': 'assets/icon/dgsub.png',
        'label': 'ডিজি সাব',
        'color': Colors.black,
        'route': '/digi-sub',
      },
      {
        'icon': 'assets/icon/heliride.png',
        'label': 'হেলি রাইড',
        'color': Colors.black,
        'route': '/heli-ride',
      },
      {
        'icon': 'assets/icon/tourist_guid.png',
        'label': 'টুরিস্ট গাইড',
        'color': Colors.black,
        'route': '/tourist-guid',
      },
      {
        'icon': 'assets/icon/property_jone.png',
        'label': 'প্রোপার্টি জোন',
        'color': Colors.black,
        'route': '/property-zone',
      },
      {
        'icon': 'assets/icon/advance_academy.png',
        'label': 'এডভাস একাডেমি',
        'color': Colors.black,
        'route': '/advance-academy',
      },

      {
        'icon': 'assets/icon/hajj_omra.png',
        'label': 'হজ্জ ওমরা',
        'color': Colors.black,
        'route': '/hajj-umrah',
      },
      {
        'icon': 'assets/icon/marketplace.png',
        'label': 'মার্কেটপ্লেস',
        'color': Colors.black,
        'route': '/marketplace',
      },
      {
        'icon': 'assets/icon/ad_work.png',
        'label': 'এড ওয়ার্ক',
        'color': Colors.black,
        'route': '/ad-work',
      },
      {
        'icon': 'assets/icon/job_solution.png',
        'label': 'জব সলিউশন',
        'color': Colors.black,
        'route': '/job-solution',
      },
      {
        'icon': 'assets/icon/interior_design.png',
        'label': 'ইন্টিরিয়র ডিজাইন',
        'color': Colors.black,
        'route': '/interior-design',
      },
      {
        'icon': 'assets/icon/event_management.png',
        'label': 'ইভেন্ট ম্যানেজমেন্ট',
        'color': Colors.black,
        'route': '/event-management',
      },
      {
        'icon': 'assets/icon/jonoprio_brand.png',
        'label': 'জনপ্রিয় ব্রান্ড',
        'color': Colors.black,
        'route': '/popular-brands',
      },
      {
        'icon': 'assets/icon/tution_media.png',
        'label': 'টিউশন মিডিয়া',
        'color': Colors.black,
        'route': '/tuition-media',
      },
      {
        'icon': 'assets/icon/technisian.png',
        'label': 'টেকনিশিয়ান',
        'color': Colors.black,
        'route': '/technician',
      },
      {
        'icon': 'assets/icon/discount_jone.png',
        'label': 'ডিসকাউন্ট জোন',
        'color': Colors.black,
        'route': '/discount-zone',
      },
      {
        'icon': 'assets/icon/doctor_seba.png',
        'label': 'ডক্টর সেবা',
        'color': Colors.black,
        'route': '/doctor-service',
      },
      {
        'icon': 'assets/icon/flight_ticket.png',
        'label': 'ফ্লাইট টিকেট',
        'color': Colors.black,
        'route': '/flight-ticket',
      },
      {
        'icon': 'assets/icon/agro_project.png',
        'label': 'এগ্রো প্রোজেক্ট',
        'color': Colors.black,
        'route': '/agro-project',
      },
      {
        'icon': 'assets/icon/quran_sikkha.png',
        'label': 'কোরআন শিক্ষা',
        'color': Colors.black,
        'route': '/quran-education',
      },
      {
        'icon': 'assets/icon/blood_bank.png',
        'label': 'ব্লাড ব্যাংক',
        'color': Colors.black,
        'route': '/blood-bank',
      },
      {
        'icon': 'assets/icon/hotel_booking.png',
        'label': 'হোটেল বুকিং',
        'color': Colors.black,
        'route': '/hotel-booking',
      },
    ];

    // Empty list as we're using all items in the main list
    final List<Map<String, dynamic>> moreServiceItems = [];

    final allItems = [...serviceItems, ...moreServiceItems];

    // Return a container with white background to separate from tabs
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
      // Use LayoutBuilder to make the grid responsive
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate number of columns based on available width
          int crossAxisCount = 4; // Default for large screens

          // Width thresholds for different screen sizes
          if (constraints.maxWidth < 300) {
            crossAxisCount = 2; // Very small screens - 2 items per row
          } else if (constraints.maxWidth < 400) {
            crossAxisCount = 3; // Medium small screens - 3 items per row
          }
          // else keep 4 columns for larger screens

          return Consumer2<PageTransitionProvider, GridAnimationProvider>(
            builder: (context, pageProvider, gridProvider, child) {
              // Start grid animation when page transition completes
              if (pageProvider.pageTransitionComplete &&
                  gridProvider.animationInitialized &&
                  !gridProvider.isAnimating) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  gridProvider.startStaggeredAnimation();
                });
              }

              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                ),
                itemCount: allItems.length,
                itemBuilder: (context, index) {
                  final item = allItems[index];
                  return _buildAnimatedGridItem(item, index, gridProvider);
                },
              );
            },
          );
        },
      ),
    );
  }

  /// Builds an animated grid item using provider animations
  Widget _buildAnimatedGridItem(
    Map<String, dynamic> item,
    int index,
    GridAnimationProvider gridProvider,
  ) {
    return AnimatedBuilder(
      animation: gridProvider.getSlideAnimation(index),
      builder: (context, child) {
        return AnimatedBuilder(
          animation: gridProvider.getFadeAnimation(index),
          builder: (context, child) {
            return AnimatedBuilder(
              animation: gridProvider.getScaleAnimation(index),
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    0,
                    gridProvider.getSlideAnimation(index).value,
                  ),
                  child: Opacity(
                    opacity: gridProvider.getFadeAnimation(index).value,
                    child: Transform.scale(
                      scale: gridProvider.getScaleAnimation(index).value,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, item['route']);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 28,
                                  child: Image.asset(
                                    item['icon'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Flexible(
                                child: Text(
                                  item['label'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
