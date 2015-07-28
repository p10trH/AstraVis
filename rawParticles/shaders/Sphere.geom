#version 150 compatibility
#extension GL_EXT_geometry_shader4: enable
#extension GL_ARB_gpu_shader5 : enable

uniform float pointScale;

flat out vec3 vertex_light_position;
flat out vec4 eye_position;
flat out float sphere_radius;

uniform float globalAlpha;


in vec3 colorToGeom[];

varying vec3 colorValues;


void
main(void)
{
    colorValues = colorToGeom[0];
    
    if (gl_FrontColorIn[0].a == 1.0) {
        
        sphere_radius =  pointScale * 2.0;
        float halfsize = sphere_radius * 0.5;
        
        gl_FrontColor = gl_FrontColorIn[0];
        //gl_FrontColor.a = globalAlpha;
        
        gl_FrontColor.a = 1.0;
        
        eye_position = gl_PositionIn[0];
        vertex_light_position = normalize(gl_LightSource[0].position.xyz - eye_position.xyz);
        
        gl_TexCoord[0].st = vec2(1.0,-1.0);
        gl_Position = gl_PositionIn[0];
        gl_Position.xy += vec2(halfsize, -halfsize);
        gl_Position = gl_ProjectionMatrix * gl_Position;
        EmitVertex();
        
        gl_TexCoord[0].st = vec2(1.0,1.0);
        gl_Position = gl_PositionIn[0];
        gl_Position.xy += vec2(halfsize, halfsize);
        gl_Position = gl_ProjectionMatrix * gl_Position;
        EmitVertex();
        
        gl_TexCoord[0].st = vec2(-1.0,-1.0);
        gl_Position = gl_PositionIn[0];
        gl_Position.xy += vec2(-halfsize, -halfsize);
        gl_Position = gl_ProjectionMatrix * gl_Position;
        EmitVertex();
        
        gl_TexCoord[0].st = vec2(-1.0,1.0);
        gl_Position = gl_PositionIn[0];
        gl_Position.xy += vec2(-halfsize, halfsize);
        gl_Position = gl_ProjectionMatrix * gl_Position;
        EmitVertex();
        
        EndPrimitive();
        
    }
    else if (gl_FrontColorIn[0].a == 2.0) {
        
        sphere_radius = colorValues[2];
        float halfsize = sphere_radius * 0.5;
        
        gl_FrontColor = gl_FrontColorIn[0];
        //gl_FrontColor.a = globalAlpha;
        
        gl_FrontColor.a = 0.5;
        
        eye_position = gl_PositionIn[0];
        vertex_light_position = normalize(gl_LightSource[0].position.xyz - eye_position.xyz);
        
        gl_TexCoord[0].st = vec2(1.0,-1.0);
        gl_Position = gl_PositionIn[0];
        gl_Position.xy += vec2(halfsize, -halfsize);
        gl_Position = gl_ProjectionMatrix * gl_Position;
        EmitVertex();
        
        gl_TexCoord[0].st = vec2(1.0,1.0);
        gl_Position = gl_PositionIn[0];
        gl_Position.xy += vec2(halfsize, halfsize);
        gl_Position = gl_ProjectionMatrix * gl_Position;
        EmitVertex();
        
        gl_TexCoord[0].st = vec2(-1.0,-1.0);
        gl_Position = gl_PositionIn[0];
        gl_Position.xy += vec2(-halfsize, -halfsize);
        gl_Position = gl_ProjectionMatrix * gl_Position;
        EmitVertex();
        
        gl_TexCoord[0].st = vec2(-1.0,1.0);
        gl_Position = gl_PositionIn[0];
        gl_Position.xy += vec2(-halfsize, halfsize);
        gl_Position = gl_ProjectionMatrix * gl_Position;
        EmitVertex();
        
        EndPrimitive();
        
    }
    
    
}
