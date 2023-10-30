import 'package:flutter/material.dart';
import 'package:news_app_cubit/views/wev_view.dart';

Widget buildItemOfNews({required Map mapOneItem, context}) {
  Map listOneItem = mapOneItem;
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              WebViewscreen(uri: listOneItem["url"]),
        ),
      );
    },
    child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: NetworkImage(
                      '${listOneItem["urlToImage"]} ',
                    ),
                    fit: BoxFit.cover,
                    scale: 1),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "title"
                    '${listOneItem["title"]} ',
                    style: const TextStyle(
                      fontSize: 21,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(
                    height: 17,
                  ),
                  //fromat date
                  Text(
                    '${listOneItem["publishedAt"]}',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            )
          ],
        )),
  );
}
