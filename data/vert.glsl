

uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec3 lightNormal;

uniform vec3 colorin;
uniform int time;

attribute vec4 vertex;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;

void main() {
  gl_Position = transform * vertex + vec4(0, sin(time/1000.0f + vertex.x/100.0f) * 100, 0, 0); 
  vertColor = vec4(colorin.x, colorin.y, colorin.z, 1.0);//color;
  vertNormal = normalize(normalMatrix * normal);
  vertLightDir = -lightNormal;
}