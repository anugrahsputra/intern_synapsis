part of 'survey_page.dart';

class ListSurveyView extends StatefulWidget {
  const ListSurveyView({super.key, required this.survey, required this.onTap});

  final SurveyEntity survey;

  final void Function()? onTap;

  @override
  State<ListSurveyView> createState() => _ListSurveyViewState();
}

class _ListSurveyViewState extends State<ListSurveyView> {
  @override
  Widget build(BuildContext context) {
    String createdAtStr = widget.survey.createdAt ?? "Null";
    DateTime createdAt = DateTime.tryParse(createdAtStr) ?? DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy', 'sv').format(createdAt);
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(
          24,
          4,
          24,
          4,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffD9D9D9),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              IconPath.surveyIcon,
            ),
            const Gap(8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.survey.surveyName ?? "Null",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                    )),
                const Gap(8),
                Text("Created At: $formattedDate",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF107C41),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
