import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({ super.key,
    required this.index,
    required this. item,
    required this.navigateEdit,
    required this.deleteById,
  });

  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deleteById;

  @override
  Widget build(BuildContext context) {

    final id = item['_id'] as String;

    return Card(
      // just as the name inplies the widget gives the list tile an
      // elevated floating box look
      child: ListTile(
        leading: CircleAvatar(child: Text('${index + 1}')),
        title: Text(item['title']),
        subtitle: Text(item['sub']),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if(value == 'edit') {
              // edit item
             navigateEdit(item);
            } else if(value == 'delete') {
              // delete item
              deleteById(id);
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
