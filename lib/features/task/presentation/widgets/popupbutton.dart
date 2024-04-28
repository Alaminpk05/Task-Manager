




import 'package:taskmanager/util/export.dart';

class Popupbutton extends StatelessWidget {
  final TaskModel task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;
  const Popupbutton({
    super.key, required this.task, required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.editTaskCallback,
    required this.restoreTaskCallback
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isdel == false
            ? ((context) =>
        [
          PopupMenuItem(
              onTap: editTaskCallback,
              child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                      Icons.edit),
                  label: const Text(
                      'Edit'))),
          PopupMenuItem(
            onTap: likeOrDislikeCallback,
            child: TextButton.icon(
                onPressed: null,
                icon: task.isfav == false
                    ? const Icon(Icons
                    .bookmark_add_outlined)
                    : const Icon(Icons
                    .bookmark_remove),
                label: task.isfav == false
                    ? const Text(
                    'Add to Bookmarks')
                    : const Text(
                    'Remove from Bookmarks')),
          ),
          PopupMenuItem(
              onTap: cancelOrDeleteCallback,
              child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                      Icons.delete),
                  label: const Text(
                      'Delete')))
        ])
            : (context) =>
        [
          PopupMenuItem(
              onTap: restoreTaskCallback,
              child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons
                      .restore_from_trash),
                  label: const Text(
                      'Restore'))),
          PopupMenuItem(
            onTap: cancelOrDeleteCallback,
            child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons
                    .delete_forever),
                label: const Text(
                    'Delete Forever')),
          )
        ]);
  }
}