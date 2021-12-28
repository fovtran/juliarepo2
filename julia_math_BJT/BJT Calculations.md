# BJT Catastrophe

## BJT Alpha-Beta calculation

- IE is the emitter current
- IC is the collector current
- IB­ is the base current

# Ie == Ic + Ib
# beta == Ic / Ib
# alpha == Ic / Ie
# Ic == beta x Ib 
# Ib == Ic / beta

## Derive beta from Alpha

# Ie == Ic + Ib
# Ie / Ic == Ic + Ib / Ic
# Ie / Ic == ( Ic / Ic ) + ( Ib / Ic )
# 1/alpha == 1 + ( 1 / b )
# alpha / alpha == alpha + ( alpha / beta)
# 1 == alpha + ( alpha / beta )
# 1 - alpha == alpha / beta
# beta x ( 1 - alpha) == alpha
# beta == alpha / ( 1 - alpha)


# Ir == Vbresistor / Rs
# 

## Common Base Configuration: (PNP)
### Common Base Voltage Gain

- Base is in voltage mode

V+----Rin----\    /------Rload-----gnd
              \  /
           ----º------
               |


- Av is the ratio of output voltage from input voltage

Av == Vout / Vin
Av == ( Ic x Rl ) / ( Ie x Rin ) == alpha x ( Rl / Rin )

where 
- alpha == Ic / Ie
- Rl is load Resistance
- Rin is the input resistance

example:


## Common Emitter Configuration: (NPN)
### Forward Current Gain:

- Base is in current mode

V+-----Rc----\   /------|gnd
             \ /
            -----

- Is the ratio output current. ej. 

Bf == Hfe == Ic / Ib

where
- Bf is the forward current gain
- Ic is the collector current
- Ib is the base current

#### Emitter current

- Emitter current is the collection of base and collector 

Ie == Ic + Ib
Ic == Ic / alpha
Ie == Ib / ( 1+ beta)

#### Collector current 

Ic == Bf x Ib + Iceo = Bf x Ib 
Ic == alpha x Ie
Ic == Ie - Ib

where
- Iceo is the collector to emitter leakage (open base) current

### Alpha to Beta conversion

alpha == beta / ( beta + 1)
beta == alpha / ( 1 - alpha)

## Collector to emitter voltage

Vce == Vcb + Vbe

where

- Vce is collector to emitter voltage
- Vcb is collector to base voltage
- Vbe is base to emitter voltage

## Common Collector configuration (NPN)
### Current gain

            Vout
            |
V+---\   /----Re----|gnd
      \ /
     ------

- Current gain Ai of common collector is given by the ratio of
- output current Ie in respect to input current

Ie == Ic + Ib
Ai == Ie / Ib
Ai == ( Ic + Ib ) / Ib
Ai == ( Ic / Ib ) +1 
Ai == beta + 1


----------------------
Common emitter: base is the input, collector is the output, emitter is the bias voltage; inverted output, very high gain, strong temperature dependence, strong dependence on bias current, low input dynamic range, strong distortion outside this range. Common base: emitter is the input, collector is the output, base is the ground; very low input impedance, high stability, good input isolation from output feedback, low gain.
