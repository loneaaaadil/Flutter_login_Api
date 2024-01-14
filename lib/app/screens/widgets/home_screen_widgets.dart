import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';
import '../home/home_view.dart';

class HorizontalSlider extends GetView<HomeController> {
  const HorizontalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          controller.currentIndex.value = index;
        },
        viewportFraction: 0.9,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        height: 150,
      ),
      items: imgList
          .map(
            (item) => ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(item), fit: BoxFit.cover)),
                  child: Text(
                    'No. ${imgList.indexOf(item)} image',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          )
          .toList(),
    );
  }
}

class PopularPeopleWidget extends StatelessWidget {
  const PopularPeopleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        itemCount: 20,
        itemBuilder: (context, index) => FittedBox(
          child: Container(
            // height: 170.w,
            width: Get.width * 0.8,
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.only(right: 16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey)
                // color: Colors.black,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: const Icon(Icons.edit),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Author',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22.sp),
                        ),
                        const Text('1,028 Meetups'),
                      ],
                    )
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                SizedBox(
                  width: Get.width,
                  child: const Stack(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                        ),
                        // backgroundColor: Colors.red,
                      ),
                      Positioned(
                        top: 0,
                        left: 30,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.green,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 60,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.purple,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 90,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.yellow,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('See More')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
