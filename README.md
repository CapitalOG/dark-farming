# Dark Farming ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸Ãƒâ€¦Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â±

*Advanced Agricultural System for RedM*

**Transform your RedM server with immersive farming mechanics** - from planting seeds to harvesting crops, with realistic gameplay elements.

---

## ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸Ãƒâ€¦Ã¢â‚¬â„¢Ãƒâ€¦Ã‚Â¸ Key Features

### **ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸Ãƒâ€¦Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â¿ Core Farming System**

- **Unlimited Custom Crops**: Create any number of plant types with unique growth cycles and yields
- **Resource Management**:
  - Soil requirements with configurable amounts
  - Fertilizer system for growth acceleration
  - Watering mechanics with bucket depletion (auto-replaced with empty buckets)
- **Ownership System**: Configurable plant locking (planter-only or public access)

### **ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒâ€šÃ‚Â§ Advanced Configuration**

- **Job Restrictions**: Lock plants to specific professions (farmer, outlaw, etc.)
- **Zone Control**: Town proximity restrictions with adjustable radii
- **Tool Requirements**: Specify required equipment per crop type
- **Economic Balancing**: Configure required seed and soil amounts as well as harvest yields
- **Player Limits**: Set maximum plants per player

### **ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢Ãƒâ€šÃ‚Â» Technical Implementation**

- **Database Backed**: Persistent storage across server restarts
- **Localization Ready**: Full multilingual support
- **Update Notifications**: Built-in version checker

### **ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸Ãƒâ€¦Ã‚Â½Ãƒâ€šÃ‚Â® Gameplay Enhancements**

- **Interactive UI**: Intuitive prompts for all farming actions
- **Debug System**: Color-coded logging for easy troubleshooting

*Every feature is configurable through simple, well-documented config files.*

---

## ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã…â€œÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¹ Requirements

### **Core Dependencies**

- [vorp_core](https://github.com/VORPCORE/vorp-core-lua)
- [vorp_inventory](https://github.com/VORPCORE/vorp_inventory-lua)
- [vorp_character](https://github.com/VORPCORE/vorp_character-lua)
- [bcc-utils](https://github.com/BryceCanyonCounty/bcc-utils)

### **Recommended Addon**

- [bcc-water](https://github.com/BryceCanyonCounty/bcc-water) *(for bucket filling functionality)*

---

## ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂºÃƒâ€šÃ‚Â  Installation Guide

### **1. Prepare Your Server**

```bash
# Ensure all dependencies are installed and updated
ensure vorp_core
ensure vorp_inventory
ensure vorp_character
ensure bcc-utils
```

### **2. Install Dark Farming**

1. Place the `dark-farming` folder in your `resources` directory
2. Add to your `server.cfg`:

   ```cfg
   ensure bcc-farming
   ```

### **3. Database Setup**

Import the included SQL file: `dark-farming.sql`

### **4. Asset Installation**

Copy images to your inventory system:
```
\vorp_inventory\html\img\items\*.png
```

### **5. Final Steps**

- Configure settings in `config.lua`
- Restart your server

---

## ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢Ãƒâ€šÃ‚Â Credits & Inspiration

Original concept inspired by 'prp_farming' - completely rebuilt with enhanced features and optimizations.


