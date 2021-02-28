import 'package:flutter/material.dart';
import 'package:mytodoapp/set_works_time_page.dart';
import 'model/templates_model.dart';
import 'model/template_model.dart';
import 'package:mytodoapp/db/database_helper.dart';
class TodoAddPage extends StatefulWidget {

  String template_id;

  TodoAddPage({this.template_id});

  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  // 入力されたテキストをデータとして持つ
  final dbHelper = DatabaseHelper.instance;
  final _formKey = GlobalKey<FormState>();

  List<TemplateModel> TemplateModelLists = [null];
  List<TemplatesModel>template_model_list = [];
  String work_title;
  int _counter = 1;
  var template_name = new TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
      TemplateModelLists.add(null);
    });
  }

  void _insert(String template_name) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : template_name
      // DatabaseHelper.columnAge  : 23
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _insert_task_table(int template_id) async {

    Map<String, dynamic> row = {
      DatabaseHelper.columnId : template_id
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  // データを元に表示するWidget
  @override
  Widget build(BuildContext context) {
    int template_id=int.parse(widget.template_id);
    template_id+=1;

    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _insert(template_name.text);
                  Navigator.of(context).pop();
                }

              },
            ),
          ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          _insert_task_table(template_id);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(64),
      child: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Form(
          key: _formKey,
            child:TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'テンプレート名は必ず入力してください';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'テンプレート名',
              ),
              controller: template_name,
            ),
          ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _counter,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 320.0, maxHeight: 64.0),
                      child: Card(
                        child: ListTile(
                        leading:  Icon(Icons.arrow_downward_outlined),
                          subtitle: Text(TemplateModelLists[index] == null ? "default value":TemplateModelLists[index].works_name),
                          onTap: () async {
                            // "push"で新規画面に遷移
                            // リスト追加画面から渡される値を受け取る
                            final newListText = await Navigator.of(context,).push(
                              MaterialPageRoute(
                                  builder: (context,) => SetWorksTimePage(set_works_index: "${index}")),
                            );
                            if (newListText != null) {
                              // キャンセルした場合は newListText が null となるので注意
                              setState(() {
                                // リスト追加
                                TemplateModelLists.insert(index,newListText[0]);
                                print("TemplateModelLists:${TemplateModelLists}");

                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

    Column(
      children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 320.0, maxHeight: 64.0),
          child: Card(
            child: ListTile(
              leading:  Icon(Icons.arrow_downward_outlined),
              title: Text("ゴール時間を設定"),
              onTap: () {},
            ),
          ),
        ),
      ],
    ),

          ],
        ),
      ),
      ),
    );
  }
}
