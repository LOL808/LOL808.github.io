varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

uniform vec2 textureSize; //纹理大小 就像 ->800*600
uniform vec2 mosaicSize;  //马赛克大小

vec4 getMosaicColor(vec2 coord) {
    //当前点像素坐标
    vec2 curPoint = vec2(coord.x*textureSize.x, coord.y*textureSize.y);
    //这个像素所在马赛克方块中心像素
    vec2 centerPoint = vec2(floor(curPoint.x/mosaicSize.x)*mosaicSize.x, floor(curPoint.y/mosaicSize.y)*mosaicSize.y)+0.5*mosaicSize;
    //转成 0.0~1.0
    vec2 uvCenter = vec2(centerPoint.x/textureSize.x, centerPoint.y/textureSize.y);
    //拿到rgba
    return texture2D(CC_Texture0, uvCenter);
}

void main()
{
    gl_FragColor = getMosaicColor(v_texCoord);
}