import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_shop_app/dummy/side_menu_json.dart';
import 'package:e_commerce_shop_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SideMenuPage extends StatefulWidget {
  const SideMenuPage({Key? key}) : super(key: key);

  @override
  State<SideMenuPage> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _getHeader(),
          _getBody(),
          _getFooter(),
        ],
      ),
    );
  }

  Widget _getHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      height: 160,
      child: DrawerHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1566321343730-237ec35e53f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Hey,',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Viet',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getBody() {
    return Column(
      children: List.generate(sideMenuItems.length, (index) {
        if (sideMenuItems[index]['selected']) {
          return FadeInLeft(
            duration: Duration(milliseconds: index * 100 + 200),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: white,
                  border: Border.all(
                    color: secondary.withOpacity(.05),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: secondary.withOpacity(.03),
                      blurRadius: 2.5,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: ListTile(
                  minLeadingWidth: 10,
                  leading: Icon(
                    sideMenuItems[index]['icon'],
                    color: secondary,
                  ),
                  title: Text(
                    sideMenuItems[index]['label'],
                    style: TextStyle(
                      fontSize: 16,
                      color: secondary,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => sideMenuItems[index]['page'],
                      ),
                      (route) => false,
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return FadeInLeft(
            duration: Duration(milliseconds: index * 100 + 200),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: ListTile(
                minLeadingWidth: 10,
                leading: Icon(
                  sideMenuItems[index]['icon'],
                  color: secondary,
                ),
                title: Text(
                  sideMenuItems[index]['label'],
                  style: TextStyle(
                    fontSize: 16,
                    color: secondary,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => sideMenuItems[index]['page'],
                      ),
                      (route) => false);
                },
              ),
            ),
          );
        }
      }),
    );
  }

  Widget _getFooter() {
    return Column(
      children: [
        Divider(),
        FadeInLeft(
          duration: Duration(milliseconds: sideMenuItems.length * 100 + 200),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ListTile(
              minLeadingWidth: 10,
              leading: const Icon(
                LineIcons.alternateSignOut,
                color: secondary,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  color: secondary,
                ),
              ),
              onTap: () {},
            ),
          ),
        )
      ],
    );
  }
}
