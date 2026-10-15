import 'package:flutter/material.dart';

class NetImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const NetImage(this.url, {super.key, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      loadingBuilder: (context, child, progress) =>
      progress == null ? child : Container(color: const Color(0xFFDDE7EE)),
      errorBuilder: (context, error, stack) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6FA8DC), Color(0xFF1F4E79)],
          ),
        ),
        child: const Icon(Icons.landscape, color: Colors.white54, size: 40),
      ),
    );
  }
}