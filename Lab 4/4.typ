#import "@preview/mitex:0.2.5": *

#let full_width_figure(img_src, caption_text) = {
  pagebreak()
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

#let title = [Lab 4: The Modern Photoelectric Effect];

#let abstract = [
   Current $I$ was plotted against applied voltage $"V"$ with various colored LEDs. For each color LED, a knee voltage $"V"_k$ was determined by tracing the linear portion of the graph back to the x-axis. The wavelength of each color LED was determined by applying a small angle approximation to distance between diffraction peaks with an image editing software. A linear relationship was observed when plotting $V_k$ against the inverse wavelength $1/lambda$, consistent with Einstein's quantum model. The experimental slope, representing $frac(h c, e)$, was found to be $1400 plus.minus $400V nm. This value was compared to the accepted theoretical value of $1240$V $ "nm"$, yielding a t'-score of $0.4$, indicating agreement within the uncertainty between the data and the value based on theory.
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
The photoelectric effect, first observed by Heinrich Hertz in 1887, presented a significant challenge to classical physics. Hertz noticed that sparks jumped more readily across a gap when his equipment was exposed to ultraviolet (UV) light. Work by other physicists revealed that the maximum kinetic energy of ejected electrons depended on the frequency of light, not its intensity, and that a minimum frequency was required to eject electrons at all. These findings did not agree with Maxwell's classical wave theory of light. In 1905, Albert Einstein provided a physically grounded explanation by extending Max Planck's quantum hypothesis. Einstein proposed that light consists of discrete energy packets, or photons, with energy $E = h f$, where $h$ is Planck's constant and $f$ is the frequency. This model successfully explained the experimental observations of the photoelectric effect and became a cornerstone in the development of quantum mechanics, earning Einstein the Nobel Prize in Physics. This experiment aims to investigate the photoelectric effect and determine an experimental value for Planck's constant.

