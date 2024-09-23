import 'package:flnexpense/services/database/database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getAllIncomeCategoryProvider = StreamProvider<List<IncomeCategoryData>>((ref) async* {
  yield* ref.watch(dbProvider).incomeCategoryDao.getAll();
});
final getIncomeCategoryByIdProvider =
    StreamProvider.family<IncomeCategoryData, int>((ref, id) async* {
  yield* ref.watch(dbProvider).incomeCategoryDao.getById(id);
});

final incomeCategoryServiceProvider =
    NotifierProvider<IncomeCategoryServiceNotifier, void>(IncomeCategoryServiceNotifier.new);

class IncomeCategoryServiceNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<void> insert({required dynamic iconData, required String name}) {
    return ref.read(dbProvider).incomeCategoryDao.add(IncomeCategoryCompanion.insert(
        name: name,
        icon: (iconData as IconData).codePoint,
        iconType: iconData.runtimeType.toString()));
  }

  Future<void> update({required dynamic iconData, required String name, required int oldId}) {
    return ref.read(dbProvider).incomeCategoryDao.put(IncomeCategoryData(
        id: oldId,
        name: name,
        icon: (iconData as IconData).codePoint,
        iconType: iconData.runtimeType.toString()));
  }

  Future<void> delete(IncomeCategoryData data) {
    return ref.read(dbProvider).incomeCategoryDao.del(data);
  }
}
