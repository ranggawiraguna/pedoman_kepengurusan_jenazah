import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedoman_kepengurusan_jenazah/providers/Author.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ButtonActionContent.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ContainerPage.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/DecorationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorPage extends HookConsumerWidget {
  final int index;

  const AuthorPage({super.key, this.index = 0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contents = ref.watch(Author);
    final controller = usePageController(initialPage: index - 1);
    final indexPage = useState(index);
    final pageView = useState(
      PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (_) async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setInt("author", _);
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
    );

    return ContainerPage(
      title: "AUTHOR",
      withHomeButton: true,
      decoration: const DecorationPage(),
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 52,
                left: 30,
                right: 30,
              ),
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
                  child: pageView.value,
                ),
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
      ),
    );
  }
}
