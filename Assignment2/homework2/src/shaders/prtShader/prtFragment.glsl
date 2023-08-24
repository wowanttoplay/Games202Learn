#ifdef GL_ES
precision mediump float;
#endif

varying vec3 vColor;
varying vec3 vNormal;


void main(void) { gl_FragColor = vec4(vColor, 1.0); }