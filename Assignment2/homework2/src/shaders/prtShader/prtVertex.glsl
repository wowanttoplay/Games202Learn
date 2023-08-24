attribute vec3 aVertexPosition;
attribute vec3 aNormalPosition;
attribute mat3 aPrecomputeLT;

uniform mat4 uModelMatrix;
uniform mat4 uViewMatrix;
uniform mat4 uProjectionMatrix;
uniform mat3 uPrecomputeL[3]; // r g b 三个通道的球谐系数

varying vec3 vColor;
varying vec3 vNormal;


float L_dot_LT(mat3 LT, mat3 L) {
    return dot(LT[0], L[0]) + dot(LT[1], L[1]) + dot(LT[2], L[2]);
}


void main(void) {
    
    vNormal = (uModelMatrix * vec4(aNormalPosition, 0.0)).xyz;
  gl_Position = uProjectionMatrix * uViewMatrix * uModelMatrix * vec4(aVertexPosition, 1.0);

  vColor = vec3(L_dot_LT(aPrecomputeLT, uPrecomputeL[0]), L_dot_LT(aPrecomputeLT, uPrecomputeL[1]), L_dot_LT(aPrecomputeLT, uPrecomputeL[2]));
}