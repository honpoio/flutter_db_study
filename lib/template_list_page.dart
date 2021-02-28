import 'package:flutter/material.dart';
import 'package:mytodoapp/todo_add_page.dart';
import 'model/templates_model.dart';
import 'package:mytodoapp/db/database_helper.dart';
class TemplateListPage extends StatefulWidget {
  @override
  _TemplateListPageState createState() => _TemplateListPageState();
}

class _TemplateListPageState extends State<TemplateListPage> {
  // Todoリストのデータ
  List todoList = [];
  List<TemplatesModel>template_model_list= [];

  final dbHelper = DatabaseHelper.instance;

  void _query() async {
    this.todoList =[];
    //配列を初期化
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    setState(() {
      allRows.forEach((row) => row.forEach((key, value) {

        if (key == 'template_name') {
          print('$key --- $value');
          this.todoList.add(value);
          print(this.todoList);
        }
      }),
      );
    });

  }
  @override
  void initState() {
    super.initState();
      _query();
  }

  @override
  Widget build(BuildContext context) {

    print("weight buid");
    return Scaffold(
      // AppBarを表示し、タイトルも設定
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      // データを元にListViewを作成
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index] == null ? "default value":todoList[index]),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newList = await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context,) => TodoAddPage(template_id: "${todoList.length}")),
          );
          _query();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
