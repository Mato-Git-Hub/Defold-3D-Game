#version 140

in mediump vec2 var_texcoord0;

out vec4 out_fragColor;

uniform mediump sampler2D tex0;

uniform fs_uniforms
{
    mediump vec4 ambient_light;
};

void main()
{
    // Getting texture color
    vec4 color = texture(tex0, var_texcoord0.xy);

    // Applying ambient light and returning result
    out_fragColor = vec4(color.rgb * ambient_light.xyz, 1.0);
}

