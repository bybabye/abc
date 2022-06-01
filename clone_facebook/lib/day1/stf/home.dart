import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clone_facebook/day2/stf/post_page.dart';
import 'package:clone_facebook/day2/stl/custom_image.dart';
import 'package:clone_facebook/day2/stl/custom_line.dart';

import 'package:clone_facebook/module/get_post.dart';
import 'package:clone_facebook/provider/auth_provider.dart';

import 'package:clone_facebook/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double _sizeH;
  late double _sizeW;
  late AuthencationProvider _auth;

  @override
  Widget build(BuildContext context) {
    _sizeH = MediaQuery.of(context).size.height;
    _sizeW = MediaQuery.of(context).size.width;
    _auth = Provider.of<AuthencationProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            title: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  "facebook",
                  textStyle: AppStyle.h4,
                )
              ],
            ),
            flexibleSpace: Stack(
              children: [
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PostPage(),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(_auth.user.avatar ?? _auth.avatar),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text("What do you think ?? "),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            expandedHeight: 150.0,
            actions: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                FutureBuilder(
                  future: _auth.getPost(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<GetPost>> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error"),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            snapshot.data![index].post.avatar),
                                        radius: 30,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data![index].post.name,
                                            style: AppStyle.h5,
                                          ),
                                          Text("Time")
                                        ],
                                      ),
                                      const Spacer(),
                                      Icon(Icons.ac_unit),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Icon(Icons.ac_unit),
                                    ],
                                  ),
                                ),
                                if (snapshot.data![index].post.bio != "")
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 16,
                                    ),
                                    child: Text(
                                        snapshot.data![index].post.bio ?? ""),
                                  ),
                                // ignore: unrelated_type_equality_checks
                                if (snapshot
                                    .data![index].post.images.isNotEmpty)
                                  CustomImage(
                                    images: snapshot.data![index].post.images,
                                    height: _sizeH,
                                    width: _sizeW,
                                  ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              '${snapshot.data![index].post.likes.length}'),
                                        ],
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Text(
                                              '${snapshot.data![index].comments.length}'),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const Text("Comment")
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              '${snapshot.data![index].share.length}'),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          const Text("Share")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: CustomLine(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.favorite),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text("Like")
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(Icons.comment_rounded),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text("Comments")
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(Icons.share),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text("Share")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
