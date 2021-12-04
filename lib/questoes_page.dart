import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utty_flutter/model/questoes/questao.dart';
import 'package:utty_flutter/model/questoes/questao_manager.dart';
import 'package:utty_flutter/card_questao.dart';

class QuestoesPage extends StatefulWidget {
  const QuestoesPage({Key? key, this.questoes}) : super(key: key);
  final List<Questao>? questoes;

  @override
  _QuestoesPageState createState() => _QuestoesPageState();
}

class _QuestoesPageState extends State<QuestoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<QuestaoManager>(
      builder: (_, questaoManager, __) {
        return PageView.builder(
          controller: questaoManager.pageController,
          onPageChanged: (index) {
            questaoManager.currentIndex = index;
          },
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.questoes!.length,
          itemBuilder: (context, index) {
            return CardQuestao(
              questao: widget.questoes![index],
              index: index,
              lastPage: widget.questoes!.length,
            );
          },
        );
      },
    ));
  }
}
