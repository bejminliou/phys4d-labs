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

Radioactive decay is a fundamental process in nuclear physics where atomic nuclei decay into more stable configurations. 

Of these, there are 3 main kinds: alpha decay, beta decay, and gamma decay. 

In alpha decay, alpha particles are emitted. These alpha particles consist of 2 protons and 2 neutrons, drawing simiilarities from the helium nuclei. 

In beta decay, neutrons are converted to protons, emitting electrons and anti-neutrinos. 

In gamma decay, high energy photons, or gamma rays, are emitted. 
Decay, beta decay, alpha, gamma, bit of background in isotopes relation to decay


Strontium-90 beta decays into Yttrium-90 with a half-life of 28.8 years, which with a half life of 64 hours, beta decays into either a grounded or excited state of Zirconium-90 depending on the energy of the electron being emitted. 


which is stable. 

Cobalt 60 beta decays into Nickel 60 which then gamma decays into (). 

Polonium 210 alpha decays into the stable Lead 206 with a half life of 136 days

= 2. Theory

Inverse square relation to count and everything

Radiation and Distance: 

Carbon Dating: 

Poisson had a relation that

bruh


Dating: 

Suppose two radioactive samples are created with the same initial activity, one at t=0 and the other at t=T.  We can write A0 = A1(t=0) = A2(t=T).  We can additionally write:

A1(t) = A0 e^(-lt)

A2(t) = A0 e^(-l(t-T))

We can take the ratio A2/A1 = e^(lT), then take the natural log of both sides, and replace l to get:

$T = t1/2 / ln(2) * ln(A2/A1)$

If we measure the activities of samples 1 & 2, and use 1925.3 days for t1/2 for Co-60, we can determine the number of days between the creation of samples 1 & 2.


= 3. Experiment
Two experiments were conducted, Once
measuring the relationradioactivity as a function of distance, the other dating the () between cobalt-60 based on something

== 3a. Effects of Distance

//rewrite
When people try to reduce their exposure to radioactivity, distance from the source is one of the most important factors. With no sources, take data to determine the level of background radiation.  Once this is complete, place a radioactive source on the top tray of the sample holder (distance = 4cm) and take data for one minute. Move the source down one step from the detector (an additional 1cm) and observe how the counts drop as a function of distance.  Repeat all the way down the sample holder.  If your counts drop below a statistically reasonable number, measure for more than a minute. Plot the counts (corrected for background) in an appropriate way to verify the 1/r2 relationship in your lab report and comment. Do this for a beta source and a gamma source. You should also do an alpha source (note, this needs to be placed label side down in the holder). The results for alpha are very different. Why?

== 3b. Age of Co-60 samples

//rewrite
At this station we will verify the age of an older sample of Co-60.  While a half life measurement ideally has lots of measurements and a curve fit, estimating the age of a radioactive sample often involves just looking at the sample itself and a known standard.  Note that conceptually a carbon-14 dating is much the same as what we’ll do in this exercise

We’ll use two Co-60 samples in this measurement, one from a long time ago, one more current, which acts as a standard.  Note that while both are marked as being 1.0mC, this is +/-5%, so given that there are two of them, the overall uncertainty is at least +/- 7.1%, before any other factors are considered. 


= 4. Data, Results, and Analysis


#colbreak()

= 5. Conclusion

Somethign
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