import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IntroHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  final TickerProvider vsync;

  IntroHeaderDelegate({required this.vsync});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    bool headerCollapsed = shrinkOffset >= 255;
    return Container(
      padding: EdgeInsets.only(
        bottom: headerCollapsed ? 16 : 32,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: headerCollapsed || overlapsContent
            ? const [BoxShadow(blurRadius: 20, color: Colors.black12)]
            : [],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _backButton(context),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: headerCollapsed
                  ? _headerSmall(context)
                  : _headerLarge(height: 300 - shrinkOffset),
            ),
          ],
        ),
      ),
    );
  }

  Align _backButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: const Icon(Icons.chevron_left_rounded),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Opps, You need to meditate!"),
            ),
          );
        },
      ),
    );
  }

  Padding _headerSmall(BuildContext context) => Padding(
        key: const Key('Collapsed'),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              height: 60,
              width: 60,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://fitpage.in/wp-content/uploads/2021/05/Article_Banner-1-40.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.play_circle_fill_rounded),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Stress Managment with Yoga",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),
                  const Text("10 Days • 25-30 mins daily"),
                ],
              ),
            ),
          ],
        ),
      );

  Container _headerLarge({required double height}) => Container(
        key: const Key('Expanded'),
        margin: const EdgeInsets.symmetric(horizontal: 32),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        height: height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                'https://fitpage.in/wp-content/uploads/2021/05/Article_Banner-1-40.jpg',
                fit: BoxFit.cover,
              ),
            ),
            if (height > 40)
              Container(
                color: Colors.black38,
                child: Center(
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: const Text("Watch Intro"),
                  ),
                ),
              ),
          ],
        ),
      );

  @override
  double get maxExtent => 420;

  @override
  double get minExtent => 170;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration =>
      FloatingHeaderSnapConfiguration(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
}
