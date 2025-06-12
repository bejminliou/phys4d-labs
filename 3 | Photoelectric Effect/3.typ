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

#let title = [Lab 3: The Photoelectric Effect];

#let abstract = [
  This experiment investigates the photoelectric effect to determine the value of
  $frac(h c, e)$ (Planck's constant multiplied by the speed of light divided by the elementary charge), and $W$ (the work function of the phototube material). Stopping potentials $V_s$ were measured with various incident light wavelengths $lambda$ from a combination of mercury lamps and lasers. A linear relationship was observed when plotting $V_s$ against the inverse wavelength $1/lambda$, consistent with Einstein's quantum model. The experimental slope, representing $frac(h c, e)$, was found to be $1250 plus.minus 50V "nm"$. This value was compared to the accepted theoretical value of $1240$ V nm, yielding a $t'$ score of $0.2$, indicating strong agreement between the data and theory. The work function $W$ of the phototube material was determined from the y-intercept to be $1.6 plus.minus 0.1" eV"$, similar to the cesium-antimony work function of  $1.65" eV"$ with a $t'$ score of $0.5$.
  // fixed sig figs
  // added t' of work function
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

= 1. Introduction
The photoelectric effect, first observed by Heinrich Hertz in 1887, presented a significant challenge to classical physics. Hertz noticed that sparks jumped more readily across a gap when his equipment was exposed to ultraviolet (UV) light. Work by other physicists revealed that the maximum kinetic energy of ejected electrons depended on the frequency of light, not its intensity, and that a minimum frequency was required to eject electrons at all. These findings did not agree with Maxwell's classical wave theory of light. In 1905, Albert Einstein provided a physically grounded explanation by extending Max Planck's quantum hypothesis. Einstein proposed that light consists of discrete energy packets, or photons, with energy $E = h f$, where $h$ is Planck's constant and $f$ is the frequency. This model successfully explained the experimental observations of the photoelectric effect and became a cornerstone in the development of quantum mechanics, earning Einstein the Nobel Prize in Physics. This experiment aims to investigate the photoelectric effect and determine an experimental value for Planck's constant.

= 2. Background
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

#colbreak()

Rearranging this equation to solve for the stopping potential $V_s$ yields:
#mitex(`
V_s = \textcolor{blue}{\left(\frac{hc}{e}\right)}\frac{1}{\lambda} \textcolor{red}{ - \frac{W}{e}}
`)
This equation is in the form of a straight line, $y = clrblue(m) x + clrred(b)$. By plotting the stopping potential $V_s$ (y-axis) against the inverse wavelength $1/lambda$ (x-axis), a linear relationship should be observed. The slope of this line ($m$) corresponds to $frac(h c, e)$, and the y-intercept ($b$) corresponds to $-frac(W, e)$. The accepted value for the product $h c$ is approximately $1240$ eV nm. Therefore, the expected theoretical slope $frac(h c, e)$ is $1240$ V nm. The work function $W$ can be determined from the y-intercept as $W = -e dot b$.

= 3. Experiment
The experimental setup consisted of a photoelectric tube, a variable DC power supply to provide the stopping potential, and a digital multimeter (DMM) to measure this potential. The various light sources include a mercury vapor lamp and several lasers of different colors/wavelengths. For the mercury lamp, specific filters were used to isolate distinct spectral lines: no filter for the $365$ nm UV line, a blue filter for the $405$ nm line, and a green filter for the $546$ nm line. Additionally, red, green, and blue lasers with known wavelengths (red: $650$ nm, green: $532$ nm, blue: $405$ nm) were used as light sources.

For each light source, the procedure to measure the stopping potential was as follows: First, the stopping potential knob was turned fully clockwise to ensure no initial photocurrent. The zero-adjust knob on the photocurrent meter was then used to set the meter's needle to the middle of its range, as analog meters tend to be most sensitive in this region. This zeroing process was repeated before each set of measurements for a given wavelength. The stopping potential was then slowly decreased (turned counter-clockwise) until a photocurrent was just barely detected. 


This value of $V_s$ was recorded. This measurement was repeated five times for each unique wavelength.

Precautions were taken to minimize experimental errors. Since the mercury lamp and phototube were not from the same manufacturer, the lamp's height was adjusted to ensure proper alignment with the phototube aperture. Experiments were conducted in a darkened environment and the setup was covered with a light-blocking jacket to reduce light contamination from ambient sources. The intense light from the lasers required diffusion before striking the phototube to prevent saturation and potential damage. To properly diffuse the intense laser light, 16 layers of translucent tape were applied over the laser aperture before striking the phototube to prevent saturation and potential damage.

= 4. Data, Results, and Analysis
The measured stopping potentials $V_s$ for each corresponding wavelength $lambda$ were recorded. The inverse of each wavelength $1/lambda$ was calculated. These data pairs ($1/lambda$, $V_s$) were then plotted, with $V_s$ on the y-axis and $1/lambda$ on the x-axis, as shown in Figure 1.



// #pagebreak()

A linear regression analysis was performed on these data points. The slope of the best-fit line, representing the experimental value of $frac(h c, e)$, was found to be $m_"exp" = 1252.623783$ V nm with an uncertainty of $sigma_m = 50.43556022$ V nm. The experimental slope is $1250 plus.minus 50"V nm"$.

The theoretical value for $frac(h c, e)$ is $1240$ V nm. To compare the experimental value with the theoretical value, the $t'$ score was calculated 
to be $t' = 0.2$. This is significantly less than 1, indicating that the difference between the experimental and theoretical values is small relative to the experimental uncertainty. This signifies a very strong agreement between the experimental result and the accepted value for $frac(h c, e)$.


#full_width_figure("graph_v2.svg", [Stopping Potential ($V_s$) as a function of Inverse Wavelength ($1/lambda$). The solid line represents the linear best fit to the experimental data points. The equation of the fit and the $R^2$ value are shown on the graph.]);
//can we make this text smaller? line 12

The y-intercept of the linear fit was $b = -1.629582448$ V with an uncertainty of $sigma_b = 0.1107936103$ V. The y-intercept is $(-1.6 plus.minus 0.1)$ V.
The work function $W$ of the phototube material is related to the y-intercept by 


$ W = -e dot b $

Therefore, 

$ W &= -e dot (-1.629582448 "V") \ &= 1.629582448 "eV" $
The uncertainty in the work function is $sigma_W = e dot sigma_b = 0.1107936103 "eV"$.
Thus, the experimental work function is $ W = 1.6 plus.minus 0.1 "eV" $

This work function is similar to that of cesium-antimony, which is $1.65" eV"$. Using this as an expected value, the $t'$ score for the intercept was calculated to be $0.5$. This $t'$ score being less than 1 indicates a strong agreement between the work function of cesium-antimony and what the data suggests. The coefficient of determination for the linear fit was $R^2 = 0.9565779054$, or approximately $R^2 = 0.96$. An $R^2$ value close to 1 indicates that the linear model is a strong fit for the experimental data, supporting the previously derived relationship.

#colbreak()

= 5. Conclusion
This experiment successfully investigated the photoelectric effect. By measuring the stopping potential for various wavelengths of light, the relationship between photon energy, work function, and electron kinetic energy was explored. A plot of the stopping potential against the inverse wavelength yielded a linear relationship, as predicted by Einstein's quantum theory of light.
The experimental value for $frac(h c, e)$ was determined to be $1250 plus.minus 50$ V nm. This value is in agreement with the accepted theoretical value of $1240$ V nm, as evidenced by a $t'$ score of $0.2$. The work function of the material in the phototube was found to be $1.6 plus.minus 0.1 "eV"$. The phototube material used in the experiment was assumed to be cesium-antimony with a work function value of $1.65 "eV"$, indicating agreement with a $t'$ score of 0.5. The linearity of the data, confirmed by an $R^2$ value of $0.96$, further supports the validity of Einstein's photoelectric equation.

Potential sources of error in this experiment include inaccuracies in reading the exact point at which photocurrent begins, which can be subjective, and uncertainties in the stated wavelengths of the light sources or filters. Light contamination, despite precautions, could also affect measurements. Diffusing the laser light uniformly also presented challenges. Future improvements could involve using more precise methods for detecting the onset of photocurrent or using light sources with more narrowly defined and stable wavelengths. Overall, the experiment provided a successful verification of key aspects of the photoelectric effect and yielded a reasonable experimental value for $frac(h c, e)$.

#colbreak()

= References

#let reference_entry(url, title, source) = {
  [#source. "#title". #link(url)]
}

#set par(hanging-indent: 2em)

#reference_entry(
  "https://www.youtube.com/watch?v=r7k5G_6yzDw",
  "I Never Understood Why the Photoelectric Effect Changed Einstein's View of Reality… Until Now!",
  "YouTube"
)

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
  "Journal of Applied Physics, vol. 37, no. 13, Dec. 1966, pp. 4927–4935, https://doi.org/10.1063/1.1708167",
  "Cesium—Antimony Films in Equilibrium with Cesium Vapor",
  "Caulfield, H. J., and R. A. Chapman"
)

#reference_entry(
  "https://phys.libretexts.org/Bookshelves/University_Physics/University_Physics_(OpenStax)/University_Physics_III_-_Optics_and_Modern_Physics_(OpenStax)/06%3A_Photons_and_Matter_Waves/6.03%3A_Photoelectric_Effect",
  "Photoelectric Effect",
  "OpenStax University Physics III, LibreTexts, 2025"
)