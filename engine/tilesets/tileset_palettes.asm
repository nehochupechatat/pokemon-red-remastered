LoadSpecialMapPalette:
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_BATTLE_TOWER_INSIDE
	jr z, .battle_tower_inside
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion_mobile
	cp TILESET_MUSEUM
	jr z, .museum
	cp TILESET_POKECENTER_KANTO
	jr z, .pokecenter_kanto
	cp TILESET_GATE_KANTO
	jr z, .gate_kanto
	cp TILESET_MART_KANTO
	jr z, .mart_kanto
	cp TILESET_LAB
	jr z, .lab
	cp TILESET_HOUSE_KANTO
	jr z, .house_kanto
	cp TILESET_GYM_KANTO
	jr z, .gym_kanto
	cp TILESET_GYM_PEWTER
	jr z, .gym_pewter
	cp TILESET_GYM_CERULEAN
	jr z, .gym_cerulean
	cp TILESET_PORT_KANTO
	jr z, .port_kanto
	cp TILESET_CLUB_KANTO
	jr z, .club_kanto
	cp TILESET_INTERIOR
	jr z, .interior
	jr .do_nothing

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.battle_tower_inside
	call LoadBattleTowerInsidePalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret

.museum
	call LoadMuseumPalette
	scf
	ret
	
.pokecenter_kanto
	call LoadPokecenterKantoPalette
	scf
	ret
	
.gate_kanto
	call LoadGateKantoPalette
	scf
	ret
	
.mart_kanto
	call LoadMartKantoPalette
	scf
	ret
	
.lab
	call LoadLabPalette
	scf
	ret
	
.house_kanto
	call LoadHouseKantoPalette
	scf
	ret
	
.gym_kanto
	call LoadGymKantoPalette
	scf
	ret
	
.gym_pewter
	call LoadGymPewterPalette
	scf
	ret
	
.gym_cerulean
	call LoadGymCeruleanPalette
	scf
	ret
	
.port_kanto
	call LoadPortKantoPalette
	scf
	ret
	
.club_kanto
	call LoadClubKantoPalette
	scf
	ret

.interior
	call LoadMuseumPalette
	scf
	ret

.do_nothing
	and a
	ret

LoadPokeComPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeComPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

PokeComPalette:
INCLUDE "gfx/tilesets/pokecom_center.pal"

LoadBattleTowerInsidePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerInsidePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

BattleTowerInsidePalette:
INCLUDE "gfx/tilesets/battle_tower_inside.pal"

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

LoadMuseumPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MuseumPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

MuseumPalette:
INCLUDE "gfx/tilesets/museum.pal"

LoadPokecenterKantoPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokecenterKantoPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

PokecenterKantoPalette:
INCLUDE "gfx/tilesets/pokecenter_kanto.pal"

LoadGateKantoPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, GateKantoPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

GateKantoPalette:
INCLUDE "gfx/tilesets/gate_kanto.pal"


LoadMartKantoPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MartKantoPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

MartKantoPalette:
INCLUDE "gfx/tilesets/mart_kanto.pal"

LoadLabPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, LabPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

LabPalette:
INCLUDE "gfx/tilesets/lab.pal"

LoadHouseKantoPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HouseKantoPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

HouseKantoPalette:
INCLUDE "gfx/tilesets/house_kanto.pal"

LoadGymKantoPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, GymKantoPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

GymKantoPalette:
INCLUDE "gfx/tilesets/gym_kanto.pal"

LoadGymPewterPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, GymPewterPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

GymPewterPalette:
INCLUDE "gfx/tilesets/gym_pewter.pal"

LoadGymCeruleanPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, GymCeruleanPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

GymCeruleanPalette:
INCLUDE "gfx/tilesets/gym_cerulean.pal"

LoadPortKantoPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PortKantoPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

PortKantoPalette:
INCLUDE "gfx/tilesets/port_kanto.pal"

LoadClubKantoPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, ClubKantoPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

ClubKantoPalette:
INCLUDE "gfx/tilesets/club_kanto.pal"



