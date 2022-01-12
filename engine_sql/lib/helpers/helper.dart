class WritingHelper {
  final StringBuffer buf;
  WritingHelper(this.buf);

  curlyBrackets(
    String beforText, [
    Function()? writeIt,
    bool endIt = false,
  ]) {
    buf.writeln('');
    buf.writeln('$beforText {');
    if (writeIt != null) writeIt();
    buf.writeln('}${endIt ? ";" : ""}');
    buf.writeln('');
  }

  squareBrackets(
    String beforText, [
    Function()? writeIt,
    bool endIt = false,
  ]) {
    buf.writeln('');
    buf.writeln('$beforText [');
    if (writeIt != null) writeIt();
    buf.writeln(']${endIt ? ";" : ""}');
    buf.writeln('');
  }
}
