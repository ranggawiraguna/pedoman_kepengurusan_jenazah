import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedoman_kepengurusan_jenazah/providers/Materi.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/BoxContent.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ContainerPage.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/DecorationPage.dart';

class MateriPage extends ConsumerWidget {
  final int index;

  const MateriPage({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contents = ref.watch(Materi);

    return ContainerPage(
      title: "MATERI",
      withHomeButton: true,
      decoration: const DecorationPage(),
      child: BoxContent(
        keyContent: 'materi',
        indexContent: index,
        contents: contents,
        withTitle: true,
        subTitle:
            'PASAL KEDELAPAN PADA MENYATAKAN TENTANG MAKSUD DAN TUJUAN DARI ZIARAH KUBUR',
      ),
    );
  }
}
