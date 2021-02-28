import 'package:flutter/material.dart';
import 'package:mytodoapp/template_list_page.dart';
void main() {
  runApp(MyTodoApp());
}


class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上に表示される"debug"ラベルを消す
      debugShowCheckedModeBanner: false,
      // アプリ名
      title: 'My Todo App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // リスト一覧画面を表示
      home: TemplateListPage(),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:mytodoapp/db/database_helper.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SQFlite Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//
//   // database_helper.dartのDataBaseHelperをインスタンス化
//   final dbHelper = DatabaseHelper.instance;
//
//   // 画面作成
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('sqflite'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             RaisedButton(
//               child: Text('insert', style: TextStyle(fontSize: 20),),
//               onPressed: () {_insert();},
//             ),
//             RaisedButton(
//               child: Text('query', style: TextStyle(fontSize: 20),),
//               onPressed: () {_query();},
//             ),
//             RaisedButton(
//               child: Text('update', style: TextStyle(fontSize: 20),),
//               onPressed: () {_update();},
//             ),
//             RaisedButton(
//               child: Text('delete', style: TextStyle(fontSize: 20),),
//               onPressed: () {_delete();},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ボタンが押されたときのメソッド類
//
//   // insertが押されたときのメソッド
//   void _insert() async {
//     Map<String, dynamic> row = {
//       DatabaseHelper.columnName : 'ほげ'
//       // DatabaseHelper.columnAge  : 23
//     };
//     final id = await dbHelper.insert(row);
//     print('inserted row id: $id');
//   }
//
//   // queryが押されたときのメソッド
//   void _query() async {
//     final allRows = await dbHelper.queryAllRows();
//     print('query all rows:');
//     allRows.forEach((row) => row.forEach((key, value) {
//       if (key == 'template_name'){
//         print('$key --- $value');
//       }
//     }),
//     );
//   }
//
//   // updateが押された時のメソッド
//   void _update() async {
//     Map<String, dynamic> row = {
//       DatabaseHelper.columnId   : 1,
//       DatabaseHelper.columnName : 'Mary',
//       DatabaseHelper.columnAge  : 32
//     };
//     final rowsAffected = await dbHelper.update(row);
//     print('updated $rowsAffected row(s)');
//   }
//
//   // deleteが押された時のメソッド
//   void _delete() async {
//     final id = await dbHelper.queryRowCount();
//     final rowsDeleted = await dbHelper.delete(id);
//     print('deleted $rowsDeleted row(s): row $id');
//   }
// }