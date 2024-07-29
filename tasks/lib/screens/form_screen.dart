import 'package:flutter/material.dart';
import 'package:tasks/data/task_DAO.dart';
import 'package:tasks/data/task_inherited.dart';

import '../components/task.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  //Controllers para os campos de texto
  TextEditingController nomeController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController dificuldadeController = TextEditingController();

  //Chave para o formulário
  final _formKey = GlobalKey<FormState>();

  //Validator
  bool valueValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return false;
    }
    return true;
  }
  bool dificuldadeValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 3,
                ),
                color: Colors.black12,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nomeController,
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Por favor, insira um nome';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome da Tarefa',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Por favor, insira uma url';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: urlController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Url da Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (dificuldadeValidator(value)) {
                          return 'Por favor, insira uma dificuldade';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: dificuldadeController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
            
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        (urlController.text) == '' ? 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large' : urlController.text,
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return const Text(
                              'Imagem não encontrada',
                              textAlign: TextAlign.center,
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
            
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TaskDAO().save(Task(
                          nomeController.text,
                          urlController.text,
                          int.parse(dificuldadeController.text),
                        ));

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Tarefa Adicionada')),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
