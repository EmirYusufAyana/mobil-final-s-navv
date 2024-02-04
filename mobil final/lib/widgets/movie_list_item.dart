import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String information;
  final GlobalKey backgroundImageKey = GlobalKey();
  MovieListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: responsive.height * 0.01),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Flow(
                delegate: _ParallaxFlowDelegate(
                  backgroundImageKey: backgroundImageKey,
                  scrollable: Scrollable.of(context),
                  listItemContext: context,
                ),
                children: [
                  Image.network(
                    imageUrl,
                    width: double.infinity,
                    key: backgroundImageKey,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.3, 0.5],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: responsive.width * 0.05,
                bottom: responsive.height * 0.02,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      information,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  _ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Bu liste öğesinin görünüm alanı içindeki konumunu hesaplayın.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    // Bu liste öğesinin içindeki yüzde konumunu belirle
    // kaydırılabilir alan.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Arka planın dikey hizalamasını hesapla
    // kaydırma yüzdesine göre.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Arka plan hizalamasını bir piksel ofsetine dönüştürün
    // boyama amaçlı.
    final backgroundSize = (backgroundImageKey.currentContext!.findRenderObject() as RenderBox).size;
    final listItemSize = context.size;
    final childRect = verticalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    // Arka plan rengi
    context.paintChild(
      0,
      transform: Transform.translate(
        offset: Offset(
          0.0,
          childRect.top,
        ),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(_ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
