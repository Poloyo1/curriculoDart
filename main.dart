import 'dart:html';
import 'dart:async';


final List<String> secoes = [
  '[1] > Projetos: [Enter para continuar]',
  '[2] > Munduca: Uma Plataforma de Educação Infantil, meu TCC desenvolvido na ETEC utilizando HTML, CSS, PHP, SQL e JavaScript, link para repositório: https://github.com/Poloyo1/MunducaTCC.git. [Enter para continuar]',
  '[3] > Sistema de Agenda com chatBot: Um site que tem como objetivo gerenciar agendamentos feitos através de um bot do WhatsAPP desenvolvido com framework Twilio, JavaScript, PHP e Google API, link para repositório: https://github.com/Poloyo1/Sistema-de-agenda-com-chatBot.git. [Enter para continuar]',
  '[4] > Formação: [Enter para continuar]',
  '[5] > Ensino Superior Tecnólogo Curso de Análise e Desenvolvimento de Sistemas Em Andamento - Fatec de Carapicuíba - Conclusão: dez/26 <br>   > Ensino Médio Técnico Curso de Desenvolvimento de Sistemas    > Concluído - Etec de Carapicuíba - Conclusão: dez/24 [Enter para continuar]',
  '[6] > Conhecimentos: [Enter para continuar]',
  '[7] > Inglês Intermediário, Leitura e Escrita;    - Lógica de programação e construção de algoritmos;   - Desenvolvimento de sites e softwares;   - Linguagens de Programação (Python, JavaScript, PHP);    - Back e Front-end (MySQL, XAMPP, APIs, HTML e CSS);  - Experiências de apresentação e exposição de projetos em eventos; [Enter para continuar]'
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