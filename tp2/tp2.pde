PFont miTexto, miTexto2, miTexto3, miTexto4, miTexto5, miTexto6, miTexto7;
PImage img, img2, img3, img4, img5, img6, img7;

// animación diapo 1
float posX = 640;
float targetX = -800;
float speed = 3;

// diapo 2 fade in
float alpha = 0;
float fadeSpeed = 2;
float alpha5 = 0;
float alpha6 = 0;

// control y tiempo de diapos
int estado = 0;
int tiempoEspera = 180;

// diapo 3 texto sube
float posY3 = 600;
float targetY3 = 200;
float subidaSpeed = 2;

// diapo 4 texto baja
float posY4 = -100;
float targetY4 = 400;
float bajadaSpeed = 2;

// diapo 6 texto desde la izquierda
float texto6PosX = -500;
float texto6TargetX = 30;
float texto6Speed = 3;

// diapo 7 tamaño de texto
float textSizeFinal = 36;
float currentTextSize = 10;

// botón final
boolean mostrarBoton = false;

void setup() {
  size(640, 480);

  // imágenes
  img = loadImage("imagen 1.jpg");
  img2 = loadImage("Imagen 2.jpg");
  img3 = loadImage("imagen 3.jpg");
  img4 = loadImage("imgaen 4 .jpg");
  img5 = loadImage("Imagen 5.jpg");
  img6 = loadImage("imagen 6.jpg");
  img7 = loadImage("imagen 7.jpg");

  // textos
  miTexto = loadFont("FranklinGothic-DemiItalic-48.vlw");
  miTexto2 = loadFont("FranklinGothic-DemiItalic-48.vlw");
  miTexto3 = loadFont("FranklinGothic-DemiItalic-48.vlw");
  miTexto4 = loadFont("FranklinGothic-DemiItalic-48.vlw");
  miTexto5 = loadFont("FranklinGothic-DemiItalic-48.vlw");
  miTexto6 = loadFont("FranklinGothic-DemiItalic-48.vlw");
  miTexto7 = loadFont("FranklinGothic-DemiItalic-48.vlw");

  textAlign(LEFT, CENTER);
}

void draw() {
  background(0);

  // DIAPOSITIVA 1
  if (estado == 0) {
    image(img, 0, 0, width, height);
    textFont(miTexto);
    textSize(80);
    fill(255);
    text("Los Supercampeones", posX, 30);
    posX -= speed;

    if (posX <= targetX) {
      estado = 1;
    }
  }

  // DIAPOSITIVA 2
  else if (estado == 1) {
    image(img2, 0, 0, width, height);
    textFont(miTexto2);
    textSize(30);

    if (alpha < 255) {
      alpha += fadeSpeed;
    } else {
      tiempoEspera--;
      if (tiempoEspera <= 0) {
        estado = 2;
        tiempoEspera = 180;
      }
    }

    fill(8, 3, 3, alpha);
    text("Historia centrada en Tsubasa Ozora\nun niño prodigio del fútbol", 60, 300);
    text("que sueña con ser campeón\ndel mundo con Japón.", 60, 380);
  }

  // DIAPOSITIVA 3
  else if (estado == 2) {
    image(img3, 0, 0, width, height);
    textFont(miTexto3);
    textSize(30);
    fill(#030101);

    posY3 -= subidaSpeed;
    text("Talentoso, apasionado por el fútbol\ncon una gran visión de juego\ny espíritu de equipo", 30, posY3);

    if (posY3 + 250 < 0) {
      estado = 3;
      tiempoEspera = 180;
    }
  }

  // DIAPOSITIVA 4
  else if (estado == 3) {
    image(img4, 0, 0, width, height);
    textFont(miTexto4);
    textSize(30);
    fill(#030101);

    if (posY4 < targetY4) {
      posY4 += bajadaSpeed;
    } else {
      tiempoEspera--;
      if (tiempoEspera <= 0) {
        estado = 4;
        alpha5 = 0;
        tiempoEspera = 180;
      }
    }

    text("Tsubasa se muda a Nankatsu\ny comienza a destacar\n en su nuevo equipo escolar\nenfrentando a grandes rivales", 30, posY4);
  }

  // DIAPOSITIVA 5
  else if (estado == 4) {
    image(img5, 0, 0, width, height);
    textFont(miTexto5);
    textSize(30);

    if (alpha5 < 255) {
      alpha5 += fadeSpeed;
    } else {
      tiempoEspera--;
      if (tiempoEspera <= 0) {
        estado = 5;
        alpha6 = 0;
        tiempoEspera = 180;
      }
    }

    fill(#FFE0E0, alpha5);
    text("Los personajes realizan jugadas espectaculares y fantasiosas\ncomo el Tiro del Tigre o el Tiro Gemelo", 5, 80);
  }

  // DIAPOSITIVA 6 texto desde la izquierda
  else if (estado == 5) {
    image(img6, 0, 0, width, height);
    textFont(miTexto6);
    textSize(30);

    if (alpha6 < 255) {
      alpha6 += fadeSpeed;
    } else {
      tiempoEspera--;
      if (tiempoEspera <= 0) {
        estado = 6;
        currentTextSize = 10;
        mostrarBoton = false;
      }
    }

    if (texto6PosX < texto6TargetX) {
      texto6PosX += texto6Speed;
    }

    fill(#030101, alpha6);
    text("El anime resalta valores como la amistad,\nel esfuerzo,\nel trabajo en equipo\ny la perseverancia", texto6PosX, 80);
  }

  // DIAPOSITIVA 7
  else if (estado == 6) {
    image(img7, 0, 0, width, height);
    textFont(miTexto7);

    if (currentTextSize < textSizeFinal) {
      currentTextSize += 0.2;
    } else {
      mostrarBoton = true;
    }

    textSize(currentTextSize);
    fill(#DCDCF2);
    text("Los Supercampeones inspiró\n a generaciones\n de futbolistas,\nha tenido varias versiones\n y sigue siendo un ícono\n del anime deportivo", 30, 350);

    // Botón de reinicio
    if (mostrarBoton) {
      fill(255);
      rect(450, 400, 150, 40, 10);
      fill(0);
      textSize(18);
      text("Reiniciar", 470, 420);
    }
  }
}

void mousePressed() {
  if (estado == 6 && mostrarBoton) {
    if (mouseX >= 450 && mouseX <= 600 && mouseY >= 400 && mouseY <= 440) {
      // Reiniciar todo
      estado = 0;
      posX = 640;
      alpha = 0;
      alpha5 = 0;
      alpha6 = 0;
      posY3 = 600;
      posY4 = -100;
      texto6PosX = -500;
      tiempoEspera = 180;
      currentTextSize = 10;
      mostrarBoton = false;
    }
  }
} //fin
