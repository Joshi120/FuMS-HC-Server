// GetWorldInfo.sqf
// code taken from A3EAI by Face
// http://epochmod.com/forum/index.php?/topic/31551-a3eai-ai-addon-for-a3-epoch-alpha-057-released/
// Horbin
// 4/3/2015

  
// Exclusion Areas
// Areas to be excluded from Global Random generation of mission spawn points
// Points listed are for the upper left and lower right corners of a box.

// Default Areas
// default positions to use if locations being randomly generated
// These positions will be used if a random safe location is not found.
// Note: The below locations are for use by BIS_fnc_findSafePos !!!
		
//  If you have specific locations you want to use for your mission set, place those
//  locations in the specific themedata.sqf.

private ["_worldname"];
_worldname = (toLower worldName);
	{
		if ( _worldname isEqualTo (_x select 0) ) exitWith 
		{			
			FuMS_MapCenter = _x select 1;
			FuMS_MapRange = _x select 2;
            if (count _x > 2) then { FuMS_BlackList = _x select 3;}
            else { FuMS_BlackList = [];};
            if (count _x > 3) then {FuMS_DefaultPos = _x select 4;}
            else {FuMS_DefaultPos = [];};  
		};
    } forEach 
    [        
        [
            "altis",
            [15834.2,15787.8,0], // Map Center
            12000,  // Map Size
            [
                //Exlusion Areas
                [[13000,15000,0],[14000,14000,0]],	// Middle spawn near Stavros
                [[05900,17100,0],[06400,16600,0]], // West spawn
                [[18200,14500,0],[18800,14100,0]],   // East spawn
                [[23400,18200,0],[23900,17700,0]] // Clone Lab
            ],
            [                        
                //Default Areas            
            ]    
        ],    
        [
            "stratis",
            [3937.6,4774.51,0],
            3000,
            [
                
            ],
            [
                
            ]
        ],
        ["caribou",[3938.9722, 4195.7417],3500],
        ["chernarus",[7652.9634, 7870.8076],5500],
        ["fallujah",[5139.8008, 4092.6797],4000],
        ["fdf_isle1_a",[10771.362, 8389.2568],2750],
        ["isladuala",[4945.3438, 4919.6616],4000],
        ["lingor",[5166.5581, 5108.8301],4500],
        ["mbg_celle2",[6163.52, 6220.3984],6000],
        ["namalsk",[5880.1313, 8889.1045],3000],
        ["napf",[10725.096, 9339.918],8500],
        ["oring",[5191.1069, 5409.1938],4750],
        ["panthera2",[5343.6953, 4366.2534],3500],
        ["sara",[12693.104, 11544.386],6250],
        ["smd_sahrani_a2",[12693.104, 11544.386],6250],
        ["sauerland",[12270.443, 13632.132],17500],
        ["takistan",[6368.2764, 6624.2744],6000],
        ["tavi",[10887.825, 11084.657],8500],
        ["trinity",[7183.8403, 7067.4727],5300],
        ["utes",[3519.8037, 3703.0649],1000],
        ["zargabad",[3917.6201, 3800.0376],2000],
        [_worldname,getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"),7000]
    ];

    
diag_log format ["##GetWorldInfo: Map:%1 Center:%2 Size:%3",_worldname, FuMS_MapCenter, FuMS_MapRange];
    
    