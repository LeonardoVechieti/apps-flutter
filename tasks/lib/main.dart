import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Tasks'),
        ),
        body: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          opacity: opacidade ? 1.0 : 0.0,
          child: ListView(
            children:const [
              Task('Teste de descrição maior que o normal', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3),
              Task('teste','https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 5),
              Task('teste' ,'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 4),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
          child: const Icon(Icons.remove_red_eye),
        )
      ),
    );
  }
}


class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome,this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 1) ? Colors.blue : Colors.blue[100]
                              ),
                              Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 2) ? Colors.blue : Colors.blue[100]
                              ),
                              Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 3) ? Colors.blue : Colors.blue[100]
                              ),
                              Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 4) ? Colors.blue : Colors.blue[100]
                              ),
                              Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 5) ? Colors.blue : Colors.blue[100]
                              ),
                            ],
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        child: const Icon(
                            Icons.arrow_forward
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.grey,
                          value: (widget.dificuldade >0) ? (nivel/widget.dificuldade)/10 : 1,
                          backgroundColor: Colors.white,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Nível: $nivel',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
