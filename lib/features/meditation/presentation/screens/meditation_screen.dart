import 'package:flutter/material.dart';

import '../widgets/intro_header_delegate.dart';
import '../widgets/program_completed_widget.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen>
    with SingleTickerProviderStateMixin {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: IntroHeaderDelegate(vsync: this),
                ),
                _body(context),
              ],
            ),
          ),
          Positioned(
            bottom: 32,
            left: 32,
            right: 32,
            child: ElevatedButton(
              child: const Text("Re-enroll to Program"),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  SliverList _body(BuildContext context) {
    return SliverList.list(
      children: [
        const ProgramCompletedWidget(),
        _aboutSection(context),
        _scheduleSection(context),
      ],
    );
  }

  Widget _scheduleSection(BuildContext context) {
    return _hPadding(
      child: AnimatedSize(
        alignment: Alignment.topCenter,
        duration: const Duration(milliseconds: 200),
        child: Column(
          children: [
            ...List.generate(
              expanded ? 12 : 3,
              (index) => index % 2 == 0
                  ? ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      leading: Checkbox(
                        value: false,
                        onChanged: (newValue) {},
                      ),
                      title: Text(
                        "Asanas, Breath-work, Meditaiton & more",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                      subtitle: const Text("Day 1 • 25 mins"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: index == 0
                            ? const Icon(Icons.play_circle_fill_rounded)
                            : const Icon(Icons.lock),
                      ),
                    )
                  : const Divider(),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: expanded
                  ? TextButton.icon(
                      onPressed: () => setState(() => expanded = false),
                      icon: const Icon(Icons.close),
                      label: const Text("View Less"),
                    )
                  : TextButton.icon(
                      onPressed: () => setState(() => expanded = true),
                      icon: const Icon(Icons.add),
                      label: const Text("View More"),
                    ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _aboutSection(BuildContext context) {
    return _hPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          Text(
            "Stress Management with Yoga",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 8),
          const Text("10 Days • 25-30 mins daily"),
          const SizedBox(height: 8),
          const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          ),
          const SizedBox(height: 32),
          Text(
            "Schedule",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _hPadding({required Widget child}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: child,
      );
}
