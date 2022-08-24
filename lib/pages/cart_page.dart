import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_shop_app/dummy/my_cart_json.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../theme/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
          'Cart',
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
              LineIcons.shoppingBag,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getCartList(),
          const SizedBox(height: 20),
          _getPromotionCode(),
          const SizedBox(height: 20),
          _getSummary(),
        ],
      ),
    );
  }

  Widget _getCartList() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(
        myCartJson.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: FadeIn(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  width: (size.width - 30) * 0.7,
                  child: Row(
                    children: [
                      SizedBox(
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
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: secondary.withOpacity(.2),
                                  ),
                                  color: secondary.withOpacity(.1),
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(myCartJson[index]['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myCartJson[index]['name'],
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
                                    color: red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  myCartJson[index]['price'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.close,
                            size: 15,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(LineIcons.minusSquare),
                            Text(
                              '1',
                              style: TextStyle(fontSize: 14),
                            ),
                            Icon(LineIcons.plusSquare),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPromotionCode() {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: secondary.withOpacity(.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: secondary.withOpacity(.3),
        ),
      ),
      child: Row(
        children: [
          const Expanded(
            child: SizedBox(
              height: 55,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  cursorColor: secondary,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Promo Code',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              height: 55,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: secondary,
              ),
              child: const Center(
                child: Text(
                  'Apply',
                  style: TextStyle(
                    color: white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Subtotal',
              style: TextStyle(
                fontSize: 16,
                color: secondary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 2),
            Text(
                '(${myCartJson.length} ${myCartJson.length <= 1 ? 'item' : 'items'})'),
            const Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '\$600',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            const Text(
              'Delivery charge',
              style: TextStyle(
                fontSize: 16,
                color: secondary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 2),
            Text(
                '(${myCartJson.length} ${myCartJson.length <= 1 ? 'item' : 'items'})'),
            const Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Free',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontSize: 16,
                color: secondary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 2),
            Text(
                '(${myCartJson.length} ${myCartJson.length <= 1 ? 'item' : 'items'})'),
            const Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '\$600',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
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
            'Proceed to checkout',
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
