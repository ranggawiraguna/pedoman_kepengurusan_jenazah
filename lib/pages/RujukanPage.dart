import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedoman_kepengurusan_jenazah/providers/Rujukan.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/BoxContent.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ContainerPage.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/DecorationPage.dart';

class RujukanPage extends ConsumerWidget {
  final int index;

  const RujukanPage({super.key, this.index = 0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contents = ref.watch(Rujukan);

    return ContainerPage(
      title: "RUJUKAN",
      withHomeButton: true,
      decoration: const DecorationPage(),
      child: BoxContent(
        keyContent: 'rujukan',
        indexContent: index,
        contents: contents,
      ),
    );
  }
}
