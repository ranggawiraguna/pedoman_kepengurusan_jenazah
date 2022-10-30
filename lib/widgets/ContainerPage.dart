import 'package:flutter/material.dart';
import 'package:pedoman_kepengurusan_jenazah/pages/MainMenu.dart';

class ContainerPage extends StatelessWidget {
  final bool withHomeButton;
  final String title;
  final Widget decoration;
  final Widget child;

  const ContainerPage({
    super.key,
    required this.withHomeButton,
    required this.title,
    required this.decoration,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 3740 / 1003,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset('assets/TitleShape.png'),
                      ),
                      withHomeButton
                          ? Positioned(
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
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: decoration,
                        ),
                        Positioned.fill(
                          child: child,
                        ),
                      ],
                    ),
                  ),
                ),
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
                        child: Center(
                          child: Text(
                            title,
                            style: const TextStyle(
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
