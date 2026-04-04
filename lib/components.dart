import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:term_summary/theme.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AppSpacing {
  static const double sm = 12;
  static const double md = 24;
  static const double lg = 36;
  static const double xl = 56;
}

class AppRadius {
  static const double sm = 10;
  static const double md = 16;
  static const double lg = 24;
  static const double pill = 999;
}

// ─── Animation Components ─────────────────────────────────────────────

class FadeInUp extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double offsetY;
  final int delayMs;
  final double visibleFraction;
  final bool repeat;

  const FadeInUp({
    required this.child,
    this.duration = const Duration(milliseconds: 700),
    this.offsetY = 24,
    this.delayMs = 0,
    this.visibleFraction = 0.12,
    this.repeat = false,
    super.key,
  });

  @override
  State<FadeInUp> createState() => _FadeInUpState();
}

class _FadeInUpState extends State<FadeInUp> {
  bool _isVisible = false;
  bool _hasAnimatedOnce = false;
  bool _waiting = false;

  Future<void> _handleVisibility(bool visible) async {
    if (!mounted) return;

    if (visible) {
      if (!widget.repeat && _hasAnimatedOnce) return;
      if (_isVisible || _waiting) return;

      _waiting = true;
      if (widget.delayMs > 0) {
        await Future.delayed(Duration(milliseconds: widget.delayMs));
      }
      _waiting = false;

      if (!mounted) return;
      setState(() {
        _isVisible = true;
        _hasAnimatedOnce = true;
      });
    } else {
      if (widget.repeat && _isVisible) {
        setState(() {
          _isVisible = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final detectorKey = Key(
      'fade-${widget.key?.toString() ?? identityHashCode(this)}',
    );

    return VisibilityDetector(
      key: detectorKey,
      onVisibilityChanged: (info) {
        final visible = info.visibleFraction > widget.visibleFraction;
        _handleVisibility(visible);
      },
      child: AnimatedOpacity(
        opacity: _isVisible ? 1 : 0,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: widget.offsetY,
            end: _isVisible ? 0 : widget.offsetY,
          ),
          duration: widget.duration,
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, value),
              child: child,
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}

class HoverLift extends StatefulWidget {
  final Widget child;
  final double lift;
  final Duration duration;
  final BorderRadius? borderRadius;
  final bool showGlow;

  const HoverLift({
    required this.child,
    this.lift = 6,
    this.duration = const Duration(milliseconds: 220),
    this.borderRadius,
    this.showGlow = false,
    super.key,
  });

  @override
  State<HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: widget.duration,
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovering ? -widget.lift : 0, 0),
        decoration: widget.showGlow
            ? BoxDecoration(
                borderRadius:
                    widget.borderRadius ?? BorderRadius.circular(AppRadius.md),
                boxShadow: _hovering
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.10),
                          blurRadius: 32,
                          offset: const Offset(0, 12),
                        ),
                      ]
                    : [],
              )
            : null,
        child: widget.child,
      ),
    );
  }
}

