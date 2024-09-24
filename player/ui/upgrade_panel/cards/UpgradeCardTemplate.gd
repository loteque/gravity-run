extends Resource
class_name UpgradeCardTemplate

@export var upgrade_type: UpgradeData.PointType
@export var cost: int = 1
@export var id: UpgradeData.Validator.ValidPartName
@export var wing_type: UpgradeData.WingType
@export var ship_section: UpgradeData.ShipSection
@export var return_type: int = 1
@export var return_value: int = 1
@export var part_image: AtlasTexture
@export var cost_rect: AtlasTexture
@export var return_rect: AtlasTexture