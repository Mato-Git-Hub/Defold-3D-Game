#version 140

#define PI 3.14159265359

in mediump vec2 var_texcoord0;

out vec4 out_fragColor;

uniform mediump sampler2D tex0;

uniform fs_uniforms
{
    mediump vec4 ambient_light;
    mediump vec4 base_tint;
    highp vec4 time;
    mediump vec4 highlight_tint;
    mediump vec4 ripple;
};

float get_highlight_intensity()
{
    // Calculating the latitude based of uv coordinates
    float lat = var_texcoord0.y * PI;

    // Calculating the intesity based of sine wave and remapping it to [0.0, 1.0] (ripple = (frequency, speed, sharpness))
    float intensity = sin(lat * ripple.x + time.x * ripple.y);
    intensity = (intensity + 1.0) / 2.0;

    // Sharpening the wave
    intensity = pow(intensity, ripple.z);

    // Returning the result
    return intensity;
}

void main()
{
    // Premultiplying the tints
    vec4 base_tint_pm = vec4(base_tint.xyz * base_tint.w, base_tint.w);
    vec4 highlight_tint_pm = vec4(highlight_tint.xyz * highlight_tint.w, highlight_tint.w);

    // Applying the base tint to the texture
    vec4 base_color = texture(tex0, var_texcoord0.xy) * base_tint_pm;

    // Calculating the highlight intensity
    float highlight_intensity = get_highlight_intensity();

    // Applying ambient light to the base color
    vec4 color = vec4(base_color.rgb * ambient_light.xyz, 1.0);

    // Applying highlight
    color = mix(color, highlight_tint_pm, highlight_intensity);

    // Combining the results
    out_fragColor = vec4(color.xyz, 1.0);
}

