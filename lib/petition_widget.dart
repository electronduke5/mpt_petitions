import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PetitionsWidget extends StatelessWidget {
  const PetitionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color:  Color.fromRGBO(235, 235, 235, 1),
      ),
      child: _petitionWidget(),
    );
  }

  Widget _petitionWidget() {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  "Название петиции",
                  style: TextStyle(
                    color: Color.fromRGBO(4, 19, 165, 1),
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                )
              ],
            ),
            Row(
              children:const [
                Text("asdasd", )
              ],
            ),
            Row(),
            Row(),
          ],
        ),
        Column(
          children: [
            SvgPicture.asset("web/icons/IconMPT.svg", height: 70, width: 70),
          ],
        ),
      ],
    );
  }
}
