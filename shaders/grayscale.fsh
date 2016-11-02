varying vec4 v_fragmentColor;
varying vec2 v_texCoord;
void main()
{
    vec4 v_orColor = texture2D(CC_Texture0, v_texCoord);
    float gray = dot(v_orColor.rgb, vec3(0.3, 0.59, 0.11));
    gl_FragColor = vec4(gray, gray, gray, 1.0);
}