class TexSys {
 
  void display() {
   
    subTex0.beginDraw();
    subTex0.copy(movie, 0, lh, ww, cw, 0, 0, ww, cw);
    subTex0.endDraw();

    subTex1.beginDraw();
    subTex1.copy(movie, 0, cw+2*lh, ww, cw, 0, 0, ww, cw);
    subTex1.endDraw();
    
    
    tex.beginDraw();

    tex.background(0);
    tex.image(subTex0, 0, 0);
    tex.image(subTex1, 0, cw );
    tex.endDraw();
    
   
  }
}
