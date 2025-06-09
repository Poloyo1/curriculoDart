import 'dart:html';
import 'dart:async';


final List<String> secoes = [
  '[1] > Objetivo Profissional: [Enter para continuar]',
  '[2] > Busco minha primeira oportunidade no mercado de trabalho para desenvolver minhas habilidades e contribuir com os objetivos da empresa como aprendiz, estagiário ou banco de talentos.  [Enter para continuar]',
  '[3] > Formação Acadêmica: [Enter para continuar]',
  '[4] > FATEC  Curso: Análise e desenvolvimento de sistemas Em andamento  [Enter para continuar]',
  '[5] > ETEC Curso: Ensino médio / Desenvolvimento de sistemas AMS Ano de conclusão: 2024  [Enter para continuar]',
  '[6] > Habilidades: [Enter para continuar]',
  '[7] > Comunicação; Trabalho em equipe;  Organização; Lógica de programação; PHP, SQL, Python; Pacotes Microsoft (WORD, EXCEL, POWER POINT). [Enter para continuar]'
];
int indexAtual = 0;
DivElement? cursorAtual;
void main() {
   final terminal = querySelector('#terminal');

  window.onKeyDown.listen((KeyboardEvent e) {
    if (e.key == 'Enter') {
      if (indexAtual < secoes.length) {
        _removerCursor(); // remove cursor anterior
        _digitarTexto(secoes[indexAtual], terminal!);
        indexAtual++;
      } else {
        _digitarTexto('> Fim do currículo.', terminal!);
      }
    }
  });
}



Future<void> _digitarTexto(String texto, Element destino) async {
  final linha = ParagraphElement();
  destino.append(linha);

  for (int i = 0; i < texto.length; i++) {
    linha.text = linha.text! + texto[i];
    await Future.delayed(Duration(milliseconds: 40)); // velocidade da digitação
  }
  // Adiciona cursor no fim
  final cursor = SpanElement()
    ..classes.add('cursor')
    ..text = '|';
  linha.append(cursor);
  cursorAtual = cursor as DivElement?;
}

void _removerCursor() {
  cursorAtual?.remove();
  cursorAtual = null;
}