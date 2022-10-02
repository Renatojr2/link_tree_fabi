import 'dart:math';

import 'package:fabilink/repository/social_repository.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/social_model.dart';
import 'components/link_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _openUrl(String value) async {
    await launchUrl(Uri.parse(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Bem-vindos!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('assets/image/fabi.jpeg'),
              ),
              const SizedBox(height: 15),
              const Text(
                'Olá, maravilhosa! Se você chegou até aqui, é porque deseja por mais informações. Abaixo estão todos os links para entrar em contato comigo. Beijinhos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Expanded(
                child: FutureBuilder<List<SocialModel>>(
                    future: SocialLinkRepository.getJson(),
                    builder: (context, snapShot) {
                      if (snapShot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          itemCount: snapShot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: LinkButton(
                                text: snapShot.data![index].socialName,
                                onTap: () {
                                  _openUrl(snapShot.data![index].sociallink);
                                },
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 255, 179, 0),
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    var path = Path();

    double degToRad(num deg) => deg * (pi / 180.0);

    path.addArc(Rect.fromLTWH(10, 0, size.width, size.height * 0.9),
        degToRad(200), degToRad(45000));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
