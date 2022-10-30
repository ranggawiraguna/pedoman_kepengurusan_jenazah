import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pedoman_kepengurusan_jenazah/pages/AuthorPage.dart';
import 'package:pedoman_kepengurusan_jenazah/pages/MateriListPage.dart';
import 'package:pedoman_kepengurusan_jenazah/pages/MateriPage.dart';
import 'package:pedoman_kepengurusan_jenazah/pages/MuqoddimahPage.dart';
import 'package:pedoman_kepengurusan_jenazah/pages/RujukanPage.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ButtonMenu.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/ContainerPage.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/DecorationMenu.dart';
import 'package:pedoman_kepengurusan_jenazah/widgets/DialogVerification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenu extends HookWidget {
  const MainMenu({super.key});

  void dialogVerificationReading(
      BuildContext context, String key, int lastIndex, List<Widget> directPage,
      {String cancelText = "Mulai Awal"}) {
    if (lastIndex > 0) {
      DialogVerification(
        context: context,
        description:
            "Apakah Anda ingin melanjutkan membaca dari halaman yang terakhir dilihat ?",
        action: [cancelText, "Lanjutkan"],
        actionPressed: [
          (_) async {
            if (key != 'materi') {
              (await SharedPreferences.getInstance()).setInt(key, 0);
            }

            Navigator.pop(_);
            Navigator.push(_, MaterialPageRoute(builder: (_) => directPage[0]));
          },
          (_) async {
            (await SharedPreferences.getInstance()).setInt(key, lastIndex);
            Navigator.pop(_);
            Navigator.push(_, MaterialPageRoute(builder: (_) => directPage[1]));
          }
        ],
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => directPage[0]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ContainerPage(
      title: "MENU UTAMA",
      withHomeButton: false,
      decoration: const DecorationMenu(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonMenu(
              imageUrl: "assets/ButtonMenuA.png",
              onPressed: () async {
                const key = "muqoddimah";
                final lastIndexRead =
                    (await SharedPreferences.getInstance()).getInt(key) ?? 0;

                dialogVerificationReading(
                  context,
                  key,
                  lastIndexRead,
                  [
                    const MuqoddimahPage(),
                    MuqoddimahPage(index: lastIndexRead),
                  ],
                );
              },
            ),
            ButtonMenu(
              imageUrl: "assets/ButtonMenuB.png",
              onPressed: () async {
                const key = "materi";
                final lastIndexRead =
                    (await SharedPreferences.getInstance()).getInt(key) ?? 0;

                dialogVerificationReading(
                  context,
                  key,
                  lastIndexRead,
                  [
                    const MateriListPage(),
                    MateriPage(id: '', index: lastIndexRead),
                  ],
                  cancelText: "Pilih Bab",
                );
              },
            ),
            ButtonMenu(
              imageUrl: "assets/ButtonMenuC.png",
              onPressed: () async {
                const key = "rujukan";
                final lastIndexRead =
                    (await SharedPreferences.getInstance()).getInt(key) ?? 0;

                dialogVerificationReading(
                  context,
                  key,
                  lastIndexRead,
                  [
                    const RujukanPage(),
                    RujukanPage(index: lastIndexRead),
                  ],
                );
              },
            ),
            ButtonMenu(
              imageUrl: "assets/ButtonMenuD.png",
              onPressed: () async {
                const key = "author";
                final lastIndexRead =
                    (await SharedPreferences.getInstance()).getInt(key) ?? 0;

                dialogVerificationReading(
                  context,
                  key,
                  lastIndexRead,
                  [
                    const AuthorPage(),
                    AuthorPage(index: lastIndexRead),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
