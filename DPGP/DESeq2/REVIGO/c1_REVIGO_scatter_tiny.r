

# A plotting R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800


# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );
# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );


# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","log10_p_value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0008284","positive regulation of cell proliferation", 4.055,-3.840, 6.796, 2.932,-4.3458,0.804,0.000),
c("GO:0018205","peptidyl-lysine modification", 1.534, 5.000,-4.230, 2.511,-3.9953,0.902,0.019),
c("GO:0071345","cellular response to cytokine stimulus", 2.802, 5.299, 1.359, 2.772,-2.4311,0.902,0.021),
c("GO:0015671","oxygen transport", 0.066, 2.596, 5.822, 1.176,-2.7565,0.916,0.027),
c("GO:0060192","negative regulation of lipase activity", 0.071, 1.892,-1.860, 1.204,-2.6342,0.927,0.045),
c("GO:0001990","regulation of systemic arterial blood pressure by hormone", 0.204,-2.803,-0.411, 1.643,-3.3921,0.899,0.050),
c("GO:0051983","regulation of chromosome segregation", 0.408,-0.242,-0.330, 1.940,-2.6161,0.864,0.072),
c("GO:0006027","glycosaminoglycan catabolic process", 0.081, 3.604,-2.566, 1.255,-3.7658,0.914,0.090),
c("GO:0043066","negative regulation of apoptotic process", 4.032,-3.497,-6.271, 2.929,-3.1973,0.787,0.098),
c("GO:0030198","extracellular matrix organization", 1.030,-2.083, 5.166, 2.338,-2.2437,0.866,0.101),
c("GO:0051146","striated muscle cell differentiation", 1.263,-7.246,-2.403, 2.427,-3.1629,0.756,0.104),
c("GO:0010869","regulation of receptor biosynthetic process", 0.085, 0.208,-7.075, 1.279,-2.3490,0.883,0.109),
c("GO:0010564","regulation of cell cycle process", 2.341, 0.285, 1.588, 2.694,-2.8153,0.805,0.113),
c("GO:2000050","regulation of non-canonical Wnt signaling pathway", 0.114, 5.902,-0.011, 1.398,-2.3490,0.845,0.130),
c("GO:0034501","protein localization to kinetochore", 0.076, 3.784, 5.343, 1.230,-2.2724,0.932,0.133),
c("GO:0048015","phosphatidylinositol-mediated signaling", 0.646, 6.257, 1.422, 2.137,-1.8155,0.867,0.157),
c("GO:0034724","DNA replication-independent nucleosome organization", 0.085,-0.428, 3.848, 1.279,-2.2025,0.915,0.163),
c("GO:0030261","chromosome condensation", 0.157,-1.159, 4.817, 1.531,-1.7179,0.901,0.172),
c("GO:0030540","female genitalia development", 0.090,-7.690, 1.494, 1.301,-2.7565,0.853,0.177),
c("GO:0006352","DNA-templated transcription, initiation", 0.522, 1.835,-6.645, 2.045,-1.5206,0.908,0.191),
c("GO:0009948","anterior/posterior axis specification", 0.252,-6.037,-0.886, 1.732,-1.9232,0.854,0.195),
c("GO:0006111","regulation of gluconeogenesis", 0.228,-0.268,-7.167, 1.690,-1.8775,0.869,0.203),
c("GO:0072175","epithelial tube formation", 0.708,-6.976,-1.577, 2.176,-2.8999,0.773,0.217),
c("GO:2000739","regulation of mesenchymal stem cell differentiation", 0.028,-6.360,-4.071, 0.845,-2.8999,0.812,0.219),
c("GO:0051782","negative regulation of cell division", 0.071,-3.527,-6.834, 1.204,-2.3490,0.873,0.242),
c("GO:0015669","gas transport", 0.100, 2.103, 6.233, 1.342,-2.4335,0.914,0.252),
c("GO:0001501","skeletal system development", 2.317,-7.593,-0.339, 2.689,-2.6072,0.820,0.254),
c("GO:0019216","regulation of lipid metabolic process", 1.349, 2.640,-5.991, 2.455,-1.8472,0.866,0.272),
c("GO:0010634","positive regulation of epithelial cell migration", 0.522,-4.785, 4.263, 2.045,-4.1844,0.695,0.273),
c("GO:0032092","positive regulation of protein binding", 0.394, 1.725,-1.571, 1.924,-1.7357,0.919,0.279),
c("GO:0015807","L-amino acid transport", 0.290, 1.903, 6.706, 1.792,-1.6492,0.896,0.281),
c("GO:0030879","mammary gland development", 0.712,-7.666, 0.549, 2.179,-1.6828,0.826,0.283),
c("GO:1904666","regulation of ubiquitin protein ligase activity", 0.076, 4.348,-3.634, 1.230,-1.3557,0.861,0.284),
c("GO:0031347","regulation of defense response", 2.327, 6.199,-0.362, 2.691,-1.4840,0.876,0.296),
c("GO:0042415","norepinephrine metabolic process", 0.076, 1.304,-4.613, 1.230,-2.6342,0.916,0.304),
c("GO:0043009","chordate embryonic development", 3.386,-7.378,-0.846, 2.854,-1.8155,0.807,0.309),
c("GO:0001655","urogenital system development", 1.657,-6.613,-0.399, 2.544,-1.7548,0.826,0.314),
c("GO:0051246","regulation of protein metabolic process",11.757, 3.237,-5.332, 3.394,-1.7550,0.825,0.326),
c("GO:0006936","muscle contraction", 1.273,-3.747, 0.400, 2.430,-2.0372,0.930,0.335),
c("GO:0044273","sulfur compound catabolic process", 0.119, 3.364,-0.313, 1.415,-3.5190,0.934,0.338),
c("GO:0033198","response to ATP", 0.138, 3.874, 1.470, 1.477,-2.1383,0.938,0.349),
c("GO:0045921","positive regulation of exocytosis", 0.370,-0.926, 7.071, 1.898,-2.4167,0.773,0.353),
c("GO:0019933","cAMP-mediated signaling", 0.233, 5.902, 2.086, 1.699,-1.4840,0.879,0.356),
c("GO:0051260","protein homooligomerization", 1.363,-0.247, 4.489, 2.459,-2.0549,0.888,0.361),
c("GO:0072359","circulatory system development", 4.744,-7.264,-0.159, 3.000,-2.4521,0.806,0.362),
c("GO:0060349","bone morphogenesis", 0.461,-7.125, 0.712, 1.991,-2.0234,0.805,0.369),
c("GO:0007507","heart development", 2.692,-7.069,-0.011, 2.754,-2.5632,0.793,0.370),
c("GO:0051093","negative regulation of developmental process", 4.283,-5.629,-3.298, 2.956,-1.5607,0.724,0.374),
c("GO:1902117","positive regulation of organelle assembly", 0.294,-3.276, 6.157, 1.799,-2.0220,0.788,0.381),
c("GO:0000122","negative regulation of transcription from RNA polymerase II promoter", 3.666,-0.362,-5.931, 2.888,-2.6042,0.778,0.389),
c("GO:1901362","organic cyclic compound biosynthetic process",19.151, 0.669,-6.643, 3.606,-1.3342,0.916,0.398),
c("GO:0061213","positive regulation of mesonephros development", 0.114,-6.436, 2.396, 1.398,-3.4793,0.731,0.412),
c("GO:0048732","gland development", 2.265,-6.840, 0.124, 2.679,-1.4840,0.806,0.419),
c("GO:0032456","endocytic recycling", 0.152, 1.267, 6.997, 1.519,-1.5863,0.936,0.427),
c("GO:0048667","cell morphogenesis involved in neuron differentiation", 2.498,-5.907, 0.887, 2.722,-1.8917,0.723,0.441),
c("GO:0007498","mesoderm development", 0.551,-7.262,-2.802, 2.068,-1.7936,0.842,0.442),
c("GO:0051241","negative regulation of multicellular organismal process", 4.967,-5.039,-2.437, 3.020,-1.5311,0.746,0.444),
c("GO:0006468","protein phosphorylation", 8.267, 3.999,-4.936, 3.241,-1.4934,0.885,0.445),
c("GO:0048522","positive regulation of cellular process",22.541,-3.958, 6.262, 3.677,-3.4321,0.793,0.446),
c("GO:0060341","regulation of cellular localization", 3.913, 0.571, 6.940, 2.916,-2.2166,0.832,0.451),
c("GO:0006022","aminoglycan metabolic process", 0.518, 2.582,-4.055, 2.041,-1.5009,0.927,0.459),
c("GO:0072666","establishment of protein localization to vacuole", 0.147, 2.952, 6.225, 1.505,-1.7936,0.928,0.460),
c("GO:0009968","negative regulation of signal transduction", 4.967,-1.473,-4.326, 3.020,-1.3071,0.773,0.462),
c("GO:0048762","mesenchymal cell differentiation", 0.883,-7.185,-1.284, 2.272,-2.1865,0.750,0.464),
c("GO:0045621","positive regulation of lymphocyte differentiation", 0.451,-6.345, 1.930, 1.982,-2.0234,0.675,0.465),
c("GO:0030278","regulation of ossification", 0.950,-6.897, 3.039, 2.303,-1.3133,0.822,0.479),
c("GO:1904705","regulation of vascular smooth muscle cell proliferation", 0.100, 2.604, 2.827, 1.342,-1.6492,0.906,0.482),
c("GO:0006367","transcription initiation from RNA polymerase II promoter", 0.323, 1.268,-6.837, 1.839,-1.7690,0.908,0.487),
c("GO:0006816","calcium ion transport", 1.752, 1.164, 7.158, 2.568,-1.6110,0.914,0.499));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$plot_size <- as.numeric( as.character(one.data$plot_size) );
one.data$log10_p_value <- as.numeric( as.character(one.data$log10_p_value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = log10_p_value, size = plot_size), alpha = I(0.6) ) + scale_size_area();
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$log10_p_value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ]; 
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 3 );
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);



# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
