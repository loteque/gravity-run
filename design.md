# Inside Out Endless Runner

### Loteque

Revision: 0.1.0

License
Copyright © (Loteque, Jonathan David Lewis, 2024 - Present)

- ![Overview](#overview)
  - ![Theme / Setting / Genre](#theme--setting--genre)
  - ![Targeted platforms](#targeted-platforms)
  - ![Project _**scope**_](#project-scope)
  - ![influences](#influences)
  - ![The Elevator Pitch](#the-elevator-pitch)
  - ![What sets this project apart?](#what-sets-this-project-apart)
- ![Story and Gameplay](#story-and-gameplay)
  - ![Core Gameplay Mechanics Brief](#core-gameplay-mechanics-brief)
  - ![Gameplay Brief](#gameplay-brief)
  - ![Core Gameplay Mechanics](#core-gameplay-mechanics)
  - ![Gameplay](#gameplay)
- ![Assets](#assets)
  - ![2D](#2d)
  - ![Code](#code)

## Overview

### Theme / Setting / Genre

- Themes: "Inside Out"
- Genre:  Endless Runner

### Targeted platforms

- Web

### Project scope

- **Game Time Scale**

  - Time Scale of 4 days total

- **Core Team members**

  - Loteque: Design, General Programmer, Art, Sound

- **Aditional team members**

  - Jonathan David Lewis: Consultant, Special-FX Programmer


### Influences

- Dinorun
- Asteroids
- Shmups in general (sidescrolling)

### The Elevator Pitch

- Your ship is being chased by a black hole while gravity inverts and throws astroids in your path

### What sets this project apart?

- it mashes up asteriods with and endless runner and plays with the concept of gravity

## Story and Gameplay

### Story Brief

- you are the pilot of a ship being chased by a black hole

### Core Gameplay Mechanics Brief

- pilot a ship to escape a black hole that is hurling asteriods at you

### Core Gameplay Mechanics

- dodge asteriods that pull you twords them when you get too close
- use reverse gravity inside inversion well of black hole to gain a boost
- shoot and destroy asteroids that get in your way
- be careful not to shoot all the asteroids because you'll need to use them for a boost

### Gameplay Brief

- ship flys to the right as the inversion zone of asteriod slowly grows causing a faster pull backwards when not excellerating and more asteriods to spawn in moving from right to left. Player must endlessly dodge, slingshot off of, and shoot down anything that flys in their way.

### Gameplay

- [ ] turn game on
- [ ] player sees a start screen
- [ ] option: Start
- [ ] player gets control of ship, ship is flying to the right (screen scroll)
- [ ] player can move the ship up and down foward and back
- [ ] asteriods fly in from the right moving left
- [ ] asteriods pull the player towords them
- [ ] player can dodge asteriods
- [ ] player can shoot and destroy asteriods
- [ ] black hole enters from the left
- [ ] black whole has an inversion zone that inverts color
- [ ] the inversion zone changes asteriods so that they push the player away from them
- [ ] the inversions zone pulls back on the player where the velecotiy is -x perportional to the square of the negative distance from the edge of the inversion zone
- [ ] player can pause the game
- [ ] player can quit the game from pause menu
- [ ] player can unpause the game
- [ ] when player touches the plack hole a game over screen apears and they can select retry or quit
- [ ] when player touches an asteriod a game over screen apears and they can select retry or quit


## Assets

### 2D

- sprite style: 1 bit
- resolution: NES, 265 x 240
- color 1 bit (black and white or 2-tone)

**Textures**

- [ ] scrolling stars background

**Sprites**

- [ ] Ship
- [ ] Small Asteriod
- [ ] Medium Asteriod
- [ ] Large astriod



### Code
**FX**
  - [ ] blackhole warp shader
  - [ ] inversion zone color inversion shader

**Physics**
- [ ] gravity
- [ ] player character
- [ ] black hole

**general gameplay**
- [ ] game state
- [ ] stage changer

