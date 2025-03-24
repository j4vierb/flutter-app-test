import 'package:flutter/material.dart';

class Spash extends StatelessWidget {
  const Spash({super.key});

  @override
  Widget build(BuildContext context) {
    // retorna una pantalla
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Hola', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            ),
            
            // Image(image: AssetImage("htsd.png"), width: 350),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('images/htsd.png', width: 350, fit: BoxFit.fill),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('h1'),
                Text('h2'),
                Text('h3'),
                Text('h4'),
              ],
            ),
            SizedBox(height: 40),
            Container(  
              width: 100,
              height: 60,
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text('Botón', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
