; Configuration file for Fly-E3-Pro-v3 (firmware version 3.5)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.5.0-STM32+1 on Sat Aug 03 2024 22:26:49 GMT+0800 (Hong Kong Standard Time)

; General preferences
G90                                                        ; send absolute coordinates...
M83                                                        ; ...but relative extruder moves
M550 P"Ceramic Printer"                                    ; set printer name

; Network
M552 S1                                                    ; enable network
M586 P0 S1                                                 ; enable HTTP
M586 P1 S0                                                 ; disable FTP
M586 P2 S0                                                 ; disable Telnet

; Drives
M84 S30                                                    ; Set idle timeout

; Custom commands for 4 axis / polar configuration
; Comment out one or the other
M98 P"to4axis.g" 
; M98 P"topolar.g"

; Accelerometer
M955 P0 C"PB_2+PA_10" I46

; Input shaping
; M593 P"zvddd" F38

; Z-Probe
M558 P5 C"^xstop" H5 F2000:500 T6000 A1                    ; set Z probe type to switch and the dive height + speeds
G31 P500 X0 Y0 Z-8.5                                       ; set Z probe trigger value, offset and trigger height

; Heaters
M140 H-1                                                   ; disable heated bed (overrides default heater mapping)
M308 S0 P"e0temp" Y"thermistor" T100000 B4956 C1.587780e-7 ; configure sensor 0 as thermistor on pin e0temp
M950 H0 C"e0heat" T0                                       ; create nozzle heater output on e0heat and map it to sensor 0
M307 H0 R2.703 K0.364:0.000 D11.05 E1.35 S1.00 B0 V23.7    ; pwm config from autotune
M143 H0 S270                                               ; set temperature limit for heater 0 to 120C
M302 P1                                                    ; allow cold extrudes

; Fans
M950 F0 C"fan1"                                            ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H0 T50                                          ; set fan 0 value. Thermostatic control is turned on

M950 F1 C"!PA_7" Q50                                     ; create fan 1 on pin PA_0

; Tools
M563 P0 D0 F0 H0                                           ; define tool 0
G10 P0 X0 Y0 Z0                                            ; set tool 0 axis offsets
G10 P0 R0 S0                                               ; set initial tool 0 active and standby temperatures to 0C
T0                                                         ; select tool