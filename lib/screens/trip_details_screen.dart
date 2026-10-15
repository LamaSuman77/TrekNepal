import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/net_image.dart';
import '../widgets/net_images.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Hero image at the top
          const SizedBox(
            height: 300,
            width: double.infinity,
            child: NetImage(kAnnapurnaImg),
          ),

          // 2. Scrollable white sheet that overlaps the image
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 270),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleRow(),
                  const _SectionDivider(),
                  _buildInfoRow(),
                  const _SectionDivider(),
                  _buildOverview(),
                  const _SectionDivider(),
                  _buildHighlights(),
                  const SizedBox(height: 18),
                  _buildBookingCard(context),
                ],
              ),
            ),
          ),

          // 3. Back and favorite buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _RoundIconButton(
                    Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  _RoundIconButton(Icons.favorite_border, onTap: () {}),
                ],
              ),
            ),
          ),

          // 4. "Moderate" chip on the image
          Positioned(
            top: 235,
            left: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text('Moderate',
                  style: TextStyle(color: Colors.white, fontSize: 11)),
            ),
          ),
        ],
      ),

      // Bottom tabs: Itinerary / Inclusions / Reviews
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 14),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFEDEFF1))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _BottomTab(Icons.map_outlined, 'Itinerary'),
            _BottomTab(Icons.check_circle_outline, 'Inclusions'),
            _BottomTab(Icons.star_border, 'Reviews'),
          ],
        ),
      ),
    );
  }

  // ---------- Title + location + rating ----------
  Widget _buildTitleRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Annapurna Circuit',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.location_on, size: 14, color: kPrimary),
            Text(' Nepal',
                style: TextStyle(fontSize: 12, color: kTextGrey)),
            SizedBox(width: 24),
            Icon(Icons.star, size: 14, color: Colors.amber),
            Text(' 4.8 ',
                style:
                TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            Text('(1.2k reviews)',
                style: TextStyle(fontSize: 12, color: kTextGrey)),
          ],
        ),
      ],
    );
  }

  // ---------- Duration / Difficulty / Best Time ----------
  Widget _buildInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _InfoItem(Icons.calendar_today_outlined, '14 Days', 'Duration'),
        _InfoItem(Icons.landscape_outlined, 'Moderate', 'Difficulty'),
        _InfoItem(Icons.access_time, 'Best Time', 'Mar - May'),
      ],
    );
  }

  // ---------- Overview ----------
  Widget _buildOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Overview',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        SizedBox(height: 8),
        Text(
          'The Annapurna Circuit is one of the most breathtaking trekking '
              'routes in the world, featuring diverse landscapes, traditional '
              'villages, and stunning mountain views.',
          style: TextStyle(fontSize: 12, color: kTextGrey, height: 1.6),
        ),
      ],
    );
  }

  // ---------- Highlights ----------
  Widget _buildHighlights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Highlights',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        SizedBox(height: 10),
        _Highlight('Thorong La Pass (5,416 m)'),
        _Highlight('Tibetan culture and villages'),
        _Highlight('Stunning views of Annapurna range'),
      ],
    );
  }

  // ---------- Price + Book Now ----------
  Widget _buildBookingCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F6F1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('From',
                  style: TextStyle(fontSize: 11, color: kTextGrey)),
              Text('\$650',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: kPrimaryDark)),
              Text('per person',
                  style: TextStyle(fontSize: 11, color: kTextGrey)),
            ],
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryDark,
              foregroundColor: Colors.white,
              padding:
              const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking started!')),
              );
            },
            icon: const Icon(Icons.arrow_forward, size: 16),
            label: const Text('Book Now'),
          ),
        ],
      ),
    );
  }
}

// =====================================================================
// Small reusable widgets used only on this screen
// =====================================================================

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(height: 1),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _RoundIconButton(this.icon, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration:
        const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(icon, size: 20, color: kTextDark),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoItem(this.icon, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: kTextDark),
            const SizedBox(width: 6),
            Text(title,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 4),
        Text(subtitle,
            style: const TextStyle(fontSize: 11, color: kTextGrey)),
      ],
    );
  }
}

class _Highlight extends StatelessWidget {
  final String text;

  const _Highlight(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check, size: 16, color: kPrimary),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 12, color: kTextGrey)),
        ],
      ),
    );
  }
}

class _BottomTab extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BottomTab(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 22, color: kTextGrey),
        const SizedBox(height: 3),
        Text(label, style: const TextStyle(fontSize: 10.5, color: kTextGrey)),
      ],
    );
  }
}