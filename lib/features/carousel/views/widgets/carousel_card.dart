import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardBanner extends StatefulWidget {
  List<String> images = [
    'https://firebasestorage.googleapis.com/v0/b/harridepay.appspot.com/o/card%20showcase%20images%2Fwith%20nitj.png?alt=media&token=e373a202-3453-4e8c-b88b-25d41345c7e2',
    'https://firebasestorage.googleapis.com/v0/b/harridepay.appspot.com/o/card%20showcase%20images%2Flets%20roll.png?alt=media&token=770d0f7b-0214-483e-a20b-3d1fd80b1a7d',
    'https://firebasestorage.googleapis.com/v0/b/harridepay.appspot.com/o/card%20showcase%20images%2Fgo%20green.png?alt=media&token=6a962e7c-fa03-40a6-aa5c-4535a7427db4'
   // 'gs://harridepay.appspot.com/card showcase images/with nitj.png',
    // 'asset/images/card_image_ready.png',
    // 'asset/images/card_image_ready4x.png'
  ];

  //CardBanner({super.key, required this.images});

  @override
  _CardBannerState createState() => _CardBannerState();
}

class _CardBannerState extends State<CardBanner> {
  int _currentImageIndex = 0;
  //late List<String> _afterImages;
  Future<List<String>> downloadImages() async {
    List<String> downloadUrls = [];
    for (String imageUrl in widget.images) {
      String downloadUrl = await firebase_storage.FirebaseStorage.instance
          .refFromURL(imageUrl)
          .getDownloadURL();
      downloadUrls.add(downloadUrl);
    }
    return downloadUrls;
  }

  @override
  void initState() {
   // _afterImages= downloadImages() as List<String>;
    // TODO: implement initState
    super.initState();
  }

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
                    child: CachedNetworkImage(
                      imageUrl: image,
                      placeholder: (context, url) =>
                          Center(child: const CircularProgressIndicator()),
                      errorWidget: (context, url, error) {
                        print("error: " + error.toString());
                        return const Icon(Icons.error);
                      },
                    )),
              ))
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 150.h,
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
