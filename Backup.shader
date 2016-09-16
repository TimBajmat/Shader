Shader "Custom/Backup" {
	Properties {
		_MainTex("Texture_01", 2D) = "white" {}
		_AlphaTex("Texture_02", 2D) = "white" {}
		_BodyMass ("Body Mass", Range(0, 0.5)) = 0
	}

	// LAST TIME: Trying to add a second texture (black and white, grey-scale), why?
	// This is to try to effect only the vertices that are in the white range of the texture
	// Black = 0, white = 1

	SubShader{
		Tags {
			"Queue"="Transparent" 
			"IgnoreProjector"="True" 
			"RenderType" = "Opaque"
		}

		CGPROGRAM
		#pragma surface surf Lambert
		#pragma vertex vert

		float _BodyMass;
		sampler2D _MainTex;
		sampler2D _AlphaTex;

		struct Input {
			float2 uv_MainTex;
			float2 uv_AlphaTex;
		};

		void vert (inout appdata_full v){
			v.vertex.xyz += v.normal * _BodyMass / 1000;
		}

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D (_MainTex, IN.uv_AlphaTex);
		}

		ENDCG
	}

	Fallback "Transparent/VertexLit"
}