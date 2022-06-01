import 'package:clone_facebook/day2/stl/custom_decorated.dart';
import 'package:clone_facebook/theme/app_style.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.images,
    required this.height,
    required this.width,
  }) : super(key: key);
  final List images;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.4,
      width: width,
      child: renderImage(images),
    );
  }

  Widget renderImage(List images) {
    switch (images.length) {
      case 1:
        return Image.network(
          images[0],
          fit: BoxFit.cover,
        );
      case 2:
        return Row(
          children: [
            Expanded(
              child: Image.network(
                images[0],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Image.network(
                images[1],
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      case 3:
        return Row(
          children: [
            Expanded(
              child: Image.network(
                images[0],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      images[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Image.network(
                      images[2],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case 4:
        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Image.network(
                      images[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      images[2],
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Image.network(
                      images[3],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Image.network(
                      images[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      images[2],
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          images[3],
                          fit: BoxFit.cover,
                        ),
                        const CustomDecoratedBox(),
                        Center(
                          child: Text(
                            '+${images.length - 4}',
                            style: AppStyle.h4.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
    }
  }
}
