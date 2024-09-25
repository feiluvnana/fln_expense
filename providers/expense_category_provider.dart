import 'package:flnexpense/services/database/database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getAllExpenseCategoryProvider = StreamProvider<List<ExpenseCategoryData>>((ref) async* {
  yield* ref.watch(dbProvider).expenseCategoryDao.getAll();
});
final getExpenseCategoryByIdProvider =
    StreamProvider.family<ExpenseCategoryData, int>((ref, id) async* {
  yield* ref.watch(dbProvider).expenseCategoryDao.getById(id);
});

final expenseCategoryServiceProvider =
    NotifierProvider<ExpenseCategoryServiceNotifier, void>(ExpenseCategoryServiceNotifier.new);

class ExpenseCategoryServiceNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<void> insert({required dynamic iconData, required String name}) {
    return ref.read(dbProvider).expenseCategoryDao.add(ExpenseCategoryCompanion.insert(
        name: name,
        icon: (iconData as IconData).codePoint,
        iconType: iconData.runtimeType.toString()));
  }

  Future<void> update({required dynamic iconData, required String name, required int oldId}) {
    return ref.read(dbProvider).expenseCategoryDao.put(ExpenseCategoryData(
        id: oldId,
        name: name,
        icon: (iconData as IconData).codePoint,
        iconType: iconData.runtimeType.toString()));
  }

  Future<void> delete(ExpenseCategoryData data) {
    return ref.read(dbProvider).expenseCategoryDao.del(data);
  }
}
