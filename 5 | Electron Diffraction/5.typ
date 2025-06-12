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

#let title = [Lab 5: Electron Diffraction];

#let abstract = [
  An electron diffraction experiment was performed to determine Planck's constant, $h$. Two measurement techniques, a manual tape-marking method and a digital image analysis method, were compared. The primary method using digital image analysis yielded values of $h_1 = (6.4 plus.minus 0.5) times 10^(-34) " J s"$ and $h_2 = (6.6 plus.minus 0.6) times 10^(-34) " J s"$. These results are in strong agreement with the accepted value, confirmed by t'-scores of $0.46$ and $0.04$. In contrast, the manual method produced inconsistent values of $h_1 = (5.3 plus.minus 0.6) times 10^(-34) " J s"$ and $h_2 = (5.9 plus.minus 0.3) times 10^(-34) " J s"$, with t'-scores greater than 2. This comparison highlights the significant reduction in procedural uncertainty achieved through image analysis.
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

// --- Body ---

= Background

In his 1924 doctoral thesis, Louis de Broglie proposed that particles, like photons, exhibit wave-like properties, with a wavelength $lambda$ inversely proportional to their momentum $p$, given by the relation $lambda = h/p$. This hypothesis was experimentally verified by Davisson and Germer, who observed electron diffraction from a nickel crystal. This experiment replicates their findings using a thin polycrystalline carbon film as a diffraction grating.

