Vulkan Grass Rendering
==================================

**University of Pennsylvania, CIS 5650: GPU Programming and Architecture, Project 5**

* Michael Rabbitz
  * [LinkedIn](https://www.linkedin.com/in/mike-rabbitz)
* Tested on: Windows 10, i7-9750H @ 2.60GHz 32GB, RTX 2060 6GB (Personal)

![](img/grass.gif)

## Part 1: Introduction

This project is an implementation of techniques described in [Responsive Real-Time Grass Rendering for General 3D Scenes](https://www.cg.tuwien.ac.at/research/publications/2017/JAHRMANN-2017-RRTG/JAHRMANN-2017-RRTG-draft.pdf), using Vulkan to build an efficient grass simulator and renderer. Grass blades are represented as Bezier curves, with compute shaders handling the physics and culling processes, while graphics shaders manage the rendering. The goal is to achieve realistic, performance-efficient grass rendering suitable for real-time applications.

The base code includes a basic Vulkan setup with a compute pipeline and graphics pipelines. This implementation focuses on developing the shaders for the grass compute and graphics pipelines, along with custom descriptor bindings necessary to manage data between these pipelines.

## Part 2: Simulating Forces

### No Forces
![](img/no_forces.PNG)

### Gravity

![](img/gravity.PNG)

### Recovery

![](img/gravity_recovery.PNG)

### Wind

![](img/grass.gif)

## Part 3: Culling Tests

### Orientation Culling

### View-Frustum Culling

### Distance Culling

## Part 4: Performance Analysis
