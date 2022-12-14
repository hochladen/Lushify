[
	"Lushify_TreeScale",
	"SLIDER",
	["$STR_Lushify_TreeScale", "$STR_Lushify_TreeScaleDesc"],
	["Lushify", "$STR_Lushify_Sizes"],
	[0, 10, 1.5, 2, false],
	1,
	{ [] call Lushify_fnc_ScaleAll },
	false
] call CBA_fnc_addSetting;

[
	"Lushify_BushScale",
	"SLIDER",
	["$STR_Lushify_BushScale", "$STR_Lushify_BushScaleDesc"],
	["Lushify", "$STR_Lushify_Sizes"],
	[0, 10, 1.5, 2, false],
	1,
	{ [] call Lushify_fnc_ScaleAll },
	false
] call CBA_fnc_addSetting;

[
	"Lushify_MinScaleMult",
	"SLIDER",
	["$STR_Lushify_MinScale", "$STR_Lushify_MinScaleDesc"],
	["Lushify", "$STR_Lushify_Sizes"],
	[0, 10, .95, 2, false],
	1,
	{ [] call Lushify_fnc_ScaleAll },
	false
] call CBA_fnc_addSetting;

[
	"Lushify_MaxScaleMult",
	"SLIDER",
	["$STR_Lushify_MaxScale", "$STR_Lushify_MaxScaleDesc"],
	["Lushify", "$STR_Lushify_Sizes"],
	[0, 10, 1.05, 2, false],
	1,
	{ [] call Lushify_fnc_ScaleAll },
	false
] call CBA_fnc_addSetting;

[
	"Lushify_ModelReplacements",
	"EDITBOX",
	["$STR_Lushify_ModelReplacements", "$STR_Lushify_ModelReplacementsDesc"],
	["Lushify", "$STR_Lushify_ModelReplacements"],
	"[[]]",
	1,
	{ [] call Lushify_fnc_ScaleAll },
	true
] call CBA_fnc_addSetting;