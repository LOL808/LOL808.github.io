varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

uniform vec2 textureSize;

//const vec2 mosaicSize = vec2(10,10);
uniform vec2 mosaicSize;

vec4 getMosaicColor(vec2 coord) {

    vec2 curPoint = vec2(coord.x*textureSize.x, coord.y*textureSize.y);

    vec2 centerPoint = vec2(floor(curPoint.x/mosaicSize.x)*mosaicSize.x, floor(curPoint.y/mosaicSize.y)*mosaicSize.y)+0.5*mosaicSize;

    vec2 deltaCoord = curPoint - centerPoint;
//
    float deltaL = length(deltaCoord);

    vec2 uvCenter = vec2(centerPoint.x/textureSize.x, centerPoint.y/textureSize.y);

    if (deltaL<mosaicSize.x*1.3) {
        return texture2D(CC_Texture0, uvCenter);
    }

    else {
        return texture2D(CC_Texture0, coord);

    }


//    vec4 v_orColor = texture2D(CC_Texture0, v_texCoord);
//    return v_orColor;


}

void main()
{

//    gl_FragColor = texture2D(CC_Texture0, v_texCoord);
//        vec4 v_orColor = texture2D(CC_Texture0, v_texCoord);
//        float gray = dot(v_orColor.rgb, vec3(0.3, 0.3, 0.3));
//        gl_FragColor = vec4(gray, gray, gray, 1.0);
    gl_FragColor = getMosaicColor(v_texCoord);

}