// ─── Section Components ───────────────────────────────────────────────

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.md,
        right: AppSpacing.md,
        top: AppSpacing.xl,
        bottom: AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.sectionTitle),
          const SizedBox(height: 10),
          Container(
            width: 48,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const NavButton(
    this.label,
    this.onTap, {
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary.withOpacity(0.12)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: isActive
              ? AppColors.primary.withOpacity(0.4)
              : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: isActive ? AppColors.textWhite : AppColors.textSecondary,
          textStyle: AppTextStyles.navLabel.copyWith(
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

// ─── Image Components ─────────────────────────────────────────────────

class HeroBannerImage extends StatelessWidget {
  final String assetPath;
  final double height;

  const HeroBannerImage({
    required this.assetPath,
    this.height = 420,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            assetPath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 140,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.background.withOpacity(0.85),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleImageCard extends StatelessWidget {
  final String assetPath;
  final double height;

  const SimpleImageCard({
    required this.assetPath,
    this.height = 260,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: AppColors.divider.withOpacity(AppOpacity.subtle),
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}

// ─── Experience ───────────────────────────────────────────────────────

class ExperienceItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> tasks;

  const ExperienceItem({
    required this.title,
    required this.subtitle,
    required this.tasks,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: AppColors.divider.withOpacity(AppOpacity.subtle),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.cardTitle),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: AppTextStyles.cardSubtitle.copyWith(
              color: AppColors.primary.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 14),
          ...tasks.map(
            (task) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(task, style: AppTextStyles.body),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Project Data ─────────────────────────────────────────────────────

class ProjectData {
  final String imagePath;
  final String title;
  final String summary;
  final String fullDescription;

  final String? subtitle;
  final String? company;
  final String? strategies;
  final String? timeline;
  final String? toolsUsed;
  final String? note;

  final List<String> keyFeatures;
  final List<String> highlights;
  final List<String> galleryImages;

  final double galleryImageWidth;
  final double galleryImageHeight;

  final String? linkLabel;
  final String? linkUrl;
  final String? youtubeVideoId;

  final List<String> documentEmbedUrls;
  final List<String> documentTitles;

  const ProjectData({
    required this.imagePath,
    required this.title,
    required this.summary,
    required this.fullDescription,
    this.subtitle,
    this.company,
    this.strategies,
    this.timeline,
    this.toolsUsed,
    this.note,
    this.keyFeatures = const [],
    this.highlights = const [],
    this.galleryImages = const [],
    this.galleryImageWidth = 300,
    this.galleryImageHeight = 190,
    this.linkLabel,
    this.linkUrl,
    this.youtubeVideoId,
    this.documentEmbedUrls = const [],
    this.documentTitles = const [],
  });
}

// ─── Project Card (list view) ─────────────────────────────────────────

class ProjectCard extends StatelessWidget {
  final ProjectData project;
  final bool reverse;

  const ProjectCard({
    required this.project,
    this.reverse = false,
    super.key,
  });

  void _openProjectPage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProjectDetailPage(project: project),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.04),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              )),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  Widget _buildCardShell({required Widget child}) {
    return HoverLift(
      showGlow: true,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: AppColors.divider.withOpacity(AppOpacity.subtle),
            width: 1,
          ),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < AppBreakpoints.mobile;

        final imageSection = ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              project.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        );

        final textSection = Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(project.title, style: AppTextStyles.cardTitle),
              const SizedBox(height: 10),
              Text(
                project.summary,
                style: AppTextStyles.body,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              if ((project.toolsUsed ?? '').trim().isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  project.toolsUsed!,
                  style: AppTextStyles.toolsLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 14),
              Row(
                children: [
                  Text(
                    'View Details',
                    style: AppTextStyles.cardSubtitle.copyWith(
                      color: AppColors.secondaryAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 14,
                    color: AppColors.secondaryAccent,
                  ),
                ],
              ),
            ],
          ),
        );

        final card = GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => _openProjectPage(context),
          child: _buildCardShell(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        imageSection,
                        textSection,
                      ],
                    )
                  : IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: reverse
                            ? [
                                Expanded(flex: 4, child: textSection),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(flex: 5, child: imageSection),
                              ]
                            : [
                                Expanded(flex: 5, child: imageSection),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(flex: 4, child: textSection),
                              ],
                      ),
                    ),
            ),
          ),
        );

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: card,
        );
      },
    );
  }
}

// ─── Project Detail Page (full page) ──────────────────────────────────

class ProjectDetailPage extends StatelessWidget {
  final ProjectData project;

  const ProjectDetailPage({required this.project, super.key});

