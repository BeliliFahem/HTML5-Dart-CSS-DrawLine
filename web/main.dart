import 'dart:html';

ElementList<DivElement> drawDivs;

void main() {
  drawDivs = querySelectorAll('div.drawDiv');
  drawDivs.forEach((input) => drawArc(input));
}

void drawArc(DivElement div) {
  var index = drawDivs.indexOf(div) + 1;
  
  // new canvas path
  CanvasElement canvasPath = new CanvasElement(width: 400, height: 300);
  div.append(canvasPath);
  CanvasRenderingContext2D canvasCtx = canvasPath.getContext('2d');

  
  List<int> clickPositions = new List();
  // manage click event on main divElt
  div.onClick.listen((MouseEvent e) {
    e.preventDefault();
   
    clickPositions.add(e.page.x - div.offsetLeft);
    clickPositions.add(e.page.y - div.offsetTop);

    print('$index :  $clickPositions');
    if (clickPositions.length >= 4) {
      canvasCtx.lineWidth = 2;
      canvasCtx.beginPath();
      canvasCtx.moveTo(clickPositions[0], clickPositions[1]);
      canvasCtx.lineTo(clickPositions[2], clickPositions[3]);
      canvasCtx.stroke();
      clickPositions.clear();
    } else {
//    canvasCtx.clearRect(0, 0, 200, 200);
    }
  });
}
