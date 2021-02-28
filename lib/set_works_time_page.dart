import 'package:flutter/material.dart';
import 'model/template_model.dart';
class SetWorksTimePage extends StatefulWidget {
   String set_works_index;

   SetWorksTimePage({this.set_works_index});

  @override
  _SetWorksTimePageState createState() => _SetWorksTimePageState();
}

class _SetWorksTimePageState extends State<SetWorksTimePage> {
  List<TemplateModel> TemplateModelLists = [];
  var work_name = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    int numbers=int.parse(widget.set_works_index);

    // print("work_name.text: ${work_name.text}");
    return Scaffold(
      appBar: AppBar(
        title: Text("テンプレート作成"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Scaffold
                .of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
            Navigator.of(context).pop(TemplateModelLists);
          }
          // _addTemplateModelLists(numbers,work_name.text);

        },
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'テンプレート名',
                      ),
                      controller: work_name,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}