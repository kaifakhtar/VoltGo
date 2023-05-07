import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardBanner extends StatefulWidget {
  List<String> images = [
    'asset/images/carosel_image.png',
    'asset/images/carosel_image2.png',
    'asset/images/harridepay_hurry.png'
  ];

  //CardBanner({super.key, required this.images});

  @override
  _CardBannerState createState() => _CardBannerState();
}

class _CardBannerState extends State<CardBanner> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.images
          .map((image) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image(
                    width: 300.w,
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        viewportFraction: 0.8,
        height: 200.h,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        onPageChanged: (index, _) {
          setState(() {
            _currentImageIndex = index;
          });
        },
      ),
    );
  }
}
