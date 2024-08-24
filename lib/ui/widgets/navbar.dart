import 'package:flutter/material.dart';
import 'package:medhub/shared/theme.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  final bool isNotification;

  const NavBar(
      {super.key,
      required this.pageIndex,
      required this.onTap,
      this.isNotification = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(
            'assets/ic_home.png',
            pageIndex == 0,
            onTap: () => onTap(0),
          ),
          navItem(
            'assets/ic_notification.png',
            pageIndex == 1,
            onTap: () => onTap(1),
            isNotification: true,
          ),
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            child: Image.asset('assets/ic_add.png'),
          ),
          navItem(
            'assets/ic_cart.png',
            pageIndex == 2,
            onTap: () => onTap(2),
          ),
          navItem(
            'assets/ic_profile.png',
            pageIndex == 3,
            onTap: () => onTap(3),
          )
        ],
      ),
    );
  }

  Widget navItem(String icon, bool selected,
      {bool isNotification = false, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: isNotification
          ? SizedBox(
              width: 16,
              height: 19,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Image.asset('assets/ic_ellipse.png')),
                  ImageIcon(
                    AssetImage(icon),
                    color: selected ? KSuccess : kNeutral900.withOpacity(0.45),
                  ),
                ],
              ),
            )
          : ImageIcon(
              AssetImage(icon),
              color: selected ? KSuccess : kNeutral900.withOpacity(0.45),
            ),
    );
  }
}
