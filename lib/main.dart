import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    if (kDebugMode) {
      print(count);
    }
  }

  void increment() {
    setState(() {
      count++;
    });
    if (kDebugMode) {
      print(count);
    }
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 97, 97),
      // drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contador de Pessoas'),
        backgroundColor: const Color.fromARGB(255, 0, 255, 242),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/sorvetes.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                isFull ? 'Lotado' : 'Pode Entrar !',
                style: TextStyle(
                  fontSize: 35,
                  color: isFull ? Colors.red : const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: isFull ? Colors.red : Colors.white,
                  fontSize: 60,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: isEmpty ? null : decrement,
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 35), //usado para afastar os botões
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: isFull ? null : increment,
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
