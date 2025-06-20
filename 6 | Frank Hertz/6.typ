#import "@preview/mitex:0.2.5": *

#let full_width_figure(img_src, caption_text) = {
  figure(
    placement: auto,
    scope: "parent",
    image(img_src),
    kind: "Figure",
    supplement: [Figure],
    // caption: caption_text,
    caption: text(caption_text, size: 9pt)
  )
}



// --- Math Definitions ---

#let clrblue(x) = text(fill: blue, $#x$);
#let clrred(x) = text(fill: red, $#x$);

// --- Title & Abstract & Metadata ---

#let title = [Lab 6: The Franck-Hertz Effect];

#let abstract = [
 Two separate experimental setups measured current through argon and signal voltage across neon at varying grid voltages. The data for each was plotted against grid voltage to measure peak-to-peak and valley-to-valley differences in grid voltage. Plotting peak/valley voltages against their respective order numbers, the experimental slopes for argon were found to be $11.7 plus.minus 0.3V$ for peaks and $11.6 plus.minus 0.2V$ for valleys. For neon, the slopes were found to be $20 plus.minus 2V$ for peaks and $21.8 plus.minus 0.1V$ for valleys. The t'-scores between peak and valley slopes for each material are 0.277 and 0.899 respectively, signifying agreement within each set of slopes. Comparing peak-to-peak and valley-to-valley differences on the lowest energy level for argon yielded t'-scores of 0.507 and 0.260 respectively, indicating agreement between the argon data and theory. Comparing peak-to-peak and valley-to-valley differences to the lowest energy level for neon yielded t'-scores of 1.69 and 51.81 respectively, indicating inconclusiveness and disagreement between the neon data and theory. 
];

#let names = ("Benjamin Liou", "Aiden Man", "Nathan Nguyen");

// --- Formatting ---

// HEADER (top right corner)
#set page(
  paper: "us-letter",
  header: align(right + horizon, title),
  numbering: "1",
  columns: 2,
)

#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 2em,
)[
  #align(center, text(17pt)[ * #title * ])

  #grid(
    columns: (1fr, 1fr, 1fr),
    ..names.map(name => align(center)[#name]),
  )

  #par(justify: false)[
    #abstract
  ]
]

#show heading: it => block(width: 100%)[
  #set text(weight: "regular")
  #smallcaps(it.body)
]

// --- Body ---

= 1. Background
In 1914, James Franck and Gustav Hertz confirmed Bohr's theorized quantized energy levels in atoms. Their experiment directed current through a vacuum tube with low-pressure vaporized mercury, which affected the detected current. However, this observed effect only occurred at certain electron energies, later recognized to be a representation of the excitation energies of the electrons bound to mercury. Below this threshold, the interactions between electrons and mercury behave like elastic collisions, where the electrons retain most of their kinetic energy after the collision. Above this threshold, the interactions between free electrons and mercury behave more like inelastic collisions. When an electron has kinetic energy greater than or equal to the excitation energy of mercury, the kinetic energy from the electron raises one of mercury's electrons to the next energy level, resulting in a decreased current (an electron with exactly the excitation energy would collide and have a final velocity of zero). As the kinetic energies of the free electrons increase (or as voltage increases), a series of peaks and valleys will be observed when plotting the observed current against voltage. This series of peaks and valleys is due to the multiple inelastic collisions that can occur at higher electron energies. 

= 2. Theory

Plotting observed current (a representation of electron energy) against grid voltage for this experiment will yield a series of peaks and valleys, where the spacing between peaks (local maxima) and between valleys (local minima) correspond to the excitation energy of the interacting gas. A linear regression performed on the plot of the voltage at these peak voltages and the peak numbers (the order in which peaks occur) will provide a weighted average voltage difference between peaks as a slope:

