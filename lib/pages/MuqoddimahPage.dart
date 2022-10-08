import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedoman_kepengurusan_jenazah/providers/Muqoddimah.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/BoxContent.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ContainerPage.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/DecorationPage.dart';

class MuqoddimahPage extends ConsumerWidget {
  final int index;

  const MuqoddimahPage({super.key, this.index = 0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contents = ref.watch(Muqoddimah);

    return ContainerPage(
      title: "MUQODDIMAH",
      withHomeButton: true,
      decoration: const DecorationPage(),
      child: BoxContent(
        keyContent: 'muqoddimah',
        indexContent: index,
        contents: contents,
      ),
    );
  }
}
