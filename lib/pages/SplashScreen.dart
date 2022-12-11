import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      return () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      };
    }, []);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top +
                      MediaQuery.of(context).size.width * (100 / 1080),
                ),
                child: AspectRatio(
                  aspectRatio: 3721 / 1104,
                  child: Image.asset('assets/CoverTitle.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 3721 / 4885,
                  child: Image.asset('assets/Cover.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FutureSplash {
  FutureSplash._();
  static final instance = FutureSplash._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 7));
  }
}
