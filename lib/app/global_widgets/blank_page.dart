import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [BlankPage] builds the right platform-dependent page,
/// CupertinoPageScaffold for iOS and Scaffold for Android.
/// By default, the whole screen is made available i.e, without SafeArea widget
/// if [withSafeArea] and [withPadding] are both true,
/// then [appBarTitle] must not be null
class BlankPage extends StatelessWidget {
  final Color? backgroundColor;
  final bool withSafeArea;
  final bool withPadding;

  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Currently visible only if platform.isAndroid.
  /// The iOS visibility isn't done yet because
  /// iOS CupertinoScaffold doesn't have an equivalent
  /// argument as Scaffold.BottomNavigationBar.
  final Widget? bottomNavBar;

  /// To get a platform dependent [appBar], you can use the custom [PlatformAppBar]
  /// or create a widget of type ObstructingPreferredSizeWidget.
  /// Check [PlatformAppBar] for an example on how to achieve the above.
  final ObstructingPreferredSizeWidget? appBar;
  final Widget Function(double pageHeight, double pageWidth) builder;

  const BlankPage(
      {required this.builder,
      this.withPadding = false,
      this.withSafeArea = false,
      this.appBar,
      this.bottomNavBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,

      
      this.backgroundColor = CupertinoColors.systemBackground,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));

    

    if (withSafeArea && withPadding) {
      return _WithPaddingAndSafeArea(
        builder: builder,
        bottomNavBar: bottomNavBar,
        background: backgroundColor,
        appBar: appBar,
      );
    } else if (withSafeArea) {
      return _WithSafeAreaOnly(
          bottomNavBar: bottomNavBar,
          appBar: appBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          background: backgroundColor,
          builder: builder);
    }
    return _WithoutSafeAreaAndPadding(
      builder: builder,
      background: backgroundColor,
    );
  }
}

class _WithoutSafeAreaAndPadding extends StatelessWidget {
  final Color? background;
  final Widget Function(double pageHeight, double pageWidth) builder;
  const _WithoutSafeAreaAndPadding({this.background, required this.builder});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double pageHeight = size.height;
    final double pageWidth = size.width;
    return Platform.isIOS
        ? CupertinoPageScaffold(
            backgroundColor: background,
            resizeToAvoidBottomInset: false,
            child: GestureDetector(
                child: builder(pageHeight, pageWidth),
                onTap: () => WidgetsBinding.instance?.focusManager.primaryFocus
                    ?.unfocus()))
        : Scaffold(
            backgroundColor: background,
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
                child: builder(pageHeight, pageWidth),
                onTap: () => WidgetsBinding.instance?.focusManager.primaryFocus
                    ?.unfocus()));
  }
}

class _WithSafeAreaOnly extends StatelessWidget {
  final Color? background;
  final Widget? bottomNavBar;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final ObstructingPreferredSizeWidget? appBar;
  final Widget Function(double pageHeight, double pageWidth) builder;
  const _WithSafeAreaOnly(
      {this.background,
      this.appBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.bottomNavBar,
      required this.builder});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double pageHeight = size.height;
    final double pageWidth = size.width;
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            backgroundColor: background,
            resizeToAvoidBottomInset: false,
            child: SafeArea(
              child: GestureDetector(
                  child: builder(pageHeight, pageWidth),
                  onTap: () => WidgetsBinding
                      .instance?.focusManager.primaryFocus
                      ?.unfocus()),
            ))
        : Scaffold(
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            appBar: appBar,
            bottomNavigationBar: bottomNavBar,
            backgroundColor: background,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: GestureDetector(
                  child: builder(pageHeight, pageWidth),
                  onTap: () => WidgetsBinding
                      .instance?.focusManager.primaryFocus
                      ?.unfocus()),
            ));
  }
}

class _WithPaddingAndSafeArea extends StatelessWidget {
  final Color? background;
  final Widget? bottomNavBar;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final ObstructingPreferredSizeWidget? appBar;
  final Widget Function(double pageHeight, double pageWidth) builder;
  const _WithPaddingAndSafeArea(
      {this.background,
      this.appBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.bottomNavBar,
      required this.builder});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double pageHeight = size.height;
    final double pageWidth = size.width;

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            backgroundColor: background,
            resizeToAvoidBottomInset: false,
            child: SafeArea(
              child: GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: pageWidth * 0.025),
                    child: builder(pageHeight, pageWidth),
                  ),
                  onTap: () => WidgetsBinding
                      .instance?.focusManager.primaryFocus
                      ?.unfocus()),
            ))
        : Scaffold(
            appBar: appBar,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            bottomNavigationBar: bottomNavBar,
            backgroundColor: background,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: builder(pageHeight, pageWidth),
                  ),
                  onTap: () => WidgetsBinding
                      .instance?.focusManager.primaryFocus
                      ?.unfocus()),
            ));
  }
}
