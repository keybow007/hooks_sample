import 'package:flutter/material.dart';
import 'package:hooks_sample/home_screen.dart';

/*
* ＜Hooksはわしは普段は使わんが、最低限これだけ抑えときゃええんちゃう？箇条書き＞
* 公式
* https://github.com/rrousselGit/flutter_hooks
*
* 「Hooks」ってそもそも何やねん？（Reactから来た概念らしい）=> 状態管理ができるオブジェクト
* https://medium.com/@dan_abramov/making-sense-of-react-hooks-fdbde8803889
*   Hooks are a new kind of object that manage the life-cycle of a Widget.
*   They exist for one reason: increase the code-sharing between widgets by removing duplicates.
*
* （riverpodの公式での説明）
* https://docs-v2.riverpod.dev/docs/about_hooks
*   Hooks are functions used inside widgets.
*   They are designed as an alternative to StatefulWidgets, to make logic more reusable and composable.
*   ・ProviderはWidgetまたぎで状態の変更伝播が可能
*   ・HooksはWidget内でのみ状態の変更伝播が可能
*    => この使いわけなんじゃね？
*    => ephemeral stateでStatefulWidgetを使わないで済む方法がHooksってことでいいんじゃね？
*    => 何かのインスタンスの状態変更をモニタリングしたい場合に
*         ・Widgetをまたぐ場合（AppState）=> StateNotifierProvider（riverpod）
*         ・Widget内で完結する場合（EphemeralState）=> useState（Hooks）：StatefulWidgetをHooksWidgetに
*           （Consumer的にピンポイントでリビルドさせたい場合はHooksBuilderを使えってことみたい）
*             https://pub.dev/documentation/flutter_hooks/latest/flutter_hooks/HookBuilder-class.html
*    => これによってStatefulWidgetを撲滅させることが１つの目的ではないかと
*
*   基本的にRemiさんもHooksはFlutterLikeではなく奇異に感じると思うので、Flutter初心者に使うことを推奨していない
*     Hooks are completely optional. You do not have to use hooks, especially if you are starting Flutter.
*     They are powerful tools, but not very "Flutter-like".
*     As such, it may make sense to start first with plain Flutter/Riverpod,
*     and come back to hooks once you have a bit more experience.
*
*
* 使い方のルール
* https://github.com/rrousselGit/flutter_hooks/tree/master/packages/flutter_hooks#rules
* */


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
