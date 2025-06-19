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

#let title = [Lab 7: Radioactive Playground];

#let abstract = [
//fixme
Two experimental setups: one analyzing the effects distance on radioactivity for different decay types, one radioactive dating cobalt-60. 
Activity was measured at varying distances for strontium-90, cobalt-60, and polonium-210. Linearizing the data by plotting ln(radioactivity) against ln(r) generates slopes of 
of $-2.37 plus.minus 0.03$, $-2.03 plus.minus 0.07$, and $3 plus.minus 1$ respectively. Compared to the 
slopes were calculated to be (), with a t'-score of (). 
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

Radioactive decay is a process in nuclear physics where atomic nuclei decay into more stable configurations. There are 3 main types of decay: alpha decay, beta decay, and gamma decay. In alpha decay, alpha particles are emitted, as a result of quantum tunneling. These alpha particles consist of two protons and two neutrons, drawing similarities from the helium nuclei. In beta decay (specifically the negative form of beta decay), neutrons are converted to protons, emitting electrons and anti-neutrinos. In gamma decay, high energy photons, otherwise known as gamma rays, are emitted as high-energy protons or neutrons relax, similar to how electrons in atoms relax and emit photons. 

Three different radioactive isotopes correspond to the different forms of radioactive decay: polonium-210 corresponds to alpha decay, strontium-90 corresponds to beta decay, cobalt-60 corresponds to gamma decay. Polonium-210 (half-life of 136 days) alpha decays into stable lead-206. Strontium-90 (half-life of 28.8 years) beta decays into yttrium-90 (half life of 64 hours), which then beta decays into either a grounded or excited state of Zirconium-90 depending on the energy of the electron being emitted. Cobalt-60 (half-life of 5.27 years) beta decays into Nickel 60 which then gamma decays. With three different forms of radiation, a geiger counter, the tool used to measure radioactivity by counting the number of ionic particles, can measure the radioactivity. 
//add more detail on geiger counters
//https://www.nrc.gov/reading-rm/basic-ref/students/science-101/what-is-a-geiger-counter.html

= 2. Theory

== 2a. Radiation and Distance: 

An inverse square relation between observed radioactivity and distance from the source follows the equation:

