import 'package:diagnosis_tool/common/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeItemWidget extends StatelessWidget {
  final String icon;
  final String title;
  final onPressed;

  HomeItemWidget(
      {super.key, required this.icon, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Ink(
          height: 72,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    color: const Color(0XFFB7C4D9).withOpacity(0.1))
              ]),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            onTap: () => onPressed(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // SvgPicture.asset("$icon.svg"),
                      Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(title, style: commonStyle())),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset("assets/images/ic_right_arrow.svg"),
                )
              ],
            ),
          )),
    );
  }
}
