// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_shop_app/pages/product_detail_page.dart';
import 'package:e_commerce_shop_app/pages/side_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:line_icons/line_icons.dart';

import 'package:e_commerce_shop_app/dummy/ads_json.dart';
import 'package:e_commerce_shop_app/dummy/home_json.dart';
import 'package:e_commerce_shop_app/theme/colors.dart';
import 'package:e_commerce_shop_app/widgets/custom_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideMenuPage(),
        key: scaffoldKey,
        backgroundColor: primary,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: _getAppBar(),
        ),
        body: _getBody(),
      ),
    );
  }

  Widget _getAppBar() {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: primary,
        leading: IconButton(
          icon: const Icon(AntDesign.menu_fold, color: Colors.black),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: secondary.withOpacity(.5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1566321343730-237ec35e53f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            'Hello Viet,',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Let\' get something',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20),
          const CustomSlider(items: adsJson),
          const SizedBox(height: 20),
          _getCategorySection(),
          const SizedBox(height: 20),
          _getItemLists(),
        ],
      ),
    );
  }

  Widget _getCategorySection() {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            SizedBox(
              width: (size.width - 30) * .7,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    categoryItems.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        height: 30,
                        decoration: pageIndex == index
                            ? const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: secondary,
                                    width: 1.5,
                                  ),
                                ),
                              )
                            : const BoxDecoration(),
                        child: Text(
                          categoryItems[index]['title'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: pageIndex == index
                                ? secondary
                                : secondary.withOpacity(.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: secondary.withOpacity(.1),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(12),
                    topLeft: Radius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      AntDesign.search1,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Search...',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _getItemLists() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: List.generate(
        homeJson.length,
        (index) => Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(
                        name: homeJson[index]['name'],
                        img: homeJson[index]['image'],
                        price: homeJson[index]['price'],
                        rate: homeJson[index]['rate'],
                        colors: homeJson[index]['colors']),
                  ),
                );
              },
              child: FadeIn(
                duration: Duration(milliseconds: index * 1000),
                child: SizedBox(
                  width: (size.width - 50) / 2,
                  height: 220,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 25,
                        child: Container(
                          width: (size.width - 50) / 2,
                          height: 200,
                          decoration: BoxDecoration(
                            color: secondary.withOpacity(.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      LineIcons.shoppingBag,
                                      size: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        child: Container(
                          width: (size.width - 50) / 2,
                          height: 180,
                          child: Image.asset(
                            homeJson[index]['image'],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
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
    );
  }
}
