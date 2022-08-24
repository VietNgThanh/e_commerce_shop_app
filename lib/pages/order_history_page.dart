import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_shop_app/dummy/order_json.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../theme/colors.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int pageIndex = 0;

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
        title: const Text(
          'Order History',
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
                  offset: const Offset(0, 5),
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(height: 10),
          _getTabs(),
          const SizedBox(height: 30),
          pageIndex == 0
              ? _getCurrentOrderItemsList()
              : _getPastOrderItemsList(),
        ],
      ),
    );
  }

  Widget _getTabs() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: secondary.withOpacity(.05),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                child: Container(
                  height: 50,
                  decoration: pageIndex == 0
                      ? BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: secondary.withOpacity(.15),
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            )
                          ],
                        )
                      : const BoxDecoration(),
                  child: Center(
                    child: Text(
                      'Current Orders',
                      style: TextStyle(
                        color: pageIndex == 0
                            ? secondary
                            : secondary.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                child: Container(
                  decoration: pageIndex == 1
                      ? BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: secondary.withOpacity(.15),
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            )
                          ],
                        )
                      : const BoxDecoration(),
                  child: Center(
                    child: Text(
                      'Past Orders',
                      style: TextStyle(
                        color: pageIndex == 1
                            ? secondary
                            : secondary.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getCurrentOrderItemsList() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(
        currentOrderList.length,
        (index) => FadeIn(
          duration: Duration(milliseconds: 300 * (index + 1)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                color: secondary.withOpacity(.05),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currentOrderList[index]['date'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Delivery Processing',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.orangeAccent,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width - 60,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 90,
                                width: 90,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: secondary.withOpacity(.1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Image.asset(
                                        currentOrderList[index]['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentOrderList[index]['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          '\$',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: red,
                                          ),
                                        ),
                                        Text(
                                          currentOrderList[index]['price'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 60,
                                  width: 1,
                                  decoration: BoxDecoration(
                                    color: secondary.withOpacity(.15),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Total Items: 1',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      currentOrderList[index]['time'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: secondary.withOpacity(.5),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPastOrderItemsList() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(
        pastOrderList.length,
        (index) => FadeIn(
          duration: Duration(milliseconds: 300 * (index + 1)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                color: secondary.withOpacity(.05),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pastOrderList[index]['date'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Delivered',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width - 60,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 90,
                                width: 90,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: secondary.withOpacity(.1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Image.asset(
                                        pastOrderList[index]['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pastOrderList[index]['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          '\$',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: red,
                                          ),
                                        ),
                                        Text(
                                          pastOrderList[index]['price'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 60,
                                  width: 1,
                                  decoration: BoxDecoration(
                                    color: secondary.withOpacity(.15),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Total Items: 1',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      pastOrderList[index]['time'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: secondary.withOpacity(.5),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
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
            'Reorder',
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
