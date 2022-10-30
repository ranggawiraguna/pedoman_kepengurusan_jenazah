import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedoman_kepengurusan_jenazah/providers/Materi.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ButtonActionContent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoxContent extends HookConsumerWidget {
  final String keyContent;
  final int indexContent;
  final bool withTitle;
  final List<String> contents;

  const BoxContent({
    super.key,
    required this.keyContent,
    required this.indexContent,
    this.withTitle = false,
    required this.contents,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController(initialPage: indexContent);
    final indexPage = useState(indexContent);

    final values = ref.watch(MateriValues);

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
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  transitionBuilder: (child, animation) =>
                                      FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                  child: AutoSizeText(
                                    values.keys
                                            .map((e) => values[e]!['index'])
                                            .contains(indexPage.value)
                                        ? values.values.singleWhere(
                                            (element) =>
                                                element['index'] ==
                                                indexPage.value,
                                          )['title']
                                        : '',
                                    key: ValueKey<int>(indexPage.value),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 1000,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxFontSize: 14,
                                    maxLines: 3,
                                  ),
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
