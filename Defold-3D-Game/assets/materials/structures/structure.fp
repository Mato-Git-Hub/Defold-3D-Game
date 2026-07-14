#version 140

in highp vec4 var_position;
in mediump vec2 var_texcoord0;
in highp vec4 var_top;
in highp vec4 var_bottom;
in highp vec4 var_ball_pos;

out vec4 out_fragColor;

uniform mediump sampler2D tex0;

uniform fs_uniforms
{
    mediump vec4 ambient_light;
    mediump vec4 shade_params;
    mediump vec4 ball_shadow_params;
};

void main()
{
    // Getting texture color as a base color
    vec4 base_color = texture(tex0, var_texcoord0.xy);

    // Calculating height for shade calculations
    float height = (var_position.y - var_bottom.y) / (var_top.y - var_bottom.y);
    
    // Calculating the shade intensity
    float intensity = shade_params.x + height * shade_params.y;
    intensity = clamp(intensity, 0.0, 1.0);

    // Calculating the color
    vec4 color = base_color * vec4(intensity);

    // Calculating values needed for ball shadow calculations
    vec2 ball_shadow = vec2(length(var_ball_pos.xz - var_position.xz), var_ball_pos.y - var_position.y);

    // Calculating ball shadow radius
    float radius = mix(ball_shadow_params.z, ball_shadow_params.y, (ball_shadow.y - 0.5) / ball_shadow_params.x) * 0.5;
    radius = clamp(radius, ball_shadow_params.y, ball_shadow_params.z);

    // Checking if shadow should be drawn
    if (ball_shadow.x <= radius && ball_shadow.y > 0) color = color * vec4(ball_shadow_params.w);

    // Applying ambient light and returning result
    out_fragColor = vec4(color.rgb * ambient_light.xyz, 1.0);
}

