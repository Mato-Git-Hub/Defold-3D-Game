#version 140

in mediump vec2 var_texcoord0;

out vec4 out_fragColor;

uniform mediump sampler2D tex0;
uniform mediump sampler2D texDepth;

uniform fs_uniforms
{
    mediump vec4 camera_params;
    mediump vec4 fog_params;
    mediump vec4 fog_color;
};

// Creating a function to get the linearized depth value by the uv coordinates
float get_radial_depth(vec2 uv)
{
    // Reading the base value from the depth texture
    float depth_sample = texture(texDepth, uv.xy).r;

    // Remapping the depth sample to NDC
    depth_sample = 2.0 * depth_sample - 1.0;

    // Linearizing the depth
    float depth_linear = 2.0 * camera_params.x * camera_params.y / (camera_params.y + camera_params.x - depth_sample * (camera_params.y - camera_params.x));

    // Remapping the uv coordinates to NDC
    vec2 ndc_xy = uv * 2.0 - 1.0;

    // Caluclating the ray length to the point in NDC space
    float ray_length = length(vec3(ndc_xy.x, ndc_xy.y, 1.0 / tan(camera_params.z / 2)));

    // Calculating the radial depth and returning the result
    return depth_linear * ray_length;
}

// Creating a function for applying distance fog
vec4 apply_distance_fog(vec2 uv, vec4 base_color)
{
    // Getting the radial depth of the coordinates
    float depth = get_radial_depth(uv);

    // Calculating the fog factor
    float fog_amount = 1.0 - exp(-fog_params.x * (depth - fog_params.y));

    // Making sure the fog stays within bounds
    fog_amount = clamp(fog_amount, 0.0, fog_params.w);
    if (depth > fog_params.z) fog_amount = fog_params.w;

    // Mixing the colors and returning the result
    return mix(base_color, fog_color, fog_amount);
}

void main()
{
    // Getting the texture color as base color
    vec4 base_color = texture(tex0, var_texcoord0.xy);

    // Applying fog
    vec4 color = apply_distance_fog(var_texcoord0.xy, base_color);

    // Returning the result
    out_fragColor = vec4(color.rgb,1.0);
}