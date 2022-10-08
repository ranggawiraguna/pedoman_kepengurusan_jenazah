import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ButtonActionContent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoxContent extends HookWidget {
  final String keyContent;
  final int indexContent;
  final String subTitle;
  final bool withTitle;
  final List<String> contents;

  const BoxContent({
    super.key,
    required this.keyContent,
    required this.indexContent,
    required this.contents,
    this.subTitle = "",
    this.withTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final controller = usePageController(initialPage: indexContent);
    final indexPage = useState(indexContent);

    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(
              top: withTitle ? 30 : 40,
              bottom: 52,
              left: 30,
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                withTitle
                    ? Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 13 / 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Center(
                                child: AutoSizeText(
                                  subTitle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 1000,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxFontSize: 100,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                    : const SizedBox.shrink(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFD966),
                            Color(0xFFFFC208),
                            Color(0xFFAB8100),
                          ],
                        ),
                        width: 10,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      color: Colors.white,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller,
                        onPageChanged: (_) async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setInt(keyContent, _);
                        },
                        children: contents
                            .map(
                              (_) => InteractiveViewer(
                                minScale: 1,
                                maxScale: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Center(child: Image.asset(_)),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          child: ButtonActionContent(
            icon: Icons.arrow_back_rounded,
            onPressed: indexPage.value > 0
                ? () {
                    indexPage.value--;
                    controller.animateToPage(
                      indexPage.value,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                : null,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: ButtonActionContent(
            icon: Icons.arrow_forward_rounded,
            onPressed: indexPage.value < contents.length - 1
                ? () {
                    indexPage.value++;
                    controller.animateToPage(
                      indexPage.value,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
