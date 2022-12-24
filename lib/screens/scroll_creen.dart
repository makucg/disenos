import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.5],
            colors: [Color(0xff5EE8C5), Color(0xff30BAD6)],
          ),
        ),
        child: PageView(
          allowImplicitScrolling: false,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: pageController,
          children: [
            _Page1(pageController: pageController),
            const _Page2(),
          ],
        ),
      ),
    );
  }
}

class _Page1 extends StatelessWidget {
  const _Page1({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _BackgroundColor(),
        const _BackgroundImage(),
        _Texts(pageController: pageController),
      ],
    );
  }
}

class _BackgroundColor extends StatelessWidget {
  const _BackgroundColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xff30BAD6),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Texts extends StatelessWidget {
  const _Texts({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold);

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text('11°', style: textStyle),
          const Text('Miércoles', style: textStyle),
          Expanded(child: Container()),
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 70,
              color: Colors.white,
            ),
            onPressed: () {
              pageController.nextPage(duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
            },
          ),
        ],
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  const _Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xff30BAD6),
      child: Center(
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child:
                Text('Bienvenidos', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
