import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../dummy/home_json.dart';
import '../theme/colors.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: _getAppBar(),
        ),
        body: _getBody(),
        bottomNavigationBar: _getFooter(),
      ),
    );
  }

  Widget _getAppBar() {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: AppBar(
        elevation: 0,
        backgroundColor: primary,
        leading: IconButton(
          icon: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: secondary.withOpacity(.2),
              ),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: secondary,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Favourite',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: secondary,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: secondary.withOpacity(.15),
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
              color: white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              LineIcons.trash,
              size: 20,
              color: secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: List.generate(
          homeJson.length,
          (index) => FadeInUp(
            duration: Duration(milliseconds: 300 * (index + 1)),
            child: Column(
              children: [
                FadeIn(
                  duration: Duration(milliseconds: index * 1000),
                  child: SizedBox(
                    width: (size.width - 50) / 2,
                    height: 220,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          top: 25,
                          child: Container(
                            constraints:
                                const BoxConstraints.expand(height: 200),
                            decoration: BoxDecoration(
                              color: secondary.withOpacity(.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        LineIcons.star,
                                        size: 18,
                                        color: secondary,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        homeJson[index]['rate'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: secondary.withOpacity(.15),
                                          blurRadius: 15,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: const Icon(
                                        LineIcons.heartAlt,
                                        size: 18,
                                        color: red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // width: (size.width - 50) / 2,
                          constraints: const BoxConstraints.expand(height: 180),
                          child: Image.asset(
                            homeJson[index]['image'],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: (size.width - 60) / 2,
                      child: Text(
                        homeJson[index]['name'],
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (size.width - 60) / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(
                              fontSize: 20,
                              color: red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 1),
                          Text(
                            homeJson[index]['price'],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: secondary.withOpacity(.5)),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Add To Cart',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}
