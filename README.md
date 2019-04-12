# Cortex M generic startup code
This repository contains a generic Cortex M startup code with some additional supporting code for microcontrollers.
## Checking out
use ```git clone --recurse-submodules https://github.com/Squantor/CortexM_startup.git``` to clone the repo and its submodules.
## Compiling
This project uses gnu make as its build system on a Linux platform. 

As this project has support for a bunch of microcontrollers you have to pass the microcontroller type via the ```MCU=``` directive. Supported microcontrollers are:
* LPC824
* LPC812
* STM32F103C8
There are two build targets: release and debug. Release builds with optimizations and minimal debugging information. Debug builds with no optimization and full debug information.
```
$ make debug MCU=LPC824
$ make release MCU=LPC824
```
## Usage
Link with your own microcontroller project
# TODO
The following tasks are still open:
* Expanding this Readme
* Create an example
# WARNING
Work in progress, but it seems that sections for ISR's etc dont transfer in libraries, somehow. DO NOT USE!