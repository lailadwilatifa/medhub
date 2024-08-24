import 'package:flutter/material.dart';
import 'package:medhub/models/onboard_model.dart';
import 'package:medhub/services/navigation_service.dart';
import 'package:medhub/shared/theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _goToNextPage() {
    if (_pageIndex < dataOnboard.length - 1) {
      _pageIndex++;
      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    } else {
      NavigationService().routeToAndRemove('/welcome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                    _pageController.animateToPage(_pageIndex,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn);
                  });
                },
                itemCount: dataOnboard.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnboardContent(
                    image: dataOnboard[index].image,
                    title: dataOnboard[index].title,
                    description: dataOnboard[index].description),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 100, bottom: 30, right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        NavigationService().routeToAndRemove('/welcome');
                      },
                      child: Text(
                        'Skip',
                        style: overpassTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                          color: kNeutral900.withOpacity(0.45),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ...List.generate(
                          dataOnboard.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: _goToNextPage,
                      child: Text(
                        'Next',
                        style: overpassTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                          color: KSuccess,
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardContent(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(image),
        Padding(
          padding:
              const EdgeInsets.only(top: 50, bottom: 16, left: 60, right: 60),
          child: Text(
            title,
            style: overpassTextStyle.copyWith(
                fontSize: 24, color: kNeutral900, fontWeight: bold),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            description,
            style: descTextStyle,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive ? const Color(0xff00A59B) : const Color(0xffC4C4C4),
          shape: BoxShape.circle),
    );
  }
}
