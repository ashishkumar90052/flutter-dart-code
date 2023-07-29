import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdartcode/utils/const.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';

class ContextMenuExample extends StatelessWidget {
  const ContextMenuExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:
          const CupertinoNavigationBar(middle: Text('Cupertino Context Menu')),
      child: GridView.builder(
        physics: const ScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: ctxList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: shape8,
            child: SizedBox(
              width: 100,
              height: 100,
              child: CupertinoContextMenu(
                actions: <Widget>[
                  CupertinoContextMenuAction(
                    onPressed: () => Navigator.pop(context),
                    trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                    child: const Text('Copy'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () => Navigator.pop(context),
                    trailingIcon: CupertinoIcons.share,
                    child: const Text('Share'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () => Navigator.pop(context),
                    trailingIcon: CupertinoIcons.heart,
                    child: const Text('Favorite'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () => Navigator.pop(context),
                    isDestructiveAction: true,
                    trailingIcon: CupertinoIcons.delete,
                    child: const Text('Delete'),
                  ),
                ],
                child: Container(
                  color: CupertinoColors.black,
                  child: Image.network(
                    ctxList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
