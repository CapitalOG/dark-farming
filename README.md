# Dark Farming

Advanced farming resource for RedM servers running VORP.

Dark Farming handles the full crop loop from planting and watering to harvest, with optional fertilizer, planting restrictions, smell detection for law jobs, and post-harvest weed drying and packaging.

## Features

- Unlimited crop definitions through `configs/plants.lua`
- Per-plant control over:
  - seed item and seed cost
  - soil requirement
  - planting tool and durability loss
  - growth time
  - rewards
  - job restrictions
  - map blips
  - locked planting coordinates
  - smell detection
- Global systems for:
  - watering cans with limited uses
  - fertilizer-based grow time reduction
  - player plant limits
  - town planting restrictions
  - house-property planting restrictions
  - localized notifications
  - persistent database storage
- Weed workflow support:
  - wet buds -> dried buds
  - dried buds -> packaged bags

## Requirements

Required:

- `vorp_core`
- `vorp_inventory`
- `vorp_character`
- `bcc-utils`
- `oxmysql`

Optional:

- `bcc-water` for bucket refilling workflows
- `bcchousing` table support if `Config.plantSetup.requireHouseOwnership = true`

## Installation

1. Place the resource folder in your server's `resources` directory.

2. Ensure the required dependencies start before this resource in `server.cfg`:

```cfg
ensure vorp_core
ensure vorp_inventory
ensure vorp_character
ensure bcc-utils
ensure oxmysql
ensure dark-farming
```

3. Import `dark-farming.sql` into your database.

4. Copy the item images from `img/` into your inventory image folder.

5. Restart the server.

## Configuration

Main settings are in `configs/config.lua`.

Important options:

- `Config.defaultlang`: active language file
- `Config.Notify`: notification backend (`feather-menu` or `vorp-core`)
- `Config.plantSetup.maxPlants`: plant limit per player
- `Config.plantSetup.lockedToPlanter`: planter-only harvesting
- `Config.plantSetup.requireHouseOwnership`: require planting inside owned house plots
- `Config.townSetup.canPlantInTowns`: allow or block town planting
- `Config.smelling`: law-job smell detection settings
- `Config.dryingSetup`: wet bud drying settings
- `Config.packagingSetup`: packaged weed output settings

Crop definitions live in `configs/plants.lua`.

Each plant can define:

- planting tool requirement
- seed item and amount
- soil item and amount
- prop model
- growth time
- harvest rewards
- job locks
- smell detection
- personal blips
- locked planting spots

## House Plot Integration

If `Config.plantSetup.requireHouseOwnership` is enabled, the script checks the `bcchousing` table for:

- `house_coords`
- `house_radius_limit`
- `charidentifier`

If your server does not use that housing table, disable house ownership planting:

```lua
Config.plantSetup.requireHouseOwnership = false
```

## Database Notes

The SQL file creates the `dark_farming` table used to persist planted crops across restarts.

It also inserts the default usable items for:

- watering cans
- fertilizer
- soil
- hoe
- wet buds
- dried buds
- packaged bags

You still need to add your own crop seed and harvest items if they are not already present in your inventory database.

## Localization

Included languages:

- English
- German
- French
- Polish
- Romanian

Language files are located in `languages/` and selected through `Config.defaultlang`.


## Credits

Original concept inspired by `prp_farming`, rebuilt and extended for this resource.
