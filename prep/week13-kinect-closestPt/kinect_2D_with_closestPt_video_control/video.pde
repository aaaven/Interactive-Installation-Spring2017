import processing.video.*;
Movie movie_0, movie_1;
boolean check = false;

void setupVideo() {
  movie_0 = new Movie(this, "1.mp4");
  movie_0.loop();

  movie_1 = new Movie(this, "2.mp4");
  movie_1.loop();
}

void drawVideo() {
  //if (movie.available() == true) {
  //  movie.read();
  //}
  if (check) {
    image(movie_0, 0, 0, width, height);
  } else {
    image(movie_1, 0, 0, width, height);
  }
}

void videoControl(int dis, int setDis) {

  if (dis > setDis) {
    check = false;
    movie_1.play();
    movie_0.pause();
  } else {
    check = true;
    movie_0.play();
    movie_1.pause();
  }
}

void movieEvent(Movie m) {
  m.read();
}