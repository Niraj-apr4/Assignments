#set par(justify: true)
#set text(font:"STIX Two Text")

#set page(footer: [#line() 2026 Poster Write up])
#set document(title: [Report on Deep Learning Enhanced Background
 Oriented Schlieren for analysis of droplet Evaporation])

#title()

#align(center)[Based on Work done by Partha Dutta , & KIRAN RAJ M]
#align(center)[Name : Niraj Kumar Singh , Roll no : AM25M807]

= Introduction
The work is done to analyse the droplet evaporation after impact . This phe
nomenon involves following multiphysics
+ Coupled Fluid Motion
+ Heat Transfer and Phase Change

the surrounding vapour cloud influences the evaporation rate and so on
droplets lifetime and stability 

= Objectives
== BOS Technique
in BOS technique , the fluid we want to study is placed between a random
dot pattern and a camera ,then a picture is taken for refrence . then we take
another picture when fluid is under study and compare both pictures .  

= Setup and Methodology

== setup

+ background pattern : 20mm $times$ 20mm field of view with dot size of 0.01mm(~ 1pixel)
and 54% dot coverage
+ droplet generation and impact condition :
  + dilute acetone-water solution (1:3)
    ratio
  + diameter of droplet : 2.5mm
+ geometric Parameter of BOS
  + Z_grad : distance between background and heated substrate 
  + Z_lens : distance between lens and background  

== Methodology
+ Two BOS video at 2000fps were recorded for reference and distorted background
+ frames were extracted , merged and cropped to 512 x 512 pixels
+ displacement field were obtained using cross correlation and physics
  based CNN to improve the quallity of BOS images 
  
= Mathematical Modeling 
Based on displacemnt field , required refractive index is found out
$ (partial n)/(partial x) = c Delta x  $ $ (partial n)/(partial y) = c
Delta y $ where $ c = (n_0)/(2 z_("grad") Delta x_p)$ , where n#sub[0] is
the refractive index of air , $Delta z_p$ is the half widith of field of view
obtained from image callibration .

Based on the boundary conditon of of refractive index of air around it
refractive conditon of mixture is calculated to find out the concentration
of droplet after impact 
= Result Discussion and Conclusion 
== Comparison of resultant displacement field
 Cross corelation captures the overall droplet evaporation structure, but
spatial window averaging reduces the effective resolution and increases the
noise robustness 
==  Result and Conclusion
+ transverse droplet oscillations is observed after impact as evident in
resultant displacement field 
+ these oscillation arise due to competition between initial impact inertial,
surface tension recoil and heat induced non uniform evaporation near the
contact line on heated substrate


