import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utty_flutter/model/questoes/questao.dart';
import 'package:utty_flutter/model/questoes/questao_manager.dart';
import 'package:utty_flutter/campo_alternativa.dart';

class CardQuestao extends StatefulWidget {
  const CardQuestao({Key? key, required this.questao}) : super(key: key);
  final Questao? questao;

  @override
  State<CardQuestao> createState() => _CardQuestaoState();
}

class _CardQuestaoState extends State<CardQuestao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<QuestaoManager>(
              builder: (_, questaoManager, __) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.grey[500],
                      child: Text(widget.questao!.questao!),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        questaoManager
                            .verificarOutrasAlternativasSelecionadas(1);
                      },
                      child: CampoAlternativa(
                        alternativa: widget.questao!.alternativa1!,
                        selecionado: questaoManager.alternativa1,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        questaoManager
                            .verificarOutrasAlternativasSelecionadas(2);
                      },
                      child: CampoAlternativa(
                        alternativa: widget.questao!.alternativa2!,
                        selecionado: questaoManager.alternativa2,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        questaoManager
                            .verificarOutrasAlternativasSelecionadas(3);
                      },
                      child: CampoAlternativa(
                        alternativa: widget.questao!.alternativa3!,
                        selecionado: questaoManager.alternativa3,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        questaoManager
                            .verificarOutrasAlternativasSelecionadas(4);
                      },
                      child: CampoAlternativa(
                        alternativa: widget.questao!.alternativa4!,
                        selecionado: questaoManager.alternativa4,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        questaoManager.verificarResposta(
                          questaoManager.questaoSelecionada,
                          widget.questao!.numeroResposta!,
                          context,
                        );
                      },
                      child: Text("Confirmar"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        questaoManager.proximaPergunta();
                      },
                      child: Text("Proxima Pergunta"),
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
