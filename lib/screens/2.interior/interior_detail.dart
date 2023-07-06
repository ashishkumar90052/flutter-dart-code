import 'package:flutter/material.dart';
import 'package:flutterdartcode/utils/size_cofig.dart';
import 'package:google_fonts/google_fonts.dart';

class InteriorDetails extends StatefulWidget {
  final String image;
  const InteriorDetails({super.key, required this.image});

  @override
  State<InteriorDetails> createState() => _InteriorDetailsState();
}

class _InteriorDetailsState extends State<InteriorDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: kTransparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: kBlack,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                color: kBlack,
              ))
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
              height: height,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              )),
          Positioned(
              bottom: 0,
              child: Container(
                  height: height * .5,
                  width: 450,
                  decoration: BoxDecoration(
                      color: kWhite, borderRadius: BorderRadius.circular(32)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        h16,
                        Container(
                          width: 160,
                          height: 8.0,
                          decoration: BoxDecoration(
                              color: kBlack12,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        h16,
                        ListTile(
                            title: Text(
                                '10 best Interior ideas for your living room',
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      color: kBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22.0),
                                ))),
                        ListTile(
                          leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/2787341/pexels-photo-2787341.jpeg?cs=srgb&dl=pexels-ali-pazani-2787341.jpg&fm=jpg')),
                          title: Text('Jean -Louis',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: kBlack,
                              ))),
                          subtitle: Text('Interior Designer',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                color: kBlack,
                              ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                              'Interior design is the art and science of enhancing the interior of a building to achieve a healthier and more aesthetically pleasing environment for the people using the space. An interior designer is someone who plans, researches, coordinates, and manages such enhancement projects. Interior design is a multifaceted profession that includes conceptual development, space planning, site inspections, programming, research, communicating with the stakeholders of a project, construction management, and execution of the design.',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      color: kBlack,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                              'The pursuit of effective use of space, user well-being and functional design has contributed to the development of the contemporary interior design profession. The profession of interior design is separate and distinct from the role of interior decorator, a term commonly used in the US; the term is less common in the UK, where the profession of interior design is still unregulated and therefore, strictly speaking, not yet officially a profession.',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      color: kBlack,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))),
                        )
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
