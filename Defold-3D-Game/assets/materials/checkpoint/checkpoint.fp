#version 140

in mediump vec2 var_texcoord0;

out vec4 out_fragColor;

uniform mediump sampler2D tex0;

uniform fs_uniforms
{
    mediump vec4 ambient_light;
    mediump vec4 base_tint;
    mediump vec4 highlight_tint;
};

void main()
{
    // Getting the texture color as base color
    vec4 base_color = texture(tex0, var_texcoord0);

    // Applying the tint
    vec4 color = base_color * base_tint;

    // Applying ambient light and returning the result
    out_fragColor = vec4(color.rgb * ambient_light.xyz, 1.0);
}

