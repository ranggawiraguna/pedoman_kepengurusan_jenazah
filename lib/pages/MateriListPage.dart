import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pedoman_kepengurusan_jenazah/pages/MateriPage.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ButtonMenu.dart';

class MateriListPage extends HookWidget {
  const MateriListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, int> pageList = {
      'A': 1,
      'B': 4,
      'C': 13,
      'D': 17,
      'E': 22,
      'F': 24,
      'G': 26,
      'H': 27,
      'I': 31,
      'J': 33,
      'K': 36,
      'L': 37,
      'M': 39,
      'N': 44,
      'O': 47,
      'P': 53,
      'Q': 60,
    };
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        color: Colors.white,
        child: Stack(
          children: [
            Positioned.fill(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ListView(
                  children: [
                    const AspectRatio(
                      aspectRatio: 3740 / 1000,
                      child: SizedBox.shrink(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          ...pageList.keys
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: ButtonMenu(
                                    imageUrl: "assets/ButtonMateri$e.png",
                                    widthFactor: 1,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => MateriPage(
                                            index: pageList[e]!,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                    const AspectRatio(
                      aspectRatio: 2858 / 325,
                      child: SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 3740 / 1003,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset('assets/TitleShape.png'),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 0),
                            padding: const EdgeInsets.all(5),
                            backgroundColor: Colors.white,
                          ),
                          child: Icon(
                            Icons.home_rounded,
                            color: Colors.grey,
                            size: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox.shrink()),
                AspectRatio(
                  aspectRatio: 2858 / 325,
                  child: Container(
                    color: const Color(0xFFFFC000),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const AspectRatio(aspectRatio: 3740 / 450),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: AspectRatio(
                      aspectRatio: 2000 / 630,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC000),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 5,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "MATERI",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
