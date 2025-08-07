import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';

class ProductImagesViewer extends StatefulWidget {
  final String coverImage;
  final List<String> otherImages;

  const ProductImagesViewer({
    super.key,
    required this.coverImage,
    required this.otherImages,
  });

  @override
  State<ProductImagesViewer> createState() => _ProductImagesViewerState();
}

class _ProductImagesViewerState extends State<ProductImagesViewer> {
  int currentIndex = 0;

  List<String> get allImages => [widget.coverImage, ...widget.otherImages];

  void _showNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % allImages.length;
    });
  }

  void _showPrevious() {
    setState(() {
      currentIndex = (currentIndex - 1 + allImages.length) % allImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    log(widget.coverImage);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 400,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.elliptical(180, 40),
              bottomRight: Radius.elliptical(180, 40),
            ),
            child: CachedNetworkImage(
              imageUrl: allImages[currentIndex],
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
              errorListener: (value) {
                return;
              },

              placeholder:
                  (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),

              errorWidget: (context, url, error) {
                return Image.network(
                  widget.coverImage,
                  fit: BoxFit.contain,
                  errorBuilder:
                      (context, error, stackTrace) => const Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                        ),
                      ),
                );
              },
            ),
          ),
        ),

        if (allImages.length > 1) ...[
          Positioned(
            left: 10,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: _NavButton(
                icon: Icons.arrow_back_ios_new,
                onPressed: _showPrevious,
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Directionality(
              textDirection: TextDirection.ltr,

              child: _NavButton(
                icon: Icons.arrow_forward_ios,
                onPressed: _showNext,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _NavButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
