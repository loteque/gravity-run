
extends Resource
class_name UpgradeData

enum PointType {

    LARGE_RECT,
    SMALL_RECT,
    MEDIUM_RECT

}

enum WingType {

    STANDARD,
    MEDIUM_WING,
    LARGE_WING,
    ANY,

}


enum Tools {

    REMOVER,

}


static var wing_type: Array[StringName] = [

    &"standard",
    &"mediumWing",
    &"largeWing"

]


enum ShipSection {

    BOW,
    STARBOARD,
    STERN,
    PORT,
    PORT_LEADING_EDGE,
    STARBOARD_LEADING_EDGE,
    ANY

}


static var ship_section: Array[StringName] = [

    &"bow",
    &"starboard",
    &"starboard_leading_edge",
    &"stern",
    &"port",
    &"port_leading_edge"


]


enum Standard {
    
    CANNON_PORT, 
    CANNON_STARBOARD, 
    LAUNCH_TUBE_SMALL, 
    LAUNCH_TUBE_PORT_SMALL,
    LAUNCH_TUBE_STARTBOARD_SMALL, 
    LAUNCH_TUBE_MED, 
    SPREAD_BOW, 
    SPREAD_STERN, 
    LAZER_BOW,
    LAZER_STERN, 
    LAZER_PORT, 
    LAZER_STARBOARD, 
    TORPEDO_PORT,
    TORPEDO_STARBOARD,

}

static var standard: Array[StringName] = [
    
    &"CannonPort", 
    &"CannonStarboard", 
    &"LaunchTubeSmall", 
    &"LaunchTubePortSmall", 
    &"LaunchTubeStarboardSmall", 
    &"LaunchTubeMed", 
    &"SpreadBow", 
    &"SpreadStern", 
    &"LazerBow", 
    &"LazerStern", 
    &"LazerPort", 
    &"LazerStarboard", 
    &"TorpedoPort", 
    &"TorpedoStarboard"
    
]

enum MediumWing {

    CANNON_PORT, 
    CANNON_STARBOARD,    
    DRONE_CANNON_PORT_MEDIUM_WING, 
    DRONE_CANNON_STARBOARD_MEDIUM_WING, 
    DRONE_LAZER_PORT_MEDIUM_WING, 
    DRONE_LAZER_STARBOARD_MEDIUM_WING, 
    TORPEDO_PORT_I, 
    TORPEDO_PORT_II, 
    TORPEDO_STARBOARD_I, 
    TORPEDO_STARBOARD_II, 
    WING_PORT_MED, 
    WING_STARBOARD_MED,

}

static var medium_wing: Array[StringName] = [
    
    &"CannonPort", 
    &"CannonStarboard", 
    &"DroneCannonPortMediumWing", 
    &"DroneCannonStarboardMediumWing", 
    &"DroneLazerPortMediumWing", 
    &"DroneLazerStarboardMediumWing", 
    &"TorpedoPortI", 
    &"TorpedoPortII", 
    &"TorpedoStarboardI", 
    &"TorpedoStarboardII", 
    &"WingPortMed", 
    &"WingStarboardMed"
    
]

enum LargeWing {
    
    CANNON_PORT, 
    CANNON_STARBOARD, 
    SPREAD_PORT, 
    SPREAD_STARBOARD, 
    DRONE_CANNON_PORT_LARGE_WING, 
    DRONE_CANNON_STARBOARD_LARGE_WING, 
    DRONE_LAZER_PORT_LARGE_WING, 
    DRONE_LAZER_STARBOARD_LARGE_WING, 
    TORPEDO_PORT_I, 
    TORPEDO_PORT_II, 
    TORPEDO_PORT_III, 
    TORPEDO_STARBOARD_I, 
    TORPEDO_STARBOARD_II, 
    TORPEDO_STARBOARD_III, 
    WING_PORT_LARGE, 
    WING_STARBOARD_LARGE,
    
}

static var large_wing: Array[StringName] = [
    
    &"CannonPort", 
    &"CannonStarboard", 
    &"SpreadPort", 
    &"SpreadStarboard", 
    &"DroneCannonPortLargeWing", 
    &"DroneCannonStarboardLargeWing", 
    &"DroneLazerPortLargeWing", 
    &"DroneLazerStarboardLargeWing", 
    &"TorpedoPortI", 
    &"TorpedoPortII", 
    &"TorpedoPortIII", 
    &"TorpedoStarboardI", 
    &"TorpedoStarboardII", 
    &"TorpedoStarboardIII", 
    &"WingPortLarge", 
    &"WingStarboardLarge"
    
    ]

