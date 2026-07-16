#version 140

in highp vec4 var_position;
in mediump vec2 var_texcoord0;
in highp vec4 var_pivot;

out vec4 out_fragColor;

uniform mediump sampler2D tex0;

uniform fs_uniforms
{
    mediump vec4 ambient_light;
    mediump vec4 base_tint;
    mediump vec4 highlight_tint;
    mediump vec4 shade_params;
    mediump vec4 highlight_params;
    highp vec4 time;
};

// Creating function to get the highlighted tint
vec4 get_tint()
{
    // Calculating the highlight intensity
    float intensity = sin((var_position.y - var_pivot.y) * highlight_params.x + time.x * highlight_params.y);
    intensity = (intensity + 1.0) / 2.0;

    // Sharpening the wave
    intensity = pow(intensity, highlight_params.z);

    // Applying highlight and returning the result
    return mix(base_tint, highlight_tint, intensity);
}

// Creating function to apply shading
vec4 apply_shading(vec4 color)
{
    // Calculating height for shade calculations
    float height = (var_position.y - var_pivot.y + shade_params.z) / (2 * shade_params.z);

    // Calculating the shade intensity
    float intensity = shade_params.x + height * shade_params.y;
    intensity = clamp(intensity, 0.0, 1.0);

    // Applying the shade and returning the result
    return color * vec4(intensity);
}

void main()
{
    // Getting the texture color as base color
    vec4 base_color = texture(tex0, var_texcoord0);


    // Getting the highlighted tint
    vec4 tint = get_tint();

    // Applying the tint
    vec4 color = base_color * tint;

    // Applying shading
    color = apply_shading(color);

    // Applying ambient light and returning the result
    out_fragColor = vec4(color.rgb * ambient_light.xyz, 1.0);
}

