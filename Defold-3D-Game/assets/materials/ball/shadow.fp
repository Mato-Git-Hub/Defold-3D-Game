#version 140

in mediump vec2 var_texcoord0;

out vec4 out_fragColor;

uniform mediump sampler2D tex0;

uniform fs_uniforms
{
    mediump vec4 ambient_light;
    mediump vec4 base_tint;
};

void main()
{
    // Applying base tint to the texture
    vec4 base_tint_pm = vec4(base_tint.xyz * base_tint.w, base_tint.w);
    vec4 color = texture(tex0, var_texcoord0.xy) * base_tint_pm;

    // Applying ambient light
    out_fragColor = vec4(color.rgb * ambient_light.xyz, 0.5);
}

