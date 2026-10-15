import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/net_image.dart';
import '../widgets/net_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tab = 0; // which bottom tab is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          children: [
            _buildGreeting(),
            const SizedBox(height: 18),
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildFeaturedCard(),
            const SizedBox(height: 18),
            _buildCategories(),
            const SizedBox(height: 22),
            _buildPopular(),
            const SizedBox(height: 22),
            _buildRecommended(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        onTap: (i) => setState(() => _tab = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimary,
        unselectedItemColor: kTextGrey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  // ---------- Greeting row ----------
  Widget _buildGreeting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Good Morning,',
                style: TextStyle(fontSize: 14, color: kTextDark)),
            SizedBox(height: 2),
            Text('Pramod 👋',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: kTextDark)),
          ],
        ),
        // Bell icon with red dot
        Stack(
          children: [
            const Icon(Icons.notifications, size: 28),
            Positioned(
              right: 2,
              top: 2,
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ---------- Search bar ----------
  Widget _buildSearchBar() {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F5),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, size: 20, color: kTextDark),
          SizedBox(width: 10),
          Expanded(
            child: Text('Search treks, destinations, or places...',
                style: TextStyle(fontSize: 12.5, color: kTextGrey)),
          ),
        ],
      ),
    );
  }

  // ---------- Featured card ----------
  Widget _buildFeaturedCard() {
    return GestureDetector(
      onTap: () {
        // TODO: Step 5 - open Trip Details
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 140,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Photo
              const NetImage(kEverestImg),

              // Dark gradient at the bottom
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.65),
                    ],
                  ),
                ),
              ),

              // Text
              Positioned(
                left: 14,
                bottom: 14,
                right: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('Featured',
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                    const SizedBox(height: 6),
                    const Text('Everest Base Camp Trek',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                    const Text('The journey of a lifetime',
                        style: TextStyle(color: Colors.white70, fontSize: 11)),
                  ],
                ),
              ),

              // White arrow button
              Positioned(
                right: 14,
                bottom: 14,
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_forward, size: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Category icons ----------
  Widget _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _CategoryItem(
            Icons.terrain, 'Trekking', Color(0xFFE3F5EE), kPrimary),
        _CategoryItem(Icons.map, 'Tours', Color(0xFFE3EEFB), Color(0xFF1E6FD9)),
        _CategoryItem(
            Icons.hotel, 'Hotels', Color(0xFFFFEBD9), Color(0xFFF08A24)),
        _CategoryItem(
            Icons.explore, 'Explore', Color(0xFFEDE4FA), Color(0xFF7B4FD6)),
      ],
    );
  }

  // ---------- Popular Destinations ----------
  Widget _buildPopular() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Popular Destinations',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            Text('See All',
                style: TextStyle(
                    fontSize: 12,
                    color: kPrimary,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Expanded(
              child: _DestinationCard(
                image: kAnnapurnaImg,
                title: 'Annapurna Circuit',
                rating: '4.8',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _DestinationCard(
                image: kLangtangImg,
                title: 'Langtang Valley',
                rating: '4.6',
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ---------- Recommended For You ----------
  Widget _buildRecommended() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recommended For You',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // Photo on the left
              ClipRRect(
                borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(14)),
                child: SizedBox(
                  width: 110,
                  height: 80,
                  child: NetImage(kMardiImg),
                ),
              ),
              const SizedBox(width: 12),

              // Text in the middle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Mardi Himal Trek',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700)),
                    SizedBox(height: 4),
                    Text('5 Days  •  Moderate',
                        style: TextStyle(fontSize: 11, color: kTextGrey)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 12, color: kPrimary),
                        Text(' Nepal  ',
                            style: TextStyle(fontSize: 11, color: kTextGrey)),
                        Icon(Icons.star, size: 12, color: Colors.amber),
                        Text(' 4.7',
                            style: TextStyle(fontSize: 11, color: kTextGrey)),
                      ],
                    ),
                  ],
                ),
              ),

              // Arrow button on the right
              Container(
                margin: const EdgeInsets.only(right: 12),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: const Icon(Icons.arrow_forward, size: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------- One category item ----------
class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color bg;
  final Color fg;

  const _CategoryItem(this.icon, this.label, this.bg, this.fg);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: fg, size: 26),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 11, color: kTextDark)),
      ],
    );
  }
}

// ---------- One destination card ----------
class _DestinationCard extends StatelessWidget {
  final String image;
  final String title;
  final String rating;

  const _DestinationCard({
    required this.image,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: SizedBox(height: 66, child: NetImage(image)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 11.5, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 12, color: kPrimary),
                    const Text(' Nepal',
                        style: TextStyle(fontSize: 10.5, color: kTextGrey)),
                    const Spacer(),
                    const Icon(Icons.star, size: 12, color: Colors.amber),
                    Text(' $rating',
                        style: const TextStyle(
                            fontSize: 10.5, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}