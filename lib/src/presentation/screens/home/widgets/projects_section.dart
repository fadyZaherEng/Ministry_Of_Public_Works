// ignore_for_file: deprecated_member_use

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectsSection extends StatelessWidget {
  final Home home;

  const ProjectsSection({
    Key? key,
    required this.home,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).projects,
          style: Theme.of(context).textTheme.headline3?.copyWith(
                fontWeight: semiBold,
              ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorSchema.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      spreadRadius: 0,
                      blurRadius: 24,
                      color: ColorSchema.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Center(
                  child: Wrap(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImagePaths.tendering,
                            width: 42,
                            height: 42,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "${home.numberofTenderingPhaseProjectsCount}",
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      letterSpacing: -0.36,
                                    ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            S.of(context).tendering,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      letterSpacing: -0.26,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorSchema.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      spreadRadius: 0,
                      blurRadius: 24,
                      color: ColorSchema.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Center(
                  child: Wrap(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImagePaths.design,
                            width: 42,
                            height: 42,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "${home.numberofConsultancyServicePhaseProjectsCount}",
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      letterSpacing: -0.36,
                                    ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            S.of(context).design,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      letterSpacing: -0.26,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorSchema.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      spreadRadius: 0,
                      blurRadius: 24,
                      color: ColorSchema.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Center(
                  child: Wrap(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImagePaths.execution,
                            width: 42,
                            height: 42,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "${home.numberofExecutionPhaseProjectsCount}",
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      letterSpacing: -0.36,
                                    ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            S.of(context).execution,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      letterSpacing: -0.26,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
          ],
        )
      ],
    );
  }
}