  void _openImagePreview(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(24),
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 4.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  child: Image.asset(imagePath, fit: BoxFit.contain),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetaItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: AppTextStyles.metaLabel),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.metaValue),
      ],
    );
  }

  Widget _buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(item, style: AppTextStyles.body)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Wrap with keyboard shortcut so ESC pops the page
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.escape): () {
          Navigator.of(context).pop();
        },
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius:
                                    BorderRadius.circular(AppRadius.pill),
                                border: Border.all(
                                  color: AppColors.divider
                                      .withOpacity(AppOpacity.subtle),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.arrow_back_rounded,
                                      size: 16,
                                      color: AppColors.textSecondary),
                                  const SizedBox(width: 6),
                                  Text('Back',
                                      style: AppTextStyles.navLabel.copyWith(
                                          color: AppColors.textSecondary)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Hero image
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        child: Image.asset(
                          project.imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 280,
                        ),
                      ),
                    ),

                    // Content
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 28, 24, 56),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(project.title, style: AppTextStyles.dialogTitle),

                          if ((project.subtitle ?? '').trim().isNotEmpty) ...[
                            const SizedBox(height: 10),
                            Text(
                              project.subtitle!,
                              style: AppTextStyles.body.copyWith(fontSize: 17),
                            ),
                          ],

                          const SizedBox(height: 24),
                          _buildMetadataSection(),

                          const SizedBox(height: 28),
                          Text(project.fullDescription,
                              style: AppTextStyles.body),

                          if ((project.note ?? '').trim().isNotEmpty) ...[
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius:
                                    BorderRadius.circular(AppRadius.sm),
                                border: Border.all(
                                  color: AppColors.primary
                                      .withOpacity(AppOpacity.light),
                                ),
                              ),
                              child: Text(
                                project.note!,
                                style: AppTextStyles.body
                                    .copyWith(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],

                          if (project.keyFeatures.isNotEmpty) ...[
                            const SizedBox(height: 36),
                            Text('Key Features',
                                style: AppTextStyles.dialogSectionTitle),
                            const SizedBox(height: 14),
                            _buildBulletList(project.keyFeatures),
                          ],

                          if (project.youtubeVideoId != null &&
                              project.youtubeVideoId!.trim().isNotEmpty) ...[
                            const SizedBox(height: 36),
                            Text('Video',
                                style: AppTextStyles.dialogSectionTitle),
                            const SizedBox(height: 14),
                            YouTubeEmbed(
                              videoId: project.youtubeVideoId!,
                              height: 420,
                            ),
                          ],

                          if (project.highlights.isNotEmpty) ...[
                            const SizedBox(height: 36),
                            Text('Highlights',
                                style: AppTextStyles.dialogSectionTitle),
                            const SizedBox(height: 14),
                            _buildBulletList(project.highlights),
                          ],

                          if (project.documentEmbedUrls.isNotEmpty) ...[
                            const SizedBox(height: 36),
                            Text('Documents',
                                style: AppTextStyles.dialogSectionTitle),
                            const SizedBox(height: 16),
                            ...List.generate(
                                project.documentEmbedUrls.length, (index) {
                              final title =
                                  index < project.documentTitles.length
                                      ? project.documentTitles[index]
                                      : 'Document ${index + 1}';
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 28),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style:
                                          AppTextStyles.cardSubtitle.copyWith(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    WebEmbedFrame(
                                      url:
                                          project.documentEmbedUrls[index],
                                      height: 420,
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],

                          if (project.galleryImages.isNotEmpty) ...[
                            const SizedBox(height: 36),
                            Text('Gallery',
                                style: AppTextStyles.dialogSectionTitle),
                            const SizedBox(height: 14),
                            _GalleryWithArrows(
                              images: project.galleryImages,
                              imageWidth: project.galleryImageWidth,
                              imageHeight: project.galleryImageHeight,
                              onImageTap: (path) =>
                                  _openImagePreview(context, path),
                            ),
                          ],

                          if (project.linkLabel != null &&
                              project.linkUrl != null) ...[
                            const SizedBox(height: 36),
                            OutlinedButton.icon(
                              onPressed: () {
                                html.window
                                    .open(project.linkUrl!, '_blank');
                              },
                              icon:
                                  const Icon(Icons.open_in_new, size: 16),
                              label: Text(project.linkLabel!),
                              style: AppButtonStyles.secondaryButton,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetadataSection() {
    final pairs = <MapEntry<String, String>>[];

    if ((project.company ?? '').trim().isNotEmpty) {
      pairs.add(MapEntry('Module', project.company!));
    }
    if ((project.timeline ?? '').trim().isNotEmpty) {
      pairs.add(MapEntry('Timeline', project.timeline!));
    }
    if ((project.strategies ?? '').trim().isNotEmpty) {
      pairs.add(MapEntry('Strategies', project.strategies!));
    }
    if ((project.toolsUsed ?? '').trim().isNotEmpty) {
      pairs.add(MapEntry('Tools', project.toolsUsed!));
    }

    if (pairs.isEmpty) return const SizedBox.shrink();

    // Build rows of 2 items each
    final rows = <Widget>[];
    for (int i = 0; i < pairs.length; i += 2) {
      final left = Expanded(child: _buildMetaItem(pairs[i].key, pairs[i].value));
      final right = i + 1 < pairs.length
          ? Expanded(child: _buildMetaItem(pairs[i + 1].key, pairs[i + 1].value))
          : const Expanded(child: SizedBox.shrink());
      rows.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [left, const SizedBox(width: 32), right],
      ));
      if (i + 2 < pairs.length) rows.add(const SizedBox(height: 18));
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: AppColors.divider.withOpacity(AppOpacity.subtle),
        ),
      ),
      child: Column(children: rows),
    );
  }
}

// ─── Gallery with Arrow Buttons ───────────────────────────────────────

class _GalleryWithArrows extends StatefulWidget {
  final List<String> images;
  final double imageWidth;
  final double imageHeight;
  final void Function(String path) onImageTap;

  const _GalleryWithArrows({
    required this.images,
    required this.imageWidth,
    required this.imageHeight,
    required this.onImageTap,
  });

  @override
  State<_GalleryWithArrows> createState() => _GalleryWithArrowsState();
}

class _GalleryWithArrowsState extends State<_GalleryWithArrows> {
  final _scrollController = ScrollController();

  void _scrollBy(double amount) {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      (_scrollController.offset + amount).clamp(
        0.0,
        _scrollController.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.imageHeight,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.hardEdge,
            itemCount: widget.images.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final path = widget.images[index];
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => widget.onImageTap(path),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    child: Image.asset(
                      path,
                      fit: BoxFit.cover,
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (widget.images.length > 1) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              _GalleryArrow(
                icon: Icons.chevron_left_rounded,
                onTap: () => _scrollBy(-widget.imageWidth - 12),
              ),
              const SizedBox(width: 8),
              _GalleryArrow(
                icon: Icons.chevron_right_rounded,
                onTap: () => _scrollBy(widget.imageWidth + 12),
              ),
              const SizedBox(width: 12),
              Text(
                '${widget.images.length} photos',
                style: AppTextStyles.cardSubtitle.copyWith(
                  color: AppColors.textSecondary.withOpacity(0.6),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _GalleryArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _GalleryArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.background.withOpacity(0.85),
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.divider.withOpacity(AppOpacity.light),
            ),
          ),
          child: Icon(icon, color: AppColors.textWhite, size: 22),
        ),
      ),
    );
  }
}

