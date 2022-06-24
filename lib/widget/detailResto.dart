import 'package:flutter/material.dart';

class detailResto extends StatelessWidget {
  const detailResto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        padding: const EdgeInsets.all(12),
        color: const Color.fromARGB(255, 248, 250, 248),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Icons.watch_later_outlined,
                            color: Color.fromARGB(255, 16, 75, 11)),
                        const Text(
                          "09.00 - 21.00",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 16, 75, 11)),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Color.fromARGB(255, 122, 116, 116),
                    width: 10,
                    thickness: 0.5,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.thumb_up_off_alt,
                                color: Color.fromARGB(255, 16, 75, 11),
                              ),
                            ),
                            Text("50rb+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 16, 75, 11)))
                          ],
                        ),
                        Text(
                          "rating",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Color.fromARGB(255, 122, 116, 116),
                    width: 10,
                    thickness: 0.5,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 2, right: 2),
                          child: Icon(Icons.groups_outlined,
                              color: Color.fromARGB(255, 16, 75, 11)),
                        ),
                        Text(
                          "2-10 orang",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Color.fromARGB(255, 122, 116, 116),
                    width: 10,
                    thickness: 0.5,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Icons.attach_money_rounded,
                            color: Color.fromARGB(255, 16, 75, 11)),
                        const Text(
                          "20rb - 60rb",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
