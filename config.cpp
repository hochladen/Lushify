class CfgPatches
{
    class Lushify
    {
        units[]=
        {
			"Lushify_ModuleScale"
        };
        weapons[]=
        {
        };
        requiredVersion=1.0;
        requiredAddons[]=
        {
			"A3_Modules_F",
			"cba_ui",
            "cba_xeh",
            "cba_jr"
        };
    };
};

class CfgFunctions
{
	class Lushify
	{
		class functions
		{
			tag="Lushify";
			file="Lushify\functions";
			class ScaleAll {};
			class ScaleArea {};
			class ReplaceModel {};
			class ModuleScale {};
		};
	};
};

class Extended_PreInit_EventHandlers {
    class Lushify {
        init = "call compile preprocessFileLineNumbers 'Lushify\functions\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
	class Lushify {
		init = "call Lushify_fnc_ScaleAll";
	};
};

// Module definitions below

class CfgFactionClasses
{
	class Environment;
	class Lushify_ModuleScale: Environment
	{
		displayName = "$STR_Lushify_Resize";
	};
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Edit;					// Default edit box (i.e., text input field)
			class Combo;				// Default combo box (i.e., drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Boolean)
			class ModuleDescription;	// Module description
		};
		// Description base classes, for more information see below
		class ModuleDescription;
	};
	class Lushify_ModuleScale: Module_F
	{
		// Standard object definitions
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "$STR_Lushify_Resize"; // Name displayed in the menu
		//icon = "\Lushify\lushify.paa"; // Map icon. Delete this entry to use the default icon
		category = "Environment";
		// Name of function triggered once conditions are met
		function = "Lushify_fnc_ModuleScale";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 1;
		// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isGlobal = 2;
		// 1 for module waiting until all synced triggers are activated
		isTriggerActivated = 0;
		// 1 if modules is to be disabled once it is activated (i.e., repeated trigger activation won't work)
		isDisposable = 1;
		// 1 to run init function in Eden Editor as well
		is3DEN = 1;
		// 1 for adjustable area
		canSetArea = 1;
		// 1 for adjustable height
		canSetAreaHeight = 0;
		// 1 for adjustable shape
		canSetAreaShape = 1;
		// Menu displayed when the module is placed or double-clicked on by Zeus
		curatorInfoType = "";

        class AttributeValues {
            size3[] = {10, 10, -1};
        };

		// Module attributes, uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific
		class Attributes: AttributesBase
		{
			// Module specific arguments
			class TreeScale: Edit
			{
				// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
				property = "Lushify_ModuleScale_TreeScale";
				displayName = "$STR_Lushify_TreeScale"; // Argument label
				tooltip = "$STR_Lushify_TreeScaleDesc"; // Tooltip description
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				validate = "number";
				defaultValue = "1.5"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			};
			class BushScale: Edit
			{
				// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
				property = "Lushify_ModuleScale_BushScale";
				displayName = "$STR_Lushify_BushScale"; // Argument label
				tooltip = "$STR_Lushify_BushScaleDesc"; // Tooltip description
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				validate = "number";
				defaultValue = "1.5"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			};
			class ModelReplacements: Edit
			{
				// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
				property = "Lushify_ModuleScale_ModelReplacements";
				displayName = "$STR_Lushify_ModelReplacements"; // Argument label
				tooltip = "$STR_Lushify_ModelReplacementsDesc"; // Tooltip description
				typeName = "STRING";
				validate = "expression";
				defaultValue = """[[]]""";
			};
			class ModuleDescription: ModuleDescription{}; // Module description should be shown last
		};

		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "$STR_Lushify_ResizeModuleDesc"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
			direction = 0;
			duplicate = 0;
			position = 0;
		};
	};
};