import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../../injection.dart';
import '../../presentation.dart';

part 'survey_question_page.component.dart';

class SurveyQuestionPage extends StatefulWidget {
  const SurveyQuestionPage({super.key, required this.surveyId});

  final String surveyId;

  @override
  State<SurveyQuestionPage> createState() => _SurveyQuestionPageState();
}

class _SurveyQuestionPageState extends State<SurveyQuestionPage> {
  late PageController _pageController;
  int _currentPage = 0;
  final AppNavigator navigate = sl<AppNavigator>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    context.read<SurveyCubit>().getQuestion(widget.surveyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const TimerView(),
        actions: [
          BlocBuilder<SurveyCubit, SurveyState>(
            builder: (context, state) {
              return state.maybeWhen(
                surveyLoaded: (survey) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xff121212),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(children: [
                      const Icon(
                        Icons.list_alt_outlined,
                        color: Colors.white,
                      ),
                      const Gap(4),
                      Text(
                        '${_currentPage + 1}/${survey.questions!.length}',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )
                    ]),
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<SurveyCubit, SurveyState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            allSurveyLoaded: (_) => const SizedBox.shrink(),
            surveyLoaded: (survey) {
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: survey.questions?.length,
                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        QuestionEntity? question = survey.questions?[index];
                        return QuestionView(
                          question: question!,
                          survey: survey,
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 2,
                          child: CustomButton(
                            text: "Back",
                            textColor: const Color(0xff1FA0C9),
                            onTap: () {
                              if (_currentPage <= 0) {
                                Navigator.of(context).pop();
                              }
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                        const Gap(16),
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 3,
                          child: CustomButton(
                            text: "Next",
                            textColor: const Color(0xffffffff),
                            color: const Color(0xff1FA0C9),
                            onTap: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            error: (message) => Text(message),
          );
        },
      ),
    );
  }
}
