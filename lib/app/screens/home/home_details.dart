import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:login_asignment/app/screens/home/home_view.dart';
import 'package:share_plus/share_plus.dart';

class HomeDetailPage extends StatelessWidget {
  HomeDetailPage({super.key});
  var currentIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Description',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CarouselSlider(
                            items: imgList
                                .map(
                                  (e) => Container(
                                    padding: const EdgeInsets.all(12),
                                    alignment: Alignment.bottomLeft,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(e),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                )
                                .toList(),
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                currentIndex.value = index;
                              },
                              // aspectRatio: 3,
                              viewportFraction: 1,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              height: Get.height,
                            ),
                          ),
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: DotsIndicator(
                                decorator: DotsDecorator(
                                    color: Colors.grey.shade400,
                                    activeColor: Colors.white),
                                dotsCount: imgList.length,
                                position: currentIndex.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.download),
                        const Icon(Icons.bookmark_outline),
                        const Icon(Icons.favorite_outline),
                        const Icon(Icons.center_focus_strong_outlined),
                        const Icon(Icons.star_border_outlined),
                        IconButton(
                            onPressed: () {
                              Share.shareUri(Uri.parse(imgList[0]));
                            },
                            icon: const Icon(Icons.share)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.bookmark_add_outlined),
                        const Text('1023'),
                        const Icon(Icons.favorite_outline),
                        const Text('1023'),
                        Container(
                          // height: 20,
                          padding: const EdgeInsets.all(2),
                          decoration: ShapeDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              shape: const StadiumBorder()),
                          child: RatingBar.builder(
                            itemSize: 14,
                            initialRating: 3.2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.blue.shade300,
                              size: 10,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ),
                        Text(
                          '3.2',
                          style: TextStyle(color: Colors.blue.shade300),
                        ),
                        const SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                    const Text(
                      'Actor Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Indian Actress',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm_sharp,
                          color: Colors.grey.shade600,
                        ),
                        Text(
                          '  Duration 20 min',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.wallet,
                          color: Colors.grey.shade600,
                        ),
                        Text(
                          '  Duration 20 min',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'About',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Test description  ' * 20,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