// ─── Embeds ───────────────────────────────────────────────────────────

class YouTubeEmbed extends StatelessWidget {
  final String videoId;
  final double height;

  const YouTubeEmbed({
    required this.videoId,
    this.height = 400,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewType = 'youtube-embed-$videoId';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
      final iframe = html.IFrameElement()
        ..src = 'https://www.youtube.com/embed/$videoId'
        ..style.border = 'none'
        ..allow =
            'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture'
        ..allowFullscreen = true;
      return iframe;
    });

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: HtmlElementView(viewType: viewType),
      ),
    );
  }
}

class WebEmbedFrame extends StatelessWidget {
  final String url;
  final double height;

  const WebEmbedFrame({
    required this.url,
    this.height = 520,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewType = 'embed-${url.hashCode}-${height.hashCode}';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
      final iframe = html.IFrameElement()
        ..src = url
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..allowFullscreen = true;
      return iframe;
    });

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: HtmlElementView(viewType: viewType),
      ),
    );
  }
}

// ─── Footer Components ────────────────────────────────────────────────

class SocialItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const SocialItem({
    required this.icon,
    required this.label,
    required this.url,
    super.key,
  });

  void _launch() {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launch,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(
            color: AppColors.divider.withOpacity(AppOpacity.subtle),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, color: AppColors.primary, size: 16),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.navLabel.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailButton extends StatelessWidget {
  final String toAddress;
  final String label;

  const EmailButton({
    required this.toAddress,
    required this.label,
    super.key,
  });

  void _sendEmail() {
    final mailto = 'mailto:$toAddress';
    html.window.open(mailto, '_self');
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _sendEmail,
      style: AppButtonStyles.secondaryButton,
      child: Text(label),
    );
  }
}
