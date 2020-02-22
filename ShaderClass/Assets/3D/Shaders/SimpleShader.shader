Shader "Unlit/SimpleShader"
{
    //Properties
    //{
    //    _MainTex ("Texture", 2D) = "white" {}
    //}
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vertRay
            #pragma fragment lilyFrag

            #include "UnityCG.cginc"
            
            // Mesh Data: Vertex Position, Vertex Normal, UVs, Tangents, Vertex Color
            struct VertexInput
            {
                float4 vertexPosition : POSITION;
                //float4 color : COLOR;
                //float4 normal : NORMAL;
                //float4 tangent : TANGENT;
                //float2 uv0 : TEXCOORD0;
                //float2 uv1 : TEXCOORD1;
            };

            struct VertexOutput
            {
                float4 clipSpacePos : SV_POSITION;
            };

            //sampler2D _MainTex;
            //float4 _MainTex_ST;

            VertexOutput vertRay (VertexInput i)
            {
                VertexOutput o;
                o.clipSpacePos = UnityObjectToClipPos(i.vertexPosition);
                return o;
            }

            fixed4 lilyFrag (VertexOutput o) : SV_Target
            {
                return float4 (0, 0, 1, 0);
            }
            ENDCG
        }
    }
}
