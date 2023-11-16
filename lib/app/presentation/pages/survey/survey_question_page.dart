import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
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
                  return PopupMenuButton(
                    onSelected: (index) {
                      _pageController.jumpToPage(index);
                    },
                    itemBuilder: (context) {
                      return List.generate(survey.questions!.length, (index) {
                        return PopupMenuItem(
                          value: index,
                          child: Text('Question ${index + 1}'),
                        );
                      });
                    },
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

  Row _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          text: "Back",
          textColor: const Color(0xff1FA0C9),
          onTap: () {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
        CustomButton(
          text: "Back",
          textColor: const Color(0xff1FA0C9),
          onTap: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