Electrons are emitted from a heated filament and accelerated through a potential difference $V$. Using the classical work-energy theorem, the kinetic energy acquired by an electron is $e V = 1/2 m v^2$, where $e$ is the elementary charge and $m$ is the electron's mass. The resulting momentum is $p = m v = sqrt(2 e V m)$. Substituting this into de Broglie's relation yields an expression for the electron's wavelength as a function of the accelerating voltage:
#mitex(`
\lambda = \frac{h}{\sqrt{2emV}}
`)
As this electron beam passes through the carbon film, it diffracts. For a first-order diffraction peak ($n=1$) at a small angle $theta$, the condition for constructive interference is approximated by $lambda = 2d theta$, where $d$ is the spacing between atomic planes in the crystal lattice. The carbon film used has two primary lattice spacings, $d_1 = 0.123$ nm and $d_2 = 0.213$ nm, which produce two distinct diffraction rings.

Equating the two expressions for $lambda$ gives the relationship between the diffraction angle and the accelerating voltage:
#mitex(`
2d\theta = \frac{h}{\sqrt{2emV}}
`)
Rearranging this equation to match the form of a line, $y=m x+b$, shows that the diffraction angle $theta$ is linearly proportional to $V^(-1/2)$:
#mitex(`
\theta = \left(\frac{h}{2d\sqrt{2em}}\right) V^{-1/2}
`)
A plot of $theta$ versus $V^(-1/2)$ should therefore yield a straight line passing through the origin. The slope of this line can be used to calculate an experimental value for Planck's constant, $h$.

// #colbreak()

= Experiment
The experimental setup consisted of an electron diffraction tube, a high-voltage power supply, and a rheostat to control filament current. The diffraction rings were projected onto a phosphorescent screen at a distance $L = 0.13$ m from the carbon film. The accelerating voltage was varied in increments of 250 V, from a maximum of 5.00 kV down to 2.50 kV.

Two distinct methods were used to measure the diameter $D$ of the two concentric diffraction rings at each voltage step. In the first method, the positions of the ring diameters were marked by hand on a piece of clear tape placed across the curved screen. After the full range of voltages was measured, the tape was removed, laid flat, and the distances were measured with a ruler.

In the second method, a clear tape with pre-marked ruler ticks was affixed to the screen. At each voltage step, a digital photograph was taken of the diffraction rings against the ruler markings. These images were later analyzed using Fiji/Gimp software. Multiple pixel-to-meter conversion ratios were established from the ruler ticks of different regions in each image, allowing for a more objective and precise measurement of the ring diameters. The diffraction angle $theta$ for each ring was then calculated using the small-angle approximation $theta = D / (4L)$.

// #colbreak()

= Data, Results, and Analysis
The initial data was collected using the manual method, where ring diameters were marked by hand on tape. Figure 1 displays the plot of $theta$ versus $V^(-1/2)$ for this data. The analysis yielded values for Planck's constant of $h_1 = (5.3 plus.minus 0.6) times 10^(-34) " J s"$ and $h_2 = (5.9 plus.minus 0.3) times 10^(-34) " J s"$. To evaluate these results against the accepted value, $h_"acc" = 6.626 times 10^(-34) " J s"$, t'-scores were calculated. The scores were 2.15 for $h_1$ and 2.02 for $h_2$. A t'-score greater than 2 indicates a statistically significant disagreement between the experimental and accepted values. Therefore, the results from the manual method are considered inaccurate, likely due to compounding parallax and measurement errors.

#full_width_figure("Theta 2 vs. Theta 1(2).svg", [Diffraction angle $theta$ vs. inverse square root of voltage for Method 1 (Manual Marking).]);

#full_width_figure("Theta 2 vs. Theta 1(1).svg", [Diffraction angle $theta$ vs. inverse square root of voltage for Method 2 (Image Analysis).]);

To mitigate these errors, a second set of data was collected using image analysis. Figure 2 shows the corresponding plot for this improved method. The data exhibits less scatter and better linearity, particularly for the inner ring. Following the same analysis, the values for Planck's constant were determined to be $h_1 = (6.4 plus.minus 0.5) times 10^(-34) " J s"$ and $h_2 = (6.6 plus.minus 0.6) times 10^(-34) " J s"$. The corresponding t'-scores were 0.46 and 0.04, respectively. Since both scores are well below 1, they indicate a strong agreement between these experimental results and the accepted value. This quantitative comparison confirms that the image analysis technique is a more reliable and accurate method for this experiment.

// The data follows the expected linear trend. According to the derived relationship, the slope of the line in Figure 1 is equal to $h / (2d sqrt(2 e m))$. While this slope can be used to solve for $h$, a more direct method was used to find $h$ and its associated uncertainty. A linear regression was performed on the transformed data, plotting $2 d theta$ versus $(2 e m V)^(-1/2)$, where the slope of the line corresponds directly to $h$. This analysis was performed for both the inner and outer ring data sets.

// #colbreak()

= Discussion
The experimental results demonstrate a successful measurement of Planck's constant using electron diffraction. The image analysis method yielded values for $h$ that are in excellent statistical agreement with the accepted value, while the manual method proved to be unreliable. The key to this improvement was the reduction of procedural uncertainties. The manual method suffered from at least two major sources of human error: parallax error while marking the ring positions on a curved screen, and measurement error when using a ruler on the removed tape. The image analysis method mitigated these by creating a fixed reference frame (the ticks on the tape) and by delegating the measurement to software, which provides sub-pixel precision and objectivity.

Despite the success of the second method, several sources of uncertainty remain. The most significant systematic errors arise from the physical and mathematical approximations used. The formula $lambda = 2d theta$ relies on a small-angle approximation ($sin theta approx theta$). At the largest observed angles (approx $0.1$ rad or $5.7$ degrees), this approximation introduces an error of about 0.17%. Additionally, the derivation for the electron's momentum is non-relativistic. At 5.0 kV, the electron's kinetic energy is about 1% of its rest mass energy, leading to a relativistic correction factor $gamma$ of approximately 1.01. This introduces a systematic error of about 1% in the momentum calculation, which directly affects the final value of $h$.

Other potential errors include uncertainty in the manufacturer's stated values for the lattice spacings $d$ and the screen distance $L$, as well as slight fluctuations in the high-voltage supply. Random error is still present in judging the exact center of the somewhat blurry diffraction rings, even with software assistance.

To improve the experiment, several refinements could be implemented. If possible, replacing the curved screen with a flat one would eliminate the need for geometric corrections and reduce measurement distortion. A fixed camera mount would ensure consistent imaging geometry. Advanced image processing, such as fitting a circular profile to the rings and finding the peak intensity, could further reduce the uncertainty in diameter measurements. Finally, for a more precise determination, the relativistic momentum formula could be incorporated into the analysis, which would result in a non-linear relationship but provide a more fundamentally correct model.

#colbreak()

= References

#let reference_entry(url, title, source) = {
  [#source. "#title". #link(url)]
}

#set par(hanging-indent: 2em)

#reference_entry(
  "https://www.pnas.org/doi/abs/10.1073/pnas.14.8.619",
  "Reflection and Refraction of Electrons by a Crystal of Nickel",
  "C. J. Davisson and L. H. Germer, Proceedings of the National Academy of Sciences, vol. 14, no. 8, 1928"
)

#reference_entry(
  "https://royalsocietypublishing.org/doi/10.1098/rspa.1928.0022",
  "Experiments on the diffraction of cathode rays",
  "G. P. Thomson, Proceedings of the Royal Society of London, Series A, vol. 117, no. 778, 1928"
)

#reference_entry(
  "https://arxiv.org/abs/quant-ph/9911107",
  "75 Years of Matter Wave: Louis de Broglie and Renaissance of the Causally Complete Knowledge",
  "A. P. Kirilyuk, arXiv preprint quant-ph/9911107, 1999"
)

#reference_entry(
  "https://chem.libretexts.org/Courses/Grinnell_College/CHM_364%3A_Physical_Chemistry_2_(Grinnell_College)/01%3A_The_Dawn_of_the_Quantum_Theory/1.07%3A_de_Broglie_Waves_can_be_Experimentally_Observed",
  "de Broglie Waves can be Experimentally Observed",
  "LibreTexts Physical Chemistry, 2025"
)

#reference_entry(
  "https://www.lancaster.ac.uk/media/lancaster-university/content-assets/images/physics/lab-in-a-box/LabInABox_ElectronDiffraction.pdf",
  "Demonstration of Electron Diffraction",
  "University of Lancaster Physics Department Lab Manual"
)