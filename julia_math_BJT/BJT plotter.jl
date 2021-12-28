using Plots
using Base.MathConstants

gr()
β=50

# VT=kT/q  -> thermal voltage
q = 1.60217657E-19  # elementary charge in coulambs
k = 1.3806488E-23   # Bolzman constant - joules per kelvin J/K
T = 25.0            # Temperature
VT = (k * T)/q

# Ib == (Is / beta) * e^ (Vbe / VT)
# Ic == Is * e^ (Vbe / VT)
# Ic == β*Ib == β.vbe / rb; 
# Ie == Ib + Ic ==  Is * ( e^ ( Vbe/VT) * -1 )

Vi = 1.7   # volts
RE = 1.0E3   #kohms
RC = 10.0E3  #kohms
Rb = 2.6E3   #kohms

Vbe = [0.668:0.001:0.680;]  # > 0 (pnp)

Ib = Vbe./Rb

gm=β/Rb  # measured trasconductance
re=1/gm  # ideal trasconductance
A = re/RC         # ideal gain???
A_ = -RC/(re+RE)  # gain of the common-emitter amplifier
Is = 10E-13 * A   # BJT Saturation current. typ 10E-15 to 10E-12


I_c = []
I_b = []
for v in 1:length(Ib)
    IC = Is * e^(Vbe[v] / VT)
    IB = (Is / β) * e^(Vbe[v] / VT)
    insert!(I_c, v, IC)
    insert!(I_b, v, IB)
end

# a = plot(Vbe, I_c, marker = :dot, markersize=2, color = [:orange :green :red])


Vcb = [0.668:0.001:0.680;]  # > 0 (pnp)

# Dynamic operation
# Ib = (Vi - Vbe)/Rb
# Vi = 1
# Ib = (Vi - Vbe) / Rb
# escala Ic = [12,10,8,6,4,2,0]


Ib = [200.0, 160.0, 120.0, 80.0, 40.0] .* 10E-4 .* 10E-4
Vin = [0.5:0.05:0.7;]

for n in 1:length(Ib)
    # Case 1 (Current source, grounded emitter)
    Vbe = 0.7
    Vcc = 20.0
    Ib = (Vin - Vbe) / Rb
    Ic = β * Ib   # Active region == Vce > Vbe being Vbe like 0.7
    Vce = Vcc - (Ic * RC)

    # Case 2 (Biased base)
    Rc = 1000
    Re = 500
    R1 = 30000
    R2 = 10000
    Vbb = Vcc*(R2/(R1+R2))
    # Rb = R1||R2
    Rb = R2*(R1/(R1+R2))
    Ieq = (Vbb - Vbe) / ((Rb/(b+1)) + Re)
    Vce = Vcc - (Ieq * (Rc + Re))


    # Vout = Vcc - (Rc*Ic) = Vcc - Rc*Is*e^(Vin/VT)
    # Vout = Vcc .- RC*Is*e.^(Vin/VT)
    Vout = Vcc .- (RC*Ic)
end
for n in 1:length(Ib)
    # print( length(Vin)==length(Vout) )
    plot(, IC, marker = :dot, markersize=2, color = [:orange :green :red])

    # Ic=β*Ib
    # Vi = [0.7:0.001:0.9;]
    # include("bjt plotter.jl")
end