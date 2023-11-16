part of 'survey_question_page.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({super.key, required this.question, required this.survey});

  final QuestionEntity question;
  final SurveyEntity survey;

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    final inputType = widget.question.inputType;
    return Column(
      children: [
        BuildQuestion(
          surveyName: widget.survey.surveyName!,
          questionName: widget.question.questionName!,
        ),
        const Divider(
          thickness: 10,
          color: Color(0xffEEF6F9),
        ),
        if (inputType == InputType.radioButton) ...[
          BuildAnswer(question: widget.question),
        ] else ...[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Answer',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                const Gap(12),
                const TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Tulis Jawabanmu disini",
                  ),
                ),
              ],
            ),
          ),
        ]
      ],
    );
  }
}

class BuildQuestion extends StatelessWidget {
  const BuildQuestion(
      {super.key, required this.surveyName, required this.questionName});
  final String surveyName;
  final String questionName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            surveyName,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(10),
          Text(
            questionName,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xff6D6D6D),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildAnswer extends StatefulWidget {
  const BuildAnswer({super.key, required this.question});

  final QuestionEntity question;

  @override
  State<BuildAnswer> createState() => _BuildAnswerState();
}

class _BuildAnswerState extends State<BuildAnswer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Answer',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
          const Gap(12),
          ...widget.question.options!.map((option) {
            return Row(
              children: [
                Radio(
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: option.optionName!,
                  groupValue: widget.question.id,
                  onChanged: (value) {
                    log(value!);
                    setState(() {
                      widget.question.id = value;
                    });
                  },
                ),
                const Gap(8),
                Text(
                  option.optionName!,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff1FA0C9),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          "45 Seconds Left",
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: const Color(0xff1FA0C9),
          ),
        ),
      ),
    );
  }
}
