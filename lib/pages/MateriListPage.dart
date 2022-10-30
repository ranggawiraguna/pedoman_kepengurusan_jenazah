import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedoman_kepengurusan_jenazah/pages/MainMenu.dart';
import 'package:pedoman_kepengurusan_jenazah/pages/MateriPage.dart';
import 'package:pedoman_kepengurusan_jenazah/providers/Materi.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ButtonMenu.dart';

class MateriListPage extends HookConsumerWidget {
  const MateriListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageList = ref.watch(MateriValues);

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
                                            id: e,
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
                          onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const MainMenu(),
                            ),
                            ModalRoute.withName('/'),
                          ),
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
