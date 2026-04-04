import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:term_summary/components.dart';
import 'package:term_summary/theme.dart';

void main() => runApp(const MyApp());

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      scrollBehavior: NoGlowScrollBehavior(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollController = ScrollController();

  final _welcomeKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _leadershipKey = GlobalKey();
  final _contactKey = GlobalKey();
  double _welcomeOpacity = 1.0;

  String _activeSection = 'Home';
  bool _navElevated = false;

  final List<ProjectData> _projects = const [
    ProjectData(
      imagePath: 'lib/assets/wbgt.jpg',
      title: 'Solar Powered Wet Bulb Globe Thermometer',
      summary:
          'Modified a WBGT monitor to be charged and powered by solar energy.',
      subtitle:
          'Modified a WBGT monitor to be charged and powered by solar energy.',
      company: '10.023 Designing Energy System',
      strategies: 'Design, CAD, Energy and Power Analysis, User Research',
      timeline: 'May 2025 – Aug 2025',
      toolsUsed: 'Canva, Fusion360, Fritzing',
      fullDescription:
          'FabCat is a smart safety attire checker designed for fabrication lab environments. The project focuses on improving compliance and reducing human error through automated detection and feedback.',
      documentTitles: ['Final Report'],
      documentEmbedUrls: [
        'https://drive.google.com/file/d/1VDEpza7Se055y-VaeX1hjCzBYmgYHcHt/preview'
      ],
      galleryImages: [
        'lib/assets/wbgtopen.jpg',
        'lib/assets/wbgtfront.jpg',
        'lib/assets/wbgtback.jpg',
        'lib/assets/wbgttesting.jpg',
        'lib/assets/wbgtgroup.jpg'
      ],
      galleryImageWidth: 400,
      galleryImageHeight: 225,
    ),
    ProjectData(
      imagePath: 'lib/assets/fabcat.jpg',
      title: 'FabCat',
      summary: 'Smart safety attire checker for the fabrication lab.',
      subtitle:
          'Designed an AI Assisted Camera to identify Personal Protective Equipment (PPE).',
      company: '03.007 Design Thinking and Innovation',
      strategies: 'Design, CAD, Arduino, Python, User Research, Video Editing',
      timeline: 'Jan 2025 – April 2025',
      toolsUsed: 'Canva, Blender, Adobe After Effects',
      fullDescription:
          'FabCat is a smart safety attire checker designed for fabrication lab environments. The project focuses on improving compliance and reducing human error through automated detection and feedback.',
      galleryImages: [
        'lib/assets/fabcat_present1.jpg',
        'lib/assets/fabcat_present2.jpg',
        'lib/assets/fabcat_workshop.jpg',
        'lib/assets/fabcat_esp32.jpg',
        'lib/assets/fabcat_team.jpg',
      ],
      galleryImageWidth: 400,
      galleryImageHeight: 225,
      documentTitles: ['Presentation Slides'],
      documentEmbedUrls: [
        'https://drive.google.com/file/d/1Bb26JtrMVajRe-tut0g1TLNbh0W01H14/preview'
      ],
      highlights: [
        'Won Sustainability Design Prize (Life Cycle Analysis)',
        'Combined hardware, software, and interface design into one system.',
      ],
      youtubeVideoId: 'uq2iyMR6KBA',
    ),
    ProjectData(
      imagePath: 'lib/assets/dtp3cover.jpg',
      title: 'Predicting Youth Interest in Hawker Culture',
      summary:
          'Created a model to predict the number of youths who aspire to become hawkers across different areas in Singapore through multiple linear regression.',
      subtitle:
          'Created a model to predict the number of youths who aspire to become hawkers across different areas in Singapore through multiple linear regression.',
      company: '10.022 Modelling Uncertainty',
      strategies:
          'Data Sourcing and Cleaning, Development of evaluation metric, Building multilinear regression model.',
      timeline: 'July 2025 – Aug 2025',
      toolsUsed: 'Excel, Python, PowerBI',
      fullDescription:
          '''As students who care and are passionate about Singapore culture, we noticed that the sustainability of Singapore's hawker culture has become a serious cause for concern as fewer youths show interest in pursuing hawking as a viable career path. Hence our project emphasises the importance of preserving this iconic feature and culture of our country.

We created a model that seeked to predict the number of youths (15-35 years old) who aspire to become hawkers across different areas in Singapore. By using multiple linear regression, we aim to identify and quantify the relationships between youth interest and various socio-economic and environmental factors. With this model, we hope that it could assist in informing policy decisions and targeted interventions that could help preserve hawker culture in future generations.

Hence, our problem statement is as follows: How might we predict the participation rate of young hawkers with income levels, age, hilliness, and literacy levels to assess the sustainability of hawker culture?''',
      documentTitles: [
        'Final Report',
        'Data Analysis',
        'Why does our project matter?'
      ],
      documentEmbedUrls: [
        'https://drive.google.com/file/d/1_T0LXBQXUlAXcz8rKrWWJ2aq5dFGxw9a/preview',
        'https://drive.google.com/file/d/12Q22PaYezzbuVzOYtLceYV3SQMScxGeQ8kN1FVzLrP8/preview',
        'https://drive.google.com/file/d/1hT_RDFFKfVYx8wSBt08P-5LpFU5jstyZ/preview'
      ],
      highlights: [
        'Shortlisted as Top 8 Best Design Thinking Projects.',
        'Used Regression in Excel to measure correlation of variables.',
        'Considered a large range of metrics to evaluate our model.'
      ],
      galleryImages: ['lib/assets/dtp3.jpg'],
      galleryImageWidth: 400,
      galleryImageHeight: 225,
    ),
    ProjectData(
      imagePath: 'lib/assets/icecream.png',
      title: 'Battle of the Ice Cream Cup',
      summary:
          'A lifecycle analysis comparing different material choices through sustainability evaluation.',
      subtitle:
          'A lifecycle analysis comparing different material choices through sustainability evaluation.',
      company: '10.023 Designing Energy System',
      strategies: 'Design, CAD, Energy and Power Analysis, User Research',
      timeline: 'May 2025 – Aug 2025',
      toolsUsed: 'Canva, Fusion360, Fritzing',
      fullDescription:
          'This project examined the environmental implications of different cup material choices through lifecycle analysis. The work compared trade-offs between sustainability, usability, and production impact.',
      galleryImageWidth: 800,
      galleryImageHeight: 480,
      highlights: [
        'Compared multiple material options.',
        'Evaluated sustainability trade-offs.',
        'Linked design decisions to environmental impact.',
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _handleScroll());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  double _sectionTop(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return double.infinity;
    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return double.infinity;
    final position = box.localToGlobal(Offset.zero);
    return position.dy;
  }

  void _handleScroll() {
    if (!mounted) return;

    final offset =
        _scrollController.hasClients ? _scrollController.offset : 0.0;
    final elevated = offset > 24;

    const double fadeStart = 280;
    const double fadeEnd = 560;

    double welcomeOpacity = 1.0;
    if (offset <= fadeStart) {
      welcomeOpacity = 1.0;
    } else if (offset >= fadeEnd) {
      welcomeOpacity = 0.0;
    } else {
      welcomeOpacity = 1 - ((offset - fadeStart) / (fadeEnd - fadeStart));
    }

    final sectionPositions = <String, double>{
      'Home': _sectionTop(_welcomeKey),
      'About': _sectionTop(_aboutKey),
      'Projects': _sectionTop(_projectsKey),
      'Experience': _sectionTop(_experienceKey),
      'Leadership': _sectionTop(_leadershipKey),
      'Contact': _sectionTop(_contactKey),
    };

    String nearestSection = _activeSection;
    double smallestDistance = double.infinity;

    for (final entry in sectionPositions.entries) {
      final distance = (entry.value - 100).abs();
      if (distance < smallestDistance) {
        smallestDistance = distance;
        nearestSection = entry.key;
      }
    }

    if (elevated != _navElevated ||
        nearestSection != _activeSection ||
        welcomeOpacity != _welcomeOpacity) {
      setState(() {
        _navElevated = elevated;
        _activeSection = nearestSection;
        _welcomeOpacity = welcomeOpacity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 80),
                    Container(key: _welcomeKey),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 120),
                      opacity: _welcomeOpacity,
                      child: Transform.translate(
                        offset: Offset(0, (1 - _welcomeOpacity) * -30),
                        child: _buildWelcomeSection(),
                      ),
                    ),
                    Container(key: _aboutKey),
                    _buildAboutSection(),
                    Container(key: _projectsKey),
                    _buildProjectsSection(),
                    Container(key: _experienceKey),
                    _buildExperienceSection(),
                    Container(key: _leadershipKey),
                    _buildLeadershipSection(),
                    Container(key: _contactKey),
                    _buildFooterSection(),
                  ],
                ),
              ),
            ),
          ),
          _buildNavBar(),
        ],
      ),
    );
  }

  Widget _buildNavBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        bottom: false,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: _navElevated ? AppColors.navSurface : AppColors.background,
            border: Border(
              bottom: BorderSide(
                color: _navElevated
                    ? AppColors.divider.withOpacity(AppOpacity.subtle)
                    : Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Text(
                'Jamie Chia',
                style: AppTextStyles.cardTitle.copyWith(
                  fontSize: 18,
                  color: AppColors.textWhite,
                ),
              ),
              const Spacer(),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  NavButton(
                    'Home',
                    () => _scrollTo(_welcomeKey),
                    isActive: _activeSection == 'Home',
                  ),
                  NavButton(
                    'About',
                    () => _scrollTo(_aboutKey),
                    isActive: _activeSection == 'About',
                  ),
                  NavButton(
                    'Projects',
                    () => _scrollTo(_projectsKey),
                    isActive: _activeSection == 'Projects',
                  ),
                  NavButton(
                    'Experience',
                    () => _scrollTo(_experienceKey),
                    isActive: _activeSection == 'Experience',
                  ),
                  NavButton(
                    'Leadership',
                    () => _scrollTo(_leadershipKey),
                    isActive: _activeSection == 'Leadership',
                  ),
                  NavButton(
                    'Contact',
                    () => _scrollTo(_contactKey),
                    isActive: _activeSection == 'Contact',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return FadeInUp(
      delayMs: 100,
      repeat: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        child: Column(
          children: [
            const HeroBannerImage(
              assetPath: 'lib/assets/welcome_new.png',
              height: 420,
            ),
            const SizedBox(height: 24),
            Text(
              'Hi, I\u2019m Jamie!',
              style: AppTextStyles.sectionTitle.copyWith(
                fontSize: 36,
                color: AppColors.textWhite,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Engineering Systems & Design Student ',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary.withOpacity(0.7),
                    ),
                  ),
                  TextSpan(
                    text: '@ SUTD',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 14,
              runSpacing: 14,
              children: [
                ElevatedButton(
                  onPressed: () => _scrollTo(_projectsKey),
                  style: AppButtonStyles.primaryButton,
                  child: const Text('View Projects'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    html.window.open(
                      'https://drive.google.com/file/d/1dFNboKUrSC80b1R4rKAK2eT_RFc7WORm/view',
                      '_blank',
                    );
                  },
                  icon: const Icon(Icons.description_outlined, size: 18),
                  label: const Text('View Resume'),
                  style: AppButtonStyles.secondaryButton,
                ),
                const EmailButton(
                  toAddress: 'cyzj1234@gmail.com',
                  label: 'Contact Me',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return FadeInUp(
      delayMs: 80,
      repeat: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < AppBreakpoints.mobile;

          final text = Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle('About'),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.md),
                    child: Text(
                      'I\u2019m currently studying Engineering Systems and Design at Singapore University of Technology and Design, with a minor in Computer Science. I plan to specialise in Business Analytics and Operation Research and Supply Chain and Logistics.\n\n'
                      'I\u2019ve always liked working with numbers and figures, and have worked on a few Data Analytic projects such as building models and forecasting. As an engineering student, I enjoy stepping out of my comfort zone and involving myself in miscellaneous projects to learn new skills!\n\n'
                      'Besides academics, I\u2019m passionate about event planning and servant leadership. I care about my community and am interested in projects that make a difference.',
                      style: AppTextStyles.body,
                    ),
                  ),
                ],
              ),
            ),
          );

          final image = Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.md,
                isMobile ? AppSpacing.md : 130,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: const SimpleImageCard(
                assetPath: 'lib/assets/about.jpg',
                height: 400,
              ),
            ),
          );

          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xl),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [text, image],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [text, image],
                  ),
          );
        },
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FadeInUp(
            delayMs: 50,
            repeat: false,
            child: SectionTitle('Projects'),
          ),
          const SizedBox(height: 8),
          for (int i = 0; i < _projects.length; i++)
            FadeInUp(
              key: ValueKey('project_$i'),
              delayMs: 80 * i,
              repeat: false,
              child: ProjectCard(
                project: _projects[i],
                reverse: i.isOdd,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection() {
    return FadeInUp(
      delayMs: 80,
      repeat: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionTitle('Experience'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: ExperienceItem(
                title: 'Private Tuition Teacher @ Genius Mind',
                subtitle: 'Part-time | May 2024 – Mar 2026',
                tasks: [
                  'Taught a total of 4 students across lower and upper secondary Mathematics, English, and University Math.',
                  'Curated personalised notes and practice questions tailored to each student\u2019s needs, contributing to a 30% improvement in final exam results.',
                ],
              ),
            ),
            SizedBox(height: AppSpacing.sm),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: ExperienceItem(
                title: 'Student Mentor @ STEAMunity',
                subtitle: 'Volunteer | Nov 2025 – Feb 2026',
                tasks: [
                  'Mentored a group of 6 students in prototyping, storytelling, and pitching skills.',
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadershipSection() {
    return FadeInUp(
      delayMs: 80,
      repeat: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionTitle('Leadership'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: ExperienceItem(
                title: 'Logistics Director @ SUTD Orientation 2025',
                subtitle: 'Committee Lead | Oct 2024 – May 2025',
                tasks: [
                  'Led a subcommittee of 6 and collaborated with 8 other Directors to plan Orientation for 570 freshmen over an 8-month planning cycle.',
                  'Liaised with the Office of Campus Infrastructure & Facilities and the Office of Student Life to request logistics and book venues.',
                  'Managed acquisition of props and materials for programmes and games.',
                  'Coordinated full set-up and tear-down operations for the event.',
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterSection() {
    return FadeInUp(
      delayMs: 80,
      repeat: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.lg,
          AppSpacing.md,
          AppSpacing.xl,
        ),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 3,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(AppOpacity.medium),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Let\u2019s connect',
              style: AppTextStyles.sectionTitle.copyWith(
                fontSize: 28,
                color: AppColors.textWhite,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 480,
              child: Text(
                'Feel free to reach out through email or any of my socials.',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            const Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                SocialItem(
                  icon: FontAwesomeIcons.instagram,
                  label: 'Instagram',
                  url: 'https://www.instagram.com/jcjamiechia/',
                ),
                SocialItem(
                  icon: FontAwesomeIcons.github,
                  label: 'GitHub',
                  url: 'https://github.com/jcjamiechia',
                ),
                SocialItem(
                  icon: FontAwesomeIcons.linkedin,
                  label: 'LinkedIn',
                  url: 'https://www.linkedin.com/in/jcjamiechia/',
                ),
              ],
            ),
            const SizedBox(height: 20),
            const EmailButton(
              toAddress: 'cyzj1234@gmail.com',
              label: 'Send Email',
            ),
            const SizedBox(height: 32),
            Text(
              '\u00a9 2026 Jamie Chia',
              style: AppTextStyles.cardSubtitle.copyWith(
                color: AppColors.textSecondary.withOpacity(0.4),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
