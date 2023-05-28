// semua proses post, get, update maupun delete berada di file ini

import 'package:dio/dio.dart';
import 'package:flutter_todolist_app_habiskerja/model/todo_item.dart';

class NetworkManager {
  late final Dio _dio;
  final baseUrl = 'https://1b48-2001-448a-40ab-1ade-594b-642b-d91b-3847.ngrok-free.app';
  NetworkManager() {
    _dio = Dio();
  }

  Future<List<TodoItem>> getTodoIsDone(bool isDone) async{
    final result = await _dio.get(
      '$baseUrl/todos?isDone=$isDone',
    );
    return (result.data as List).map((e) => TodoItem.fromMap(e)).toList();
  }

  Future<TodoItem> postData(TodoItem item) async{
    final result = await _dio.post(
      '$baseUrl/todos',
      data: item.toMap(),
    );
    return TodoItem.fromMap(result.data);
  }

  Future<TodoItem> updateData(TodoItem item) async{
    final result = await _dio.put(
      '$baseUrl/todos/${item.id}',
      data: item.toMap(),
    );
    return TodoItem.fromMap(result.data);
  }

  Future<void> deleteData(TodoItem item) async{
    await _dio.delete(
      '$baseUrl/todos/${item.id}',
    );
  }

}