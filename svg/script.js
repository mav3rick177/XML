var svg;
var svgDoc;

function tictoc(){
   svg = document.getElementById("clock-svg");
   svgDoc = svg.contentDocument;
   now = new Date();
   hour = now.getHours();
   hour = hour % 12;
   min = now.getMinutes();
   sec = now.getSeconds();

   var a1 = (180+(hour+min/60)*30)%360;
   var a2 = (180+min*6)%360;
   var a3 = (180+sec*6)%360;
   
   var hourhand = svgDoc.getElementById("hourhand");
   hourhand.setAttribute("transform","rotate("+(a1)+")");
   var minutehand = svgDoc.getElementById("minutehand");
   minutehand.setAttribute("transform","rotate("+(a2)+")");
   var secondhand = svgDoc.getElementById("secondhand");
   secondhand.setAttribute("transform","rotate("+(a3)+")");
}