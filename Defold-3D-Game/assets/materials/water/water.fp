#version 140

in mediump vec2 var_texcoord0;

out vec4 out_fragColor;

uniform mediump sampler2D tex0;

uniform fs_uniforms
{
    mediump vec4 ambient_light;
    mediump vec4 water_color;
    mediump vec4 middle_color;
    mediump vec4 foam_color;
    mediump vec4 wave_params;
    mediump vec4 layer_params;
    highp vec4 time;
};

// Creating a function for pseudo random numbers
float rand(vec2 n)
{
    return fract(sin(dot(n, vec2(12.9898, 78.233))) * 43758.5453);
}

// Creating a function for noise
float noise(vec2 p)
{
    // Separating the point to integer part and fractional part
    vec2 ip = floor(p);
    vec2 fp = fract(p);

    // Smoothing out the fractional part
    fp = fp * fp * (3.0 - 2.0 * fp);

    // Mixing the random values that the vertices around the current uv coordinates get
    float x = mix(rand(ip), rand(ip + vec2(1.0, 0.0)), fp.x);
    float y = mix(rand(ip + vec2(0.0, 1.0)), rand(ip + vec2(1.0, 1.0)), fp.x);
    float a = fp.y;
    float result = mix(x, y, a);

    // Adding some contrasst and returning result
    return result * result;
}

// Creating a function for fractional brownian motion
float fbm(vec2 p)
{
    // Introducing some variables to use for noise layers
    float value = 0.0;
    float amplitude = 0.5;
    float frequency = 1.0;

    // Doing 4 layers of noice to achieve chaotic result
    value += amplitude * noise(p * frequency + vec2(time.x * 0.05, time.x * 0.025));

    amplitude *= 0.5;
    frequency *= 2.0;
    value += amplitude * noise(p * frequency + vec2(time.x * 0.075, -time.x * 0.05));

    amplitude *= 0.5;
    frequency *= 2.0;
    value += amplitude * noise(p * frequency + vec2(-time.x * 0.1, time.x * 0.125));

    amplitude *= 0.5;
    frequency *= 2.0;
    value += amplitude * noise(p * frequency - vec2(time.x * 0.15, time.x * 0.175));

    // Returning result
    return value;
}

void main()
{
    // Scaling the uv coordinates
    vec2 uv = var_texcoord0 * wave_params.x;

    // Getting texture color as base color
    vec4 base_color = texture(tex0, uv.xy);
    
    // Using brownian motion to get the wave height:
    float wave = fbm(uv);

    // Amplifying the noise
    wave *= wave_params.y;
    wave = clamp(wave, 0.0, 1.0);

    // Choosing water color based of wave
    float middle_mask = step(layer_params.x, wave) - step(layer_params.y, wave);
    vec4 color = mix(water_color, middle_color, middle_mask);

    float foam_mask = step(layer_params.z, wave) - step(layer_params.w, wave);
    color = mix(color, foam_color, step(layer_params.y, foam_mask));

    // Applying the water color to the base color
    color = base_color * color;

    // Applying ambient light and returning result
    out_fragColor = vec4(color.rgb * ambient_light.xyz, 1.0);
}

