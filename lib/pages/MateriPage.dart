import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedoman_kepengurusan_jenazah/providers/Materi.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/BoxContent.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ContainerPage.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/DecorationPage.dart';

class MateriPage extends HookConsumerWidget {
  final String id;
  final int? index;

  const MateriPage({super.key, this.index, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contents = ref.watch(Materi);
    final values = ref.watch(MateriValues);

    return ContainerPage(
      title: "MATERI",
      withHomeButton: true,
      decoration: const DecorationPage(),
      child: BoxContent(
        keyContent: 'materi',
        indexContent: index ?? values[id]!['index'],
        withTitle: true,
        contents: contents,
      ),
    );
  }
}
