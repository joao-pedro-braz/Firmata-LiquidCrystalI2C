# Firmata-LiquidCrystalI2C
Extension to the Pharo's implementation of Firmata (robvanlopik's fork) that adds support for i2c-enabled LCD panels.

## Installation

To load the latest version of Firmata-LiquidCrystalI2C you can evaluate the following expression in playground:

```
Metacello new
  baseline: 'FirmataLiquidCrystalI2C';
  repository: 'github://joao-pedro-braz/Firmata-LiquidCrystalI2C:main';
  load
```

## How to use

Most of this implementation is based off [johnrickman's LiquidCrystalI2C library](https://www.arduino.cc/reference/en/libraries/liquidcrystal-i2c/), which in turn is based off [Arduino's LiquidCrystal library](https://www.arduino.cc/reference/en/libraries/liquidcrystal/). Because I made sure to keep the APIs as compatible as possible, if you have any questions that aren't covered here, go check them out, chances are whatever you need to do have a compatible example there!

One can initiate a connection to the I2C-enabled LCD panel by doing:
```
firmata := Firmata onPort: '/dev/ttyACM0' baudRate: 57600.

firmataLcd := firmata lcdAt: 16r27 withColumns: 16 andRows: 2.
firmataLcd init.
```
We first need an instance of Firmata, which we get by calling `Firmata class>>#onPort:baudRate:`, after that we can send the         extension message `Firmata>>#lcdAt:withColumns:andRows:` to said instance (with the address, number of columns and number of rows your LCD panel has) and get back a `FirmataLiquidCrystalI2C`, which is the     main class of this package.
Remember to call `FirmataLiquidCrystalI2C>>#init` to ready the LCD panel (See also `FirmataLiquidCrystalI2C>>#init:` and `FirmataLiquidCrystalI2C>>#begin`).

With the LCD panel initiated, the World's your oyster.
You can then do things like:

- Print 'Hello World':
```
firmataLcd print: 'Hello World'.
"Or using a Collection"
firmataLcd print: #( $h $e $l $l $o $ $W $o $r $l $d ).
```
- Print Characters, such as `a`:
```
firmataLcd print: $a.
```
- Print Numbers, in any base:
```
firmataLcd print: 15.5.
firmataLcd print: 15 base: 16.
```
- Make the cursor blink/not blink:
```
firmataLcd enableBlink. "or using the alias: `firmataLcd blink.`" 
firmataLcd disableBlink. "or using the alias: `firmataLcd noBlink.`"
```
- Enable/disable auto scrolling:
```
firmataLcd enableAutoscroll. "or using the alias: `firmataLcd autoscroll.`" 
firmataLcd disableAutoscroll. "or using the alias: `firmataLcd noAutoscroll.`" 
```
- Enable/disable backlight:
```
firmataLcd enableBacklight. "or using the alias: `firmataLcd backlight.`" 
firmataLcd disableBacklight. "or using the alias: `firmataLcd noBacklight.`" 
```
- Scroll the display to either left or right:
```
firmataLcd scrollDisplayLeft.
firmataLcd scrollDisplayRight.
```
- Set LTR or RTL writing mode:
```
firmataLcd rightToLeft.
firmataLcd leftToRight.
```
- Clear the whole buffer:
```
firmataLcd clear.
```
- Move the cursor to the home row/column:
```
firmataLcd home.
```
- Move the cursor to a specific row/column:
```
firmataLcd setCursor: 14@1.
```
- Save custom characters to the LCD memory and print them:
```
charMap := FirmataLiquidCrystalI2CCharMap newFrom: #(
   2r11111
   2r10000
   2r10000
   2r11111
   2r00001
   2r00001
   2r00001
   2r11111
).
firmataLcd saveCustomChar: charMap at: 1.
"Remember to move the cursor to the desired position after saving your custom characters"
firmataLcd home.
firmataLcd sendData: 1. "Or the alias, `firmataLcd write: 1.`"
```
