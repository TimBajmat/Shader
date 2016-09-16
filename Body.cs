using UnityEngine;
using System.Collections;
using System;
using UnityEngine.UI;

[ExecuteInEditMode]
public class Body : MonoBehaviour {

	public SkinnedMeshRenderer SkinMeshR;
	private float bodyMassValue;

	[SerializeField] private Slider slider;

	void Start()
	{
		SkinMeshR = gameObject.GetComponent<SkinnedMeshRenderer>();

	}

	void Update()
	{
		ChangeValue();
	}

	void ChangeValue(){

		bodyMassValue = (float)slider.value;
		SkinMeshR.sharedMaterial.SetFloat("_BodyMass", bodyMassValue);
	}
}
