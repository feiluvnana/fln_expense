import 'package:flnexpense/common/colors.dart';
import 'package:flnexpense/common/helper.dart';
import 'package:flnexpense/common/text.dart';
import 'package:flnexpense/services/database/database.dart';
import 'package:flnexpense/providers/expense_category_provider.dart';
import 'package:flnexpense/widgets/icon_picker.dart';
import 'package:flnexpense/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpenseCategoryPage extends HookConsumerWidget {
  const ExpenseCategoryPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allExpenseCategory = ref.watch(getAllExpenseCategoryProvider).valueOrNull;

    final isAdding = useState(false);
    final name = useTextEditingController();
    final icon = useState<IconData>(FontAwesomeIcons.circleQuestion);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: Navigator.of(context).pop, icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
          centerTitle: true,
          title: Text(
              "Hạng mục chi tiêu${allExpenseCategory?.isEmpty != false ? "" : " (${allExpenseCategory!.length})"}",
              style: title1)),
      body: Column(
        children: [
          Expanded(
              child: allExpenseCategory?.isEmpty != false && !isAdding.value
                  ? const Center(child: Text("Hãy tạo hạng mục chi tiêu đầu tiên nào."))
                  : ListView(children: [
                      if (isAdding.value)
                        AddCategoryListTile(icon: icon, name: name, isAdding: isAdding),
                      ...?allExpenseCategory?.map((e) => LeadingIconListTile(
                          color: Colors.red,
                          icon: getIconDataFromStr(e.iconType, e.icon),
                          title: Text(e.name, style: title1),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => EditExpenseCategoryDialog(expenseCategory: e));
                          },
                          trailing: IconButton(
                              onPressed: () {
                                ref.read(expenseCategoryServiceProvider.notifier).delete(e);
                              },
                              icon: const FaIcon(FontAwesomeIcons.xmark, color: red100))))
                    ])),
          Padding(
            padding: const EdgeInsets.all(8),
            child: FilledButton(
                onPressed: () {
                  if (!isAdding.value) {
                    isAdding.value = true;
                  } else {
                    ref
                        .read(expenseCategoryServiceProvider.notifier)
                        .insert(iconData: icon.value, name: name.text)
                        .then((_) {
                      icon.value = FontAwesomeIcons.circleQuestion;
                      name.text = "";
                      isAdding.value = false;
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(isAdding.value ? FontAwesomeIcons.check : FontAwesomeIcons.plus, size: 18),
                    const SizedBox(width: 4),
                    Text(isAdding.value ? "Hoàn thành" : "Thêm hạng mục")
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class EditExpenseCategoryDialog extends HookConsumerWidget {
  final ExpenseCategoryData expenseCategory;
  const EditExpenseCategoryDialog({super.key, required this.expenseCategory});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = useTextEditingController(text: expenseCategory.name);
    final focusNode = useFocusNode();
    final icon =
        useState<IconData>(getIconDataFromStr(expenseCategory.iconType, expenseCategory.icon));

    useEffect(() {
      focusNode.requestFocus();
      return null;
    }, []);

    return AlertDialog(
      title: const Text("Chỉnh sửa hạng mục thu nhập", style: title2),
      content: ListTile(
          leading: InkWell(
            onTap: () {
              showDialog<IconData>(context: context, builder: (_) => const IconPickerDialog())
                  .then((val) {
                if (val == null) return;
                icon.value = val;
              });
            },
            child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(12),
                child: Icon(icon.value, color: blue100)),
          ),
          title: TextField(
              focusNode: focusNode,
              controller: name,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintStyle: title1.copyWith(color: Colors.black54),
                  hintText: "Tên hạng mục")),
          trailing: IconButton(
              onPressed: () {
                icon.value = FontAwesomeIcons.circleQuestion;
                name.text = "";
              },
              icon: const Icon(FontAwesomeIcons.xmark, color: red100))),
      actions: [
        TextButton(
            onPressed: () {
              ref
                  .read(expenseCategoryServiceProvider.notifier)
                  .update(iconData: icon.value, name: name.text, oldId: expenseCategory.id)
                  .then((_) {
                if (context.mounted) Navigator.of(context).pop();
              });
            },
            child: const Text("Xác nhận"))
      ],
    );
  }
}
