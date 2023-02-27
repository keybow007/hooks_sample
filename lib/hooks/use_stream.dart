import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStreamHooksScreen extends StatelessWidget {
  const UseStreamHooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("[UseStreamHooksScreen] buildメソッド走ってるで〜");
    return Scaffold(
      appBar: AppBar(
        title: const Text('useStream example'),
      ),
      body: Center(
        // In this example, the Text Widget is the only portion that needs to
        // rebuild when the Stream changes. Therefore, use a HookBuilder
        // Widget to limit rebuilds to this section of the app, rather than
        // marking the entire UseStreamExample as a HookWidget!
        child: HookBuilder(
          builder: (context) {
            print("[UseStreamHooksScreen] HookBuilder内が再描画されてるで〜");
            // First, create and cache a Stream with the `useMemoized` hook.
            // This hook allows you to create an Object (such as a Stream or
            // Future) the first time this builder function is invoked without
            // recreating it on each subsequent build!
            final stream = useMemoized(
              () {
                return Stream<int>.periodic(const Duration(seconds: 1), (i) {
                  return i++;
                });
              },
            );
            // Next, invoke the `useStream` hook to listen for updates to the
            // Stream. This triggers a rebuild whenever a new value is emitted.
            //
            // Like normal StreamBuilders, it returns the current AsyncSnapshot.
            final snapshot = useStream(stream, initialData: 0);

            // Finally, use the data from the Stream to render a text Widget.
            // If no data is available, fallback to a default value.
            return Text(
              '${snapshot.data ?? 0}',
              style: const TextStyle(fontSize: 36),
            );
          },
        ),
      ),
    );
  }
}
