attribute vec3 aVertexPosition;
attribute vec3 aNormalPosition;
attribute vec2 aTextureCoord;

uniform mat4 uModelMatrix;
uniform mat4 uViewMatrix;
uniform mat4 uProjectionMatrix;
uniform mat4 uMoveWithCamera;

varying highp vec2 vTextureCoord;
varying highp vec3 vFragPos;
varying highp vec3 vNormal;

void main() {

    vNormal = aNormalPosition;
    vTextureCoord = aTextureCoord;
    mat4 viewMatrix = uViewMatrix;
    viewMatrix = mat4(mat3(viewMatrix));
     gl_Position = uProjectionMatrix * viewMatrix * uModelMatrix * uMoveWithCamera * vec4(aVertexPosition, 1.0);
     gl_Position = vec4(gl_Position.xy, gl_Position.z, gl_Position.z);
    // gl_Position = uProjectionMatrix * uViewMatrix * uModelMatrix * vec4(aVertexPosition, 1.0);

   vFragPos = aVertexPosition;//gl_Position.xyz;
}