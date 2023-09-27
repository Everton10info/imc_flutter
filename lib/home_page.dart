import 'package:flutter/material.dart';
import 'package:imc_flutter_dio/controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  final Controller controller;
  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    show();
    super.initState();
  }
  /*   didChangeDependencies() async {
    show();
    setState(() {});
    super.didChangeDependencies();
  } */

  show() {
    widget.controller.showList();
  }

  final nome = TextEditingController();
  final peso = TextEditingController();
  final altura = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Preencha seus dados',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      controller: nome,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                          label: Text('Nome')),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: peso,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                          label: Text('Peso')),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: altura,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                          label: Text('Altrura')),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: _onPressed,
                      child: const Text('Calcular IMC'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(child: Observer(
              builder: (context) {
                return ListView.builder(
                  itemCount: widget.controller.imcList.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (DismissDirection direction) async {
                        widget.controller
                            .delete(widget.controller.imcList[index]);
                        show();
                      },
                      key:
                          Key(widget.controller.imcList[index].nome.toString()),
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                          title: Text(
                            widget.controller.imcList[index].nome ?? '',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                          trailing: Text(
                            widget.controller.imcList[index].classificacao ??
                                '',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    if (peso.text.isEmpty || nome.text.isEmpty || altura.text.isEmpty) return;
    widget.controller.calcularImc(
      nome.text,
      double.parse(peso.text),
      double.parse(altura.text),
    );

    peso.text = '';
    nome.text = '';
    altura.text = '';
    show();
  }
}