#mitex(`
V_p =  c \cdot n + b
`)

$V_p$ is the peak voltage, $n$ is the peak number, and $c$ is the slope, representing a weighted average of voltage differences between peaks, $b$ is some arbitrary intercept. This procedure can likewise be applied to valleys: 

#mitex(`
V_v =  c \cdot n + b
`)

By measuring the energy of the electrons in electron-volts (eV), the induced kinetic energy of each electron is equal to 1 electron-volt per volt measured. This means the value of the weighted average voltage difference between peaks directly corresponds to the average energy difference between peaks in electron-volts. Thus, multiplying the elementary charge by the slope c yields the equation: 

#mitex(`
K_e = 1e \cdot c
`)

$K_e$ represents the excitaiton in energy in electron-volts. 
Mismatch between experimental and expected values for $K_e$ may occur due to the atom's cross-section (odds of interacting with an electron). At the energies examined in the original Frank-Hertz experiment, the cross-sections for the 4.9eV excitation are about ten times larger than those of the 4.7eV excitation. Thus, there is a greater likelihood of electrons achieving the 4.9eV inelastic collision as opposed to the 4.7eV counterpart.

= 3. Experiment
Two experimental setups were used for analyzing argon and neon separately.

== 3a. Argon

The entire setup was in a self-contained box, where the left side was a pair of meters that measure current and voltage and the right side was an array of knobs and switches. On the top row of dials and switches, the manual/auto switch was set to manual, the filament voltage dial set to $3.5V$ and the current multiplier set to $10^"-9"$. The second row of switches and dials controlled the various voltages in the circuit, with the far left switch controlling the voltage being set. Starting with the switch positioned to the left, this first voltage (to move the electrons away from the filament) was set to 1.5 volts. The switch in the middle position sets the unfortunately named "retarding voltage," and was set to 7.5 volts. The switch in the right position controls the grid voltage, otherwise known as the accelerating voltage. 

The procedure for measuring currents at varying grid voltages was as follows: the grid voltage was increased at two-volt increments from 0 volts, with each point recorded as a pair of currents and voltages up to 80 volts. Before taking data, the electronics must be allowed to warm up. When adjusting the grid voltage, a 5-second wait time was allowed for the current to settle. The current multiplier was also adjusted throughout the experiment to account for the wide range of current readings. 

== 3b. Neon

The experimental setup for neon consisted of three main components: a neon-filled vacuum tube, an instrument box that functioned as the power supply and control panel, and a digital oscilloscope. The vacuum tube was connected to the instrument box using five color-coded banana plug cables, and a BNC cable ran from the top of the tube to a corresponding connector on the upper-left section of the panel. The signal output, located on the upper-right panel, was connected to the oscilloscope using another BNC cable. To plot the signal voltage against the grid voltage, the oscilloscope was placed in XY display mode. In this mode, the voltage from channel one (X-axis) represented the grid voltage, while the voltage from channel two (Y-axis) represented the signal voltage. At the beginning of the experiment, the mode selector switch on the instrument box was set to RAMP/60Hz. The filament voltage was set to about 8 volts. Proper heating was confirmed by observing an orange glow in the filament (the filament must not appear too bright or too dull). Once the filament had warmed up, the reverse bias (retarding voltage) was set to around 4 volts. Experimenting with different values between the filament voltage, the retarding voltage, and the amplifier gain, eventually a series of settings was selected for the data being collected (a few seconds were needed after any adjustments due to thermal response lag in the filament). 

Because the oscilloscope could not directly save data in XY mode, it was temporarily switched to YT mode to record both waveforms (both must be visible to save). The resulting CSV file was later processed to reconstruct the XY display by plotting the signal voltage against the grid voltage.

= 4. Data, Results, and Analysis
The neon data plots signal voltage against grid voltage, whereas the data for argon plots current against voltage. Because of the proportionality of voltage to current via Ohm's Law ($V = I R$), peaks and valleys in both plots equivalently measure the relative electron energies following interaction with the materials. Thus, the peak/valley voltages for both gases can similarly be recorded at certain grid voltages. Within each distinct section of local extrema in these plots, the absolute peaks and valleys of each section were used to generate a plot for each peak/valley against its corresponding order number (peak number).  


// #top_width_figure("argon_voltage_vs_peak.svg", "neon_voltage_vs_peak.svg", [Grid Voltage ($V_G$) as a function of Peak Number. The solid line represents the linear best fit to the experimental data points. The equation of the fit and the $R^2$ value are as shown on the graph.], [Grid Voltage ($V_G$) as a function of Peak Number. The solid line represents the linear best fit to the experimental data points. The equation of the fit and the $R^2$ value are as shown on the graph.]);

#figure(
  placement: auto,
  scope: "parent",
  table(
    columns: (1fr, 1fr),
    stroke: 0pt,
    inset: 4pt,
    image("argon_voltage_vs_peak.svg", width: 100%),
    image("neon_voltage_vs_peak.svg", width: 100%),
  ),
  supplement: [Figure],
  caption: text(
    [Grid Voltage ($V_G$) as a function of Peak Number for argon (left) and neon (right). The solid lines represent the linear best fit to the experimental data points. The equation of the fit and the $R^2$ value are as shown on the graphs.], size: 8pt
  ),
)

A linear regression analysis was performed on each graph comparing peak values and peak numbers, or valley values and valley numbers, the slope of which represents the excitation energy of the corresponding material. For argon, the slope was $11.7 plus.minus 0.3V$ for the peaks, and $11.6 plus.minus 0.2V$ for the valleys, corresponding to excitation energy levels of $11.7 plus.minus 0.3"eV"$ for the peaks, and $11.6 plus.minus 0.2"eV"$ for the valleys. For neon, the slope was $20 plus.minus 2V$ for the peaks, and $21.8 plus.minus 0.1V$ for the valleys, corresponding to excitation energy levels of $20 plus.minus 2"eV"$ for the peaks, and $21.8 plus.minus 0.1"eV"$ for the valleys. Conducting t'-scores for comparing peaks and valleys within each material yielded a t'-score of 0.277 for argon and 0.899 for neon. These t'-scores being less than 1 signifies agreement within each set of measurements. 

According to NIST (National Institue of Standards and Technology) Atomic Spectra Database Levels Form, the lowest level argon configurations are as follows (with $3s^2 3p^6$ at 0eV): 

#table(
  columns: 3,
  align: (left),
  stroke: 0pt,
  inset: 4pt,

  table.header(
    [*Configuration*], [*J*], [*Level (eV)*], 
  ),
  [$3s^2 3p^5 (""^"2"P degree _"3/2") 4s$], [2 \ 1], [11.548 \ 11.624],
  [$3s^2 3p^5 (""^"2"P degree _"1/2") 4s$], [0 \ 1], [11.723 \ 11.828]   
)

The lowest neon configurations are as follows (with $2s^2 2p^6$ at 0eV):

#table(
  columns: 3,
  align: (center),

  stroke: 0pt,
  inset: 4pt,

  table.header(
    [*Configuration*], [*J*], [*Level (eV)*], 
  ),
  [$2s^2 2p^5 (""^"2" P degree _"3/2" ) 3s$], [2 \ 1], [16.619 \ 16.671],
  [$2s^2 2p^5 (""^"2" P degree _"1/2" ) 3s$], [0 \ 1], [16.715 \ 16.848]   
)

For argon, the strongest agreement for the peak values was exhibited in $3s^2 3p^5 (""^"2" P degree _"1/2" )4s$ for J = 0 with a level of 11.723eV. The strongest agreement for the valley values was exhibited in $3s^2 3p^5 (""^"2"P degree _"3/2") 4s$ for J = 1 with a level of 11.624eV. The lowest excitaiton level for argon 11.548eV, resulting in a t'-score of 0.507 with the peaks and 0.260 with the valleys. Both of these t'-scores indicate agreement within the standard error between the data and this expected value. 

For neon, the strongest agreement for the peak values was exhibited at $2s^2 2p^5 (""^2 P degree _"1/2") 20d$ and J = 1, with a level 21.627 eV. The strongest agreement for the valley values was exhibited at $2s^2 2p^5 (""^2 P degree _"3/2") 3d$ and J = 1, with a level of 20.025 eV. The lowest excitation level for neon is 16.619eV, resulting in a t'-score of 1.69 for the peaks and 51.81 for the valleys. The t'-score from the peaks signifies neither agreement nor disagreement, resulting in an inconclusive comparison. The t'-score of 51.81 signifies an extreme level of disagreement.  

= 5. Conclusion

The t'-scores for argon comparing the data to the lowest energy levels show agreement within the uncertainty, verifying the results of the Franck-Hertz experiment and Bohr's theory of quantized energy levels. However, the t'-scores for neon comparing the data to the lowest energy levels signify inconclusiveness and disagreement. Though the influence of atomic cross-sections and collision likelihood for certain excitation energy levels could apply to neon, it would still imply that the values should reflect those still in the lower energy levels. However, the experimental values for neon agree strongest with energy levels, far above the lowest energy configurations. In further analyzing the neon data, the t'-scores could be attributed to the deficit in the number of data points. The neon dataset consists of 3 peaks and 3 valleys, constructing each line of best fit from only 3 points. This data set contains approximately half of those in the argon dataset, with 6 peaks and 5 valleys. This shortage in data can allow coincidentally linear data to pose small uncertainties on incorrect slope values, massively skewing the resulting t'-score toward disagreement.  

To improve data collection for the neon experimental setup, the fine-tuning on the oscilloscope could be refined such that the visualizer contains at least 4 peaks and valleys. This could further be improved by using more specific methods of assigning settings in the circuit setup, making data collection more consistent and robust. 

= References

#let reference_entry(url, title, source) = {
  [#source. "#title". #link(url)]
}

#set par(hanging-indent: 2em)

#reference_entry(
  "https://physics.nist.gov/PhysRefData/ASD/levels_form.html",
  "NIST Atomic Spectra Database Levels Form",
  "National Institute of Standards and Technology"
)

#reference_entry(
  "https://foothillcollege.instructure.com/courses/32770/assignments/1007400?module_item_id=2917883",
  "Franck-Hertz",
  "David Marasco, Foothill College"
)

