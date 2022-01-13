import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeleton_text/skeleton_text.dart';

class DetailsPageLoading extends StatelessWidget {
  const DetailsPageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _buildImageSlider(context),
              _buildContent(context),
            ],
          ),
          _buildHeader(context),
        ],
      ),
    );
  }

  SkeletonAnimation _buildImageSlider(BuildContext context) {
    return SkeletonAnimation(
      child: Container(
        color: Colors.grey[300],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
      ),
    );
  }

  Expanded _buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonAnimation(
                shimmerColor: Colors.grey,
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[300]),
                )),
            const SizedBox(
              height: 5,
            ),
            SkeletonAnimation(
                shimmerColor: Colors.grey,
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[300]),
                )),
            const SizedBox(
              height: 20,
            ),
            SkeletonAnimation(
              shimmerColor: Colors.grey,
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[300]),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonAnimation(
                        shimmerColor: Colors.grey,
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[300]),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: SvgPicture.asset(
                          'assets/icons/message-circle.svg',
                          width: 36,
                          height: 36,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildHeader(BuildContext context) {
    return Positioned(
        left: 14.0,
        top: 23,
        right: 14.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/chevron-left.svg'),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/shopping-bag.svg'),
            )
          ],
        ));
  }
}
