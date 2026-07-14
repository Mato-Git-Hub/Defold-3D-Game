#version 140

#define PI 3.14159265359

in mediump vec2 var_texcoord0;

out vec4 out_fragColor;

uniform mediump sampler2D tex0;

uniform fs_uniforms
{
    mediump vec4 ambient_light;
    mediump vec4 gradient_params;
    mediump vec4 top_color;
    mediump vec4 middle_color;
    mediump vec4 bottom_color;
};

void main()
{
    // Getting texture color as a base color
    vec4 base_color = texture(tex0, var_texcoord0.xy);

    // Calculating the latitude of the uv coordinates
    float lat = PI * (var_texcoord0.y - 0.5);

    // Calculating the interpolation term t and sharpening it
    float t = clamp(lat / PI, 0.0, 1.0);
    t = pow(t, gradient_params.x);

    // Introducing the dome tint
    vec4 dome_tint = vec4(0);

    // Checking if blending the top part of the dome or the bottom part of the dome
    if (t > 0.5) {
        // Remapping t back to [0, 1]
        t *= 0.5;

        // Mixing the dome color
        dome_tint = mix(middle_color, top_color, t);
    } else {
        // Remapping t back to [0, 1]
        t *= 2;

        // Mixing the dome color
        dome_tint = mix(bottom_color, middle_color, t);
    }

    // Applying dome tint
    vec4 color = base_color * dome_tint;

    // Applying ambient light and returning result
    out_fragColor = vec4(color.rgb * ambient_light.xyz, 1.0);
}