class Validator:

    static func validate(wing_type: WingType, ship_section: ShipSection, part_id: ValidPartName) -> bool:

        
        print("Validator: Validating wing type: ", wing_type)
        if parts_class.get(wing_type, null) == null:

            print("Validator: wing type not found")
            return false

        print("Validator: Validating ship section: ", ship_section)
        if parts_class[wing_type].get(ship_section, null) == null:

            print("Validator: ship section not found")
            return false

        print("Validator: Validating part id: ", part_id)
        if parts_class[wing_type][ship_section].find(part_id) == -1:

            print("Validator: part id not found for ship class")
            return false

        return true


    static var parts_class: Dictionary = { 
        
        UpgradeData.WingType.ANY: {

            UpgradeData.ShipSection.ANY: [
                
                UpgradeData.Tools.REMOVER
            
            ],
        },

        UpgradeData.WingType.STANDARD: {
                
            UpgradeData.ShipSection.PORT: [
    
                ValidPartName.CANNON_PORT,
                ValidPartName.LAUNCH_TUBE_PORT_SMALL,
                ValidPartName.LAZER_PORT
    
            ],

            UpgradeData.ShipSection.PORT_LEADING_EDGE: [
    
                ValidPartName.TORPEDO_PORT
    
            ],
    
            UpgradeData.ShipSection.STARBOARD: [
    
                ValidPartName.CANNON_STARBOARD,
                ValidPartName.LAUNCH_TUBE_STARTBOARD_SMALL,
                ValidPartName.LAZER_STARBOARD
    
            ],

            UpgradeData.ShipSection.STARBOARD_LEADING_EDGE: [
    
                ValidPartName.TORPEDO_STARBOARD
    
            ],

            UpgradeData.ShipSection.STERN: [

                ValidPartName.LAUNCH_TUBE_SMALL,
                ValidPartName.LAUNCH_TUBE_MED,
                ValidPartName.LAZER_STERN,
                ValidPartName.SPREAD_STERN

            ],

            UpgradeData.ShipSection.BOW: [

                ValidPartName.SPREAD_BOW,
                ValidPartName.LAZER_BOW

            ],
        
        },
    }

    enum ValidPartName {

        CANNON_PORT, 
        CANNON_STARBOARD, 
        LAUNCH_TUBE_SMALL, 
        LAUNCH_TUBE_PORT_SMALL,
        LAUNCH_TUBE_STARTBOARD_SMALL, 
        LAUNCH_TUBE_MED, 
        SPREAD_BOW, 
        SPREAD_STERN, 
        LAZER_BOW,
        LAZER_STERN, 
        LAZER_PORT, 
        LAZER_STARBOARD, 
        TORPEDO_PORT,
        TORPEDO_STARBOARD,  
        DRONE_CANNON_PORT_MEDIUM_WING, 
        DRONE_CANNON_STARBOARD_MEDIUM_WING, 
        DRONE_LAZER_PORT_MEDIUM_WING, 
        DRONE_LAZER_STARBOARD_MEDIUM_WING, 
        TORPEDO_PORT_I, 
        TORPEDO_PORT_II, 
        TORPEDO_STARBOARD_I, 
        TORPEDO_STARBOARD_II, 
        WING_PORT_MED, 
        WING_STARBOARD_MED,
        SPREAD_PORT, 
        SPREAD_STARBOARD, 
        DRONE_CANNON_PORT_LARGE_WING, 
        DRONE_CANNON_STARBOARD_LARGE_WING, 
        DRONE_LAZER_PORT_LARGE_WING, 
        DRONE_LAZER_STARBOARD_LARGE_WING,  
        TORPEDO_PORT_III, 
        TORPEDO_STARBOARD_III, 
        WING_PORT_LARGE, 
        WING_STARBOARD_LARGE,

    }

    static var valid_part_name: Array[StringName] = [

        &"CannonPort", 
        &"CannonStarboard", 
        &"LaunchTubeSmall", 
        &"LaunchTubePortSmall", 
        &"LaunchTubeStarboardSmall", 
        &"LaunchTubeMed", 
        &"SpreadBow", 
        &"SpreadStern", 
        &"LazerBow", 
        &"LazerStern", 
        &"LazerPort", 
        &"LazerStarboard", 
        &"TorpedoPort", 
        &"TorpedoStarboard", 
        &"DroneCannonPortMediumWing", 
        &"DroneCannonStarboardMediumWing", 
        &"DroneLazerPortMediumWing", 
        &"DroneLazerStarboardMediumWing", 
        &"TorpedoPortI", 
        &"TorpedoPortII", 
        &"TorpedoStarboardI", 
        &"TorpedoStarboardII", 
        &"WingPortMed", 
        &"WingStarboardMed",
        &"SpreadPort", 
        &"SpreadStarboard", 
        &"DroneCannonPortLargeWing", 
        &"DroneCannonStarboardLargeWing", 
        &"DroneLazerPortLargeWing", 
        &"DroneLazerStarboardLargeWing",
        &"DroneTorpedoPortIII", 
        &"TorpedoStarboardIII", 
        &"WingPortLarge", 
        &"WingStarboardLarge"


    ]