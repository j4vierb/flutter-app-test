import 'package:flutter/material.dart';
import 'package:todos_app/app/view/components/h1_title.dart';
import 'package:todos_app/app/view/components/shape.dart';
import 'package:todos_app/app/view/task_list/task_list.dart';
import 'package:url_launcher/link.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri(
      scheme: 'https',
      host: 'docs.flutter.dev',
      path: 'tos/',
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(children: [Shape()]),
            SizedBox(height: 70),
            Image.asset('images/onboarding-image.png', width: 180, height: 168),
            SizedBox(height: 99),
            H1Title('Lista de tareas!'),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const TaskListPage();
                    },
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 40),
            Link(
              uri: toLaunch,
              target: LinkTarget.blank,
              builder: (BuildContext ctx, FollowLink? openLink) {
                return TextButton.icon(
                  onPressed: openLink,
                  label: const Text('Terminos y condiciones', style: TextStyle(color: Colors.white),),
                  icon: const Icon(Icons.open_in_new, color: Colors.white,),
                );
              },
            ),
            SizedBox(height: 80),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [Shape()]),
          ],
        ),
      ),
    );
  }
}