// == 2.1 Theory
Einstein's model of the photoelectric effect poses that when a photon strikes a metal surface, it can transfer its energy to an electron. For an electron to escape the metal, it must overcome an energy barrier (characteristic to the material) known as the work function ($W$). If the photon's energy ($h f$) is less than the work function, no electron is emitted. If $h f$ exceeds $W$, the electron is ejected, and the excess energy appears as the electron's kinetic energy ($K E_"max"$):
#mitex(`
KE_{max} = hf - W
`)
The kinetic energy of these photoelectrons can be determined by applying a reverse potential difference, called the stopping potential ($V_s$), sufficient to prevent any electrons from reaching the collector, reducing the photocurrent to zero. At this point, the work done by the electric field equals the maximum kinetic energy of the photoelectrons: $e V_s = K E_"max"$, where $e$ is the elementary charge.
Substituting this into Einstein's equation gives:
#mitex(`
eV_s = hf - W
`)
Since the frequency $f$ is related to the wavelength $lambda$ by $f = c / lambda$, (where $c$ is the speed of light), the equation can be rewritten as:
#mitex(`
eV_s = \frac{hc}{\lambda} - W
`)

Rearranging this equation to solve for the stopping potential $V_s$ yields:
#mitex(`
V_s = \textcolor{blue}{\left(\frac{hc}{e}\right)}\frac{1}{\lambda} \textcolor{red}{ - \frac{W}{e}}
`)
For light emitting diodes (LEDs), this equation can be rewritten by replacing $V_s$ with the minumum voltage at which an LED begins to conduct significantly and emit light (knee voltage $V_k$).
#mitex(`
V_k = \textcolor{blue}{\left(\frac{hc}{e}\right)}\frac{1}{\lambda} \textcolor{red}{ - \frac{W}{e}}
`)
 This equation is in the form of a straight line, $y = clrblue(m) x + clrred(b)$. By plotting the knee voltage $V_k$ (y-axis) against the inverse wavelength $1/lambda$ (x-axis), a linear relationship should be observed. The accepted value for the product $h c$ is approximately 1240$"eV nm"$.


= 2. Experiment
The first part of the experimental setup consisted of a function generator and a series circuit consisting of an LED combined with a $100 Omega$ resistor. The colors of LEDs included red, green, blue, and yellow.

The procedure to measure the current as a function of applied voltage was as follows: First, the function generator was set to a positive ramp with a frequency of $0.25$ $"Hz"$ to create a slowly rising linear voltage. Second, the voltage was applied to the series circuit to obtain a current.

This value of $"I"$ was recorded and the measurement was repeated for each LED color.

The second part of the experiental setup consisted of the same LEDs, a red laser pointer of known wavelength $620"nm"$, a diffraction grating, and a phone camera.

For each LED color, a diffraction grating was placed in front of the phone camera to obtain an image of the LED. The same process was done with the red laser pointer. Using an image editing software, the distance from the peak of the light source to the peak of its diffraction $"d"$ was measured in pixels ($"px"$).

Precautions were taken to minimize experimental errors. Experiments were conducted in a darkened environment to reduce light contamination from ambient sources.

= 3. Data, Results, Analysis

The measured currents $I$ for each color LED were recorded and plotted against the applied voltage. Another graph with the same axes was created to account for voltage across the resistor by subtracting $100 Omega $ times $I$ from the applied voltage. Knee voltages $"V"_k$ were determined by tracing the linear portion of each graph back to the x-axis. The value of $"V"_k$ determined for each color LED were as followed:

#mitex(`
Blue: 2.50V
`)
#mitex(`
Red: 1.95V
`)
#mitex(`
Green: 2.29V
`)
#mitex(`
Yellow: 1.82V
`)

The diffraction of the $650"nm"$ red laser was used to calibrate pixel measurements.

#mitex(`
\frac{\lambda_{laser}}{d_{laser}}  = \frac{650nm}{431px} = 1.508 ~nm/px
`)

The subsequent diffraction peak measurements for each color LED in pixels were multiplied by this value of $1.508 "nm/px"$ to obtain the wavelength $lambda$ of its color. The calculated $lambda$ for each color LED were as followed:

#mitex(`
Blue = 460nm
`)
#mitex(`
Red = 627nm
`)
#mitex(`
Green = 538nm
`)
#mitex(`
Yellow = 593nm
`)
The inverse of each wavelength $1/lambda$ was then calculated. These data pairs ($1/lambda$, $V_k$) were then plotted, with $V_k$ on the y-axis and $1/lambda$ on the x-axis, as shown in Figure 1 below.
#full_width_figure("Knee Voltage vs. 1_Wavelength.svg", [Stopping Potential ($V_s$) as a function of Inverse Wavelength ($1/lambda$). The solid line represents the linear best fit to the experimental data points. The equation of the fit and the $R^2$ value are shown on the graph.]);
// how can i make this fit under the calculated lambda and have it only in one column



= 4. Conclusion

The experimental value for $frac(h c, e)$ was determined to be $1400 plus.minus 400$ V nm. This value is in agreement with the accepted theoretical value of $1240$ V nm, as evidenced by a $t'$ score of $0.4$.

Potential sources of error in this experiment include inaccuracies in reading the exact point at which photocurrent begins and diffraction peaks, which can be subjective. Light contamination, despite precautions, could also affect measurements. Future improvements could involve using more precise methods for detecting the onset of photocurrent and diffraction peaks. Overall, the experiment provided a successful verification of key aspects of the photoelectric effect and yielded a reasonable experimental value for $frac(h c, e)$.

= References

#let reference_entry(url, title, source) = {
  [#source. "#title". #link(url)]
}

#set par(hanging-indent: 2em)

#reference_entry(
  "https://link.aps.org/doi/10.1103/PhysRev.7.355",
  "A Direct Photoelectric Determination of Planck's \"h\"",
  "R.A. Millikan, Physical Review, 1916"
)

#reference_entry(
  "https://w3.iihe.ac.be/~aguilar/PHYS-F-210/Keesing-EurJPhys2-0143-0807_2_3_003.pdf",
  "The measurement of Planck's constant using the visible photoelectric effect",
  "R.G. Keesing, European Journal of Physics, 1981"
)

#reference_entry(
  "https://avanguardieducativedavincisgf.wordpress.com/wp-content/uploads/2016/02/wjce-3-4-2.pdf",
  "Experimental determination of Planck's constant using Light Emitting Diodes (LEDs) and Photoelectric Effect",
  "Andrea Checchetti and Alessandro Fantini, World Journal of Chemical Education, 2015"
)

#reference_entry(
  "https://phys.libretexts.org/Bookshelves/University_Physics/University_Physics_(OpenStax)/University_Physics_III_-_Optics_and_Modern_Physics_(OpenStax)/06%3A_Photons_and_Matter_Waves/6.03%3A_Photoelectric_Effect",
  "Photoelectric Effect",
  "OpenStax University Physics III, LibreTexts, 2025"
)