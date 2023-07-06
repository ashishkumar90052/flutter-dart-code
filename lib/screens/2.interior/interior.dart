import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';

import '../../utils/const.dart';
import 'interior_detail.dart';

class Interior extends StatelessWidget {
  const Interior({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.search,
                size: 32,
              )),
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/id/1294339577/photo/young-beautiful-woman.jpg?s=612x612&w=0&k=20&c=v41m_jNzYXQtxrr8lZ9dE8hH3CGWh6HqpieWkdaMAAM='),
              )),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [_topDesigner(), _popularDesign(context)],
      ),
    );
  }
}

Widget _topDesigner() {
  return Column(
    children: [
      const ListTile(
        title: Text('Top Designer',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
        trailing: Icon(Icons.east_rounded),
      ),
      SizedBox(
        height: 170,
        child: ListView.builder(
          itemCount: userList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 42,
                    backgroundImage: NetworkImage(userList[index]['img']),
                  ),
                  h16,
                  Text(userList[index]['name'])
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget _popularDesign(context) {
  return ListView(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: [
      const ListTile(
        title: Text('Popular Design',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
        trailing: Icon(Icons.east_rounded),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InteriorDetails(
                                  image:
                                      'https://stories.site/woodenstreetfurniture/interior-design-ideas-of-2022/assets/1.jpeg',
                                )));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://stories.site/woodenstreetfurniture/interior-design-ideas-of-2022/assets/1.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InteriorDetails(
                                image:
                                    'https://psgroup.in/blog/wp-content/uploads/2022/08/10-tendencias-de-interiores-que-serao-destaque-da-decada.jpg',
                              )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://psgroup.in/blog/wp-content/uploads/2022/08/10-tendencias-de-interiores-que-serao-destaque-da-decada.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InteriorDetails(
                                image:
                                    'https://media.designcafe.com/wp-content/uploads/2023/01/31151510/contemporary-interior-design-ideas-for-your-home.jpg',
                              )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://media.designcafe.com/wp-content/uploads/2023/01/31151510/contemporary-interior-design-ideas-for-your-home.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InteriorDetails(
                                image:
                                    'https://hips.hearstapps.com/hmg-prod/images/screen-shot-2022-06-24-at-9-39-59-am-1656078016.png',
                              )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://hips.hearstapps.com/hmg-prod/images/screen-shot-2022-06-24-at-9-39-59-am-1656078016.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 2,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InteriorDetails(
                                image:
                                    'https://hips.hearstapps.com/hmg-prod/images/screen-shot-2022-06-24-at-9-39-59-am-1656078016.png',
                              )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://hips.hearstapps.com/hmg-prod/images/screen-shot-2022-06-24-at-9-39-59-am-1656078016.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InteriorDetails(
                                image:
                                    'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW50ZXJpb3IlMjBkZXNpZ258ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                              )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW50ZXJpb3IlMjBkZXNpZ258ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InteriorDetails(
                                image:
                                    'https://flyingcdn-98ab332c.b-cdn.net/wp-content/uploads/2022/03/ncr-interior-design.jpg',
                              )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://flyingcdn-98ab332c.b-cdn.net/wp-content/uploads/2022/03/ncr-interior-design.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
