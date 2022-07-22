// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_shop_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String img;
  final String price;
  final String rate;
  final List colors;

  const ProductDetailPage({
    Key? key,
    required this.name,
    required this.img,
    required this.price,
    required this.rate,
    required this.colors,
  }) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final sizes = <double>[
    6,
    6.5,
    7,
    7.5,
    8,
    8.5,
    9,
    9.5,
    10,
    10.5,
    11,
    11.5,
  ];
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
    return AppBar(
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
        'Product Detail',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: secondary,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(
                LineIcons.star,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                '${widget.rate} Reviews',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '\$',
                    style: TextStyle(
                      color: red,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.price,
                    style: TextStyle(
                      color: secondary,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                height: 45,
                width: 45,
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
                    LineIcons.heart,
                    size: 23,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeIn(
                child: SizedBox(
                  width: size.width * .25,
                  child: Column(
                    children: List.generate(
                      widget.colors.length,
                      (index) => SizedBox(
                        height: 70,
                        width: 70,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: secondary.withOpacity(.1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                widget.colors[index],
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 350,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            color: secondary.withOpacity(.12),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(120),
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(120),
                              bottomLeft: Radius.circular(40),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: SizedBox(
                          height: 280,
                          child: Image.asset(
                            widget.img,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Sizes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      sizes.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: secondary.withOpacity(.2),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              sizes[index].toString(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'More',
                style: TextStyle(
                  fontSize: 18,
                  color: white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                      color: primary.withOpacity(.3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(Icons.remove),
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: 16,
                              color: white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(Icons.add),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      LineIcons.shoppingBag,
                      size: 18,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
