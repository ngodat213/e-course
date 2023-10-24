import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/cubit/quiz_play_cubit.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({
    super.key,
  });

  Future<Map> loadBrand(String imageName) async {
    Map files = {};
    final Reference file = FirebaseStorage.instance.ref('quiz/$imageName');
    final String fileUrl = await file.getDownloadURL();
    files["url"] = fileUrl;
    files["path"] = file.fullPath;
    return files;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.all(25),
              child: Text(
                state.questions[state.index].question,
                style: TxtStyle.text,
              ),
            ),
            if (state.questions[state.index].imagePath != null)
              FutureBuilder(
                future: loadBrand(state.questions[state.index].imagePath!),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Container();
                  }
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: Dimens.PADDING_SCREEN),
                    child: Image.network(snapshot.data!['url']),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
