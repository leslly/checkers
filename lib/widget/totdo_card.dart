import 'package:checkers/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({ super.key,
    required this.index,
    required this. item,
  });

  final int index;
  final TodoModel item;

  @override
  Widget build(BuildContext context) {


    return Card(
      // just as the name inplies the widget gives the list tile an
      // elevated floating box look
      child: ListTile(
        leading: CircleAvatar(child: Text('${index + 1}')),
        title: Text(item.title),
        subtitle: Text(item.description),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if(value == 'edit') {
              // edit item
            // navigateEdit(item);
            } else if(value == 'delete') {
              // delete item
              ////deleteById(id);
            }
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text('edit'),
                value: 'edit',
              ),
              PopupMenuItem(
                child: Text('delete'),
                value: 'delete',
              ),
            ];
          },
        ),
      ),
    );
  }
}
