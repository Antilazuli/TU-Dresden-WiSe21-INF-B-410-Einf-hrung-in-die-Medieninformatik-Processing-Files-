//------------------Input------------------
//---------------||Color I||---------------
double rBitxxxI = 255; //R
double gBitxxxI = 255; //G
double bBitxxxI = 255; //B

//---------------||Color II||--------------
double rBitxxxII = 255; //R 
double gBitxxxII = 255; //G
double bBitxxxII = 255; //B

//--------------Input_End------------------


double rRGBxxxI, rRGBxxxII;
double gRGBxxxI, gRGBxxxII;
double bRGBxxxI, bRGBxxxII;

double rLxxxI, rLxxxII;
double gLxxxI, gLxxxII;
double bLxxxI, bLxxxII;

double lUMxxxI, lUMxxxII;
double tX;

println("----------------------------------Farbe 1----------------------------------");
println("");

rRGBxxxI = rBitxxxI / 255;
println("[R]sRGB => "+(int)rBitxxxI+" / 255 = "+rRGBxxxI);
gRGBxxxI = gBitxxxI / 255;
println("[G]sRGB => "+(int)gBitxxxI+" / 255 = "+gRGBxxxI);
bRGBxxxI = bBitxxxI / 255;
println("[B]sRGB => "+(int)bBitxxxI+" / 255 = "+bRGBxxxI);

println("");

if(rRGBxxxI <= 0.03928){
  rLxxxI = rRGBxxxI / 12.92;
}
else{
  rLxxxI = Math.pow((rRGBxxxI + 0.055) / 1.055, 2.4);
}
print("R = "+rLxxxI);
if(rLxxxI == 0){println(" | 8E-04 laut Folie");}
else{println("");}

if(gRGBxxxI <= 0.03928){
  gLxxxI = gRGBxxxI / 12.92;
}
else{
  gLxxxI = Math.pow((gRGBxxxI + 0.055) / 1.055, 2.4);
}
print("G = "+gLxxxI);
if(gLxxxI == 0){println(" | 8E-04 laut Folie");}
else{println("");}

if(bRGBxxxI <= 0.03928){
  bLxxxI = bRGBxxxI / 12.92;
}
else{
  bLxxxI = Math.pow((bRGBxxxI + 0.055) / 1.055, 2.4);
}
print("B = "+bLxxxI);
if(bLxxxI == 0){println(" | 8E-04 laut Folie");}
else{println("");}

println("");

lUMxxxI = 0.2126 * rLxxxI + 0.7152 * gLxxxI + 0.0722 * bLxxxI;
println("L => 0,2126 * R + 0,7152 * G + 0,0722 * B = "+lUMxxxI);

println("");
println("----------------------------------Farbe 2----------------------------------");
println("");

rRGBxxxII = rBitxxxII / 255;
println("[R]sRGB => "+(int)rBitxxxII+" / 255 = "+rRGBxxxII);
gRGBxxxII = gBitxxxII / 255;
println("[G]sRGB => "+(int)gBitxxxII+" / 255 = "+gRGBxxxII);
bRGBxxxII = bBitxxxII / 255;
println("[B]sRGB => "+(int)bBitxxxII+" / 255 = "+bRGBxxxII);

println("");

if(rRGBxxxII <= 0.03928){
  rLxxxII = rRGBxxxII / 12.92;
}
else{
  rLxxxII = Math.pow((rRGBxxxII + 0.055) / 1.055, 2.4);
}
print("R = "+rLxxxII);
if(rLxxxII == 0){println(" | 8E-04 laut Folie");}
else{println("");}

if(gRGBxxxII <= 0.03928){
  gLxxxII = gRGBxxxII / 12.92;
}
else{
  gLxxxII = Math.pow((gRGBxxxII + 0.055) / 1.055, 2.4);
}
print("G = "+gLxxxII);
if(gLxxxII == 0){println(" | 8E-04 laut Folie");}
else{println("");}

if(bRGBxxxII <= 0.03928){
  bLxxxII = bRGBxxxII / 12.92;
}
else{
  bLxxxII = Math.pow((bRGBxxxII + 0.055) / 1.055, 2.4);
}
print("B = "+bLxxxII);
if(bLxxxII == 0){println(" | 8E-04 laut Folie");}
else{println("");}

println("");

lUMxxxII = 0.2126 * rLxxxII + 0.7152 * gLxxxII + 0.0722 * bLxxxII;
println("L => 0,2126 * R + 0,7152 * G + 0,0722 * B = "+lUMxxxII);

println("");
println("---------------------------------------------------------------------------");
println("");

tX = (lUMxxxI + 0.05) / (lUMxxxII + 0.05);

println("t = (L1+0,05)/(L2+0,05");
println("");
println("Der Kontrast ist beträgt ("+lUMxxxI+" + 0,05)/("+lUMxxxII+"+0,05) = "+tX);

if(tX < 3){
  println("und ist >> nicht ausreichend <<");
}
else{
  println("und ist >> ausreichend <<");
}

println("");
println("siehe auch:");
println("");
println("                t=4,5   für normale und kleine Schrift (14 pt) für Level AA nach WCAG 2.0");
println("                t=3     für große oder fette Schrift (18pt bzw. 14 pt fett) für Level AA nach WCAG 2.0 und nach y [ISO-9241-3] sowie [ANSI-HFES-100-1988]");
println("                t=7     für normale und kleine Schrift (14 pt) für Level AAA nach WCAG 2.0");
println("");
println("                Hintergrund: t=3 wurde empirisch auf Basis von Lesetests von Texten ermittelt und durch Erfahrungen von Experten auf Sehbehinderte erweitert (Heuristik)");