#mitex(`
A = \frac{c}{r^2} = c \cdot r^{-2}
`) 

$A$ is radioactivity, $r$ is distance, and $c$ is an arbitrary constant. Linearizing the equation by taking the natural logarithm of both sides simplifies to the following equation: 

#mitex(`
ln(A) = -2 \cdot ln(r) + ln(c) 
`) 

Where the relation forms a line with slope of $-2$ when plotting $ln(A)$ against $ln(r)$. This inverse square relation can be observed for beta and gamma radiation, but will not necessarily be observed in alpha decay, as alpha particles are massive and charged, meaning an increase in distance would introduce an amount of air particles that would shield the detector from reading the true radioactivity, massively reducing the reading from what was expected. 
//add more detail

== 2b. Radioactive Dating: 

//rewrite
If two radioactive samples are created with the same initial activity with one at $t = 0$ and the other at $t = T$ where $t$ is time and $T$ is the difference in time between the creation of the two samples, the following equations can be extracted:  

#mitex(`
A_0 = A_1(t=0) = A_2(t=T)
`)

#mitex(`
A_1(t) = A_0 e^{-lt}
`)

#mitex(`
A_2(t) = A_0 e^{-l(t-T)}
`)

#mitex(`
\frac {A_2} {A_1} = e^{lT}
`)

Taking the natural logarithm of both sides of the previous equation and replacing $l$ with the half-life term results in the following:

#mitex(`
T = \frac {t_{1/2}} {ln(2)} \cdot ln(\frac{A_2}{A_1})
`)

Measuring the radioactivities of the two samples and using 1925.3 days for the half-life of cobalt-60, the number of days between the creation of the samples can thus be determined.

= 3. Experiment

Two separate experiments were conducted: one measuring the relation between radioactivity and distance for various radioactive decay types, one radioactive dating the time difference between the distant creation of two cobalt-60 samples. Before taking any geiger counter measurements, a background noise measurement was taken and subtracted from each measurement to correct for any ambient radioactivity.  

== 3a. Effects of Distance

Prior to measurement, each sample was selected such that the time difference between creation and present was less than one half-life in order to allow sufficient radioactive measurement. The following procedure was performed for polonium-210 (alpha decay), strontium-90 (beta decay), and cobalt-60 (gamma decay): 

A radioactive sample was placed on the top tray of the sample holder (4cm from the counter) and the data was taken for 60 seconds. The source was then lowered one step further from the detector, each step increasing the distance by 1cm and the data was taken again. This was repeated for each step all the way down the sample holder. If the count dropped below a statistically reasonable number, the time length for the measurement was extended.


== 3b. Age of Co-60 samples

Poisson statistics state that the standard error in the count measurement is equal to the square root of the actual measurement. Thus, to reduce proportional error, the time interval was extended to 300 seconds, the approximate length of 1 Clash Royale match (considering overtime). This would result in greater counts and proportionally smaller standard errors.Selecting two samples of cobalt-60 with statistically significant time difference between creation dates, both samples were measured at the top tray of the sample holder.  
//specify dates

= 4. Data, Results, and Analysis

For the effects of distance, on radioactivity the linearized data was plotted: 

#full_width_figure("distance_graph.svg", [Natural logarithm of radioactivity vs. natural logarithm of distance for strontium-90, cobalt-60, and polonium-210. The solid line represents the linear best fit to the experimental data points. The equation of the fit and the $R^2$ value are shown on the graph.]);

The slopes for strontium-90, cobalt-60, and polonium-210 are $-2.37 plus.minus 0.03$, $-2.03 plus.minus 0.07$, $-3 plus.minus 1$ respectively. With an expected slope of -2 for the inverse square relation, the t'-scores are thus 12.3, 0.429, and 1.0 respectively. The t'-score for strontium indicates a strong disagreement, with the t'-score of 12.3 being far greater than 3. The t'-score for cobalt indicates an agreement within the uncertainty, 0.429 being less than 1. For polonium, although the error captures the expected value, yielding a t'-score of 1, the graph reveals a visually apparent non-linear fit, verfied by an $R^2$ value of 0.459. This indicates that a non-power fit would likely fit the data better. This is consistent with the theory that polonium-210, exhibiting alpha decay 

For cobalt dating, poisson statistics indicates that the uncertainty in the count is equal to the square root. Factoring that into the calculation, the difference yields $ plus.minus "days"$ compared to the expected of approximately $"days"$.
//finish

#colbreak()

= 5. Conclusion
//finish

#colbreak()

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


// https://www.energy.gov/science/doe-explainsradioactivity

// https://www.cdc.gov/radiation-emergencies/hcp/isotopes/strontium-90.html
// https://www.bfs.de/EN/topics/ion/effect/radioactive-materials/polonium/polonium_node.html
// https://www.sciencedirect.com/topics/physics-and-astronomy/strontium-90#:~:text=2.1.&text=Strontium%2D90%20is%20an%20unstable,its%20daughter%20nucleus%2C%2090Y.

// https://www.sciencedirect.com/topics/earth-and-planetary-sciences/cobalt-60#:~:text=The%20atomic%20number%20(number%20of%20protons%20in,lines%20of%20cobalt%2D60%20(1.17%20and%201.33%20MeV).

// https://openstax.org/books/university-physics-volume-3/pages/10-3-radioactive-decay
// https://openstax.org/books/university-physics-volume-3/pages/10-4-nuclear-reactions
// 
// https://www.nrc.gov/reading-rm/basic-ref/students/science-101/what-is-a-geiger-counter.html