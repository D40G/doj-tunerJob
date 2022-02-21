# doj-tunerJob

## Tuner job for qbus framework

Unfinished Project 

Do what you want with this script, just dont modify and sell (Main reason i dont code anymore)


# qb-customs
![qb-customs](https://i.imgur.com/OpalVrh.png)

# qb-tunerchip
![qb-customs](https://i.imgur.com/RxfG2zg.png)

# renzu_stancer
![renzu_stancer](https://i.imgur.com/OkmCU87.png)


# qb-core/shared.lua info
```
	-- TunerJob
	["tunerusb"] 				 	 = {["name"] = "tunerusb", 			    		["label"] = "Tuning Usb", 				["weight"] = 2500, 		["type"] = "item", 		["image"] = "tunerusb.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Tuning Usb will tune your automatically car for you, FuTuRe *squidward fetal position*"},
	["tuning_tablet"] 				 = {["name"] = "tuning_tablet", 			    ["label"] = "Tuning Tablet", 			["weight"] = 2500, 		["type"] = "item", 		["image"] = "tuning_tablet.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "With this tablet you can get your car on steroids... If you know what you\'re doing"},
	
	-- Doj carstuff
	["tire"] 				 		 = {["name"] = "tire", 			  	  			["label"] = "Spare Tire", 				["weight"] = 1000, 	["type"] = "item", 		["image"] = "tire.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,    ["description"] =  "Got a popped tire? Here is a Spare tire"},
	["turbo"] 		 	 		 	 = {["name"] = "turbo", 						["label"] = "Turbo Upgrade", 			["weight"] = 1000, 	["type"] = "item", 		["image"] = "turbo.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   	["description"] = "Who doesn't need a 65mm Turbo??"},
	["headlights"] 		 	 		 = {["name"] = "headlights", 					["label"] = "Xenon Headlights", 		["weight"] = 1000, 	["type"] = "item", 		["image"] = "headlights.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   	["description"] = "8k HID headlights"},
	["hid_controller"] 		 	 	 = {["name"] = "hid_controller", 				["label"] = "Xenon Remote", 			["weight"] = 1000, 	["type"] = "item", 		["image"] = "hid_controller.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   	["description"] = "Rgb HID Remote"},
	["underglow_controller"] 		 = {["name"] = "underglow_controller", 			["label"] = "Neon Controller", 			["weight"] = 1000, 	["type"] = "item", 		["image"] = "underglow_controller.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   	["description"] = "Rgb Underglow Controller"},
	["tint_supplies"] 				 = {["name"] = "tint_supplies", 			  	["label"] = "Tint Supplies", 			["weight"] = 1000, 	["type"] = "item", 		["image"] = "tint_supplies.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,    ["description"] = "Supplies for window tinting"},
	["trasnmission"] 				 = {["name"] = "trasnmission", 			  		["label"] = "Trasnmission Upgrade", 	["weight"] = 1000, 	["type"] = "item", 		["image"] = "trasnmission.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,    ["description"] = "Trasnmission upgrade"},
	["engine"] 				 		 = {["name"] = "engine", 			  			["label"] = "Engine Upgrade", 			["weight"] = 1000, 	["type"] = "item", 		["image"] = "engine.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,    ["description"] = "Engine upgrade"},
	["brakes"] 				 		 = {["name"] = "brakes", 			  			["label"] = "Brake Upgrade", 			["weight"] = 1000, 	["type"] = "item", 		["image"] = "brakes.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,    ["description"] = "Brakes upgrade"},
	["obd_scanner"] 				 = {["name"] = "obd_scanner", 			  		["label"] = "OBD2 Scanner", 			["weight"] = 1000, 	["type"] = "item", 		["image"] = "obd_scanner.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,    ["description"] = "OBD2 Scanner upgrade"},
	["key_unprogramed"] 			 = {["name"] = "key_unprogramed", 			  	["label"] = "Unprogramed carkeys", 		["weight"] = 1000, 	["type"] = "item", 		["image"] = "carkeys.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,    ["description"] = "Unprogramed carkey"},
	["key_programed"] 				 = {["name"] = "key_programed", 			  	["label"] = "Car Keys", 				["weight"] = 1000, 	["type"] = "item", 		["image"] = "carkeys.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,    ["description"] = "Programed carkey"},
	['tunerlaptop'] 				 = {['name'] = 'tunerlaptop', 			    	['label'] = 'Tuning Tablet', 			['weight'] = 2000, 	['type'] = 'item', 		['image'] = 'tunerlaptop.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,    ['description'] = 'With this tunerchip you can get your car on steroids... If you know what you\'re doing'},
	['stancerkit'] 				 	 = {['name'] = 'stancerkit', 			    	['label'] = 'Camber Arms', 				['weight'] = 2000, 	['type'] = 'item', 		['image'] = 'stancerkit.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,    ['description'] = 'Camber arms can be used to adjust vehicle tire angle'},
	
	-- Material
	['plastic'] 					 = {['name'] = 'plastic', 			  	  	  	['label'] = 'Plastic', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'plastic.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'RECYCLE! - Greta Thunberg 2019'},
	['metalscrap'] 					 = {['name'] = 'metalscrap', 			  	  	['label'] = 'Metal Scrap', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'metalscrap.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'You can probably make something nice out of this'},
	['copper'] 					 	 = {['name'] = 'copper', 			  	  		['label'] = 'Copper', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'copper.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Nice piece of metal that you can probably use for something'},
	['aluminum'] 					 = {['name'] = 'aluminum', 			  	  		['label'] = 'Aluminium', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'aluminum.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Nice piece of metal that you can probably use for something'},
	['aluminumoxide'] 				 = {['name'] = 'aluminumoxide', 			  	['label'] = 'Aluminium Powder', 		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'aluminumoxide.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Some powder to mix with'},
	['iron'] 				 	     = {['name'] = 'iron', 			  				['label'] = 'Iron', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'iron.png', 			    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Handy piece of metal that you can probably use for something'},
	['ironoxide'] 				 	 = {['name'] = 'ironoxide', 			  		['label'] = 'Iron Powder', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'ironoxide.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = {accept = {'aluminumoxide'}, reward = 'thermite', anim = {['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@', ['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = 'Mixing powder..', ['timeOut'] = 10000}},   ['description'] = 'Some powder to mix with.'},
	['steel'] 				 	 	 = {['name'] = 'steel', 			  			['label'] = 'Steel', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'steel.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Nice piece of metal that you can probably use for something'},
	['rubber'] 				 	 	 = {['name'] = 'rubber', 			  			['label'] = 'Rubber', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'rubber.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Rubber, I believe you can make your own rubber ducky with it :D'},
	['glass'] 				 	 	 = {['name'] = 'glass', 			  			['label'] = 'Glass', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'glass.png', 			    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'It is very fragile, watch out'},
	["electronics"] 				 = {["name"] = "electronics", 			  		["label"] = "Electronics", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "electronics.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = {accept = {"gatecrack"}, reward = "trojan_usb", anim = nil}, ["description"] = "If you've always wanted to build a robot you can maybe start here.. Maybe you'll be.. The new Elon Musk?"},
	
```






<!-- ### Coming Soon
Building off of doj-vehicles, This tuner job will allow players to have an illegal tuner job other than the civilan mechanic

# About
- Civilans: Cosmetic vehicle upgrades only
- Tuners: All illegal mods/performance upgrades will be done by a tuner
- Mechanics: Normal mechanic job (havent used, need to see what it has to offer)*might edit one*

# Features
???


# Required
**[textUi](https://github.com/dojwun/textUi)**

**[qb-menu](https://github.com/qbcore-framework/qb-menu)**

**[qb-target](https://github.com/BerkieBb/berkie-target)**

**[qb-customs EDIT](https://github.com/dojwun)**
 -->
