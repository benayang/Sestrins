

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
revigo.data <- rbind(c("GO:0006383","transcription from RNA polymerase III promoter", 0.204, 1.288, 1.135, 1.643,-2.9337,0.910,0.000),
c("GO:0043388","positive regulation of DNA binding", 0.252,-1.280,-5.486, 1.732,-2.6401,0.902,0.000),
c("GO:0046323","glucose import", 0.347, 6.275,-0.935, 1.869,-4.4306,0.824,0.000),
c("GO:0048332","mesoderm morphogenesis", 0.347,-6.269,-3.473, 1.869,-2.5887,0.883,0.025),
c("GO:0007088","regulation of mitotic nuclear division", 0.693, 3.686,-5.557, 2.167,-2.3828,0.818,0.043),
c("GO:0007215","glutamate receptor signaling pathway", 0.366,-1.166, 4.293, 1.892,-1.4996,0.868,0.059),
c("GO:0010665","regulation of cardiac muscle cell apoptotic process", 0.142,-2.786,-7.114, 1.491,-1.3409,0.899,0.068),
c("GO:0090399","replicative senescence", 0.043,-4.812,-4.550, 1.000,-2.5038,0.905,0.140),
c("GO:2000501","regulation of natural killer cell chemotaxis", 0.038, 3.080, 4.868, 0.954,-2.9131,0.702,0.142),
c("GO:0006586","indolalkylamine metabolic process", 0.052,-0.976,-2.325, 1.079,-1.3409,0.935,0.147),
c("GO:0005513","detection of calcium ion", 0.033, 6.001, 3.473, 0.903,-2.3565,0.934,0.148),
c("GO:0030199","collagen fibril organization", 0.190, 2.329,-6.443, 1.613,-1.6751,0.898,0.168),
c("GO:0043588","skin development", 1.296,-6.816,-1.954, 2.438,-1.4355,0.897,0.202),
c("GO:0042796","snRNA transcription from RNA polymerase III promoter", 0.028, 1.026,-0.121, 0.845,-3.0570,0.887,0.212),
c("GO:0060307","regulation of ventricular cardiac muscle cell membrane repolarization", 0.076, 4.671, 0.061, 1.230,-2.2917,0.762,0.255),
c("GO:0055067","monovalent inorganic cation homeostasis", 0.622,-4.675, 0.952, 2.121,-1.7652,0.895,0.256),
c("GO:0001771","immunological synapse formation", 0.066, 2.529, 6.938, 1.176,-1.3409,0.894,0.256),
c("GO:0043410","positive regulation of MAPK cascade", 2.061,-1.955, 5.115, 2.638,-2.7204,0.689,0.266),
c("GO:0086091","regulation of heart rate by cardiac conduction", 0.147,-5.871, 0.677, 1.505,-1.5222,0.844,0.270),
c("GO:0006897","endocytosis", 3.186, 6.676,-0.005, 2.827,-1.7743,0.872,0.274),
c("GO:0051029","rRNA transport", 0.028, 6.687,-1.073, 0.845,-1.3409,0.877,0.276),
c("GO:0061668","mitochondrial ribosome assembly", 0.019, 1.962,-6.531, 0.699,-1.3409,0.931,0.277),
c("GO:0003180","aortic valve morphogenesis", 0.033,-6.902,-2.979, 0.903,-1.3409,0.896,0.279),
c("GO:0042149","cellular response to glucose starvation", 0.218, 1.021, 6.837, 1.672,-1.5698,0.863,0.293),
c("GO:0030865","cortical cytoskeleton organization", 0.180, 2.577,-5.274, 1.591,-1.6751,0.923,0.293),
c("GO:0036294","cellular response to decreased oxygen levels", 0.584, 4.831, 5.087, 2.093,-2.8135,0.869,0.295),
c("GO:0006613","cotranslational protein targeting to membrane", 0.085, 5.329,-2.762, 1.279,-1.4472,0.817,0.300),
c("GO:0034645","cellular macromolecule biosynthetic process",21.549, 0.186, 1.767, 3.657,-2.0993,0.886,0.304),
c("GO:0010470","regulation of gastrulation", 0.199,-7.057,-0.766, 1.633,-2.2917,0.840,0.321),
c("GO:0008284","positive regulation of cell proliferation", 4.055,-5.513, 5.378, 2.932,-1.3236,0.827,0.326),
c("GO:0010467","gene expression",23.629,-1.535, 0.689, 3.697,-1.8247,0.940,0.342),
c("GO:0045429","positive regulation of nitric oxide biosynthetic process", 0.176,-4.215, 4.778, 1.580,-1.7978,0.797,0.344),
c("GO:0006661","phosphatidylinositol biosynthetic process", 0.294, 1.078, 3.380, 1.799,-1.3902,0.874,0.353),
c("GO:0034350","regulation of glial cell apoptotic process", 0.043,-2.462,-7.153, 1.000,-1.3409,0.906,0.358),
c("GO:0002922","positive regulation of humoral immune response", 0.071,-2.179, 6.809, 1.204,-1.3409,0.806,0.390),
c("GO:0010717","regulation of epithelial to mesenchymal transition", 0.351,-6.584,-1.449, 1.875,-1.8001,0.819,0.397),
c("GO:0002579","positive regulation of antigen processing and presentation", 0.047,-2.668, 7.142, 1.041,-1.3409,0.845,0.407),
c("GO:0045600","positive regulation of fat cell differentiation", 0.266,-6.776, 1.820, 1.756,-1.4356,0.811,0.412),
c("GO:0031622","positive regulation of fever generation", 0.033,-4.698, 3.091, 0.903,-1.3409,0.746,0.430),
c("GO:0050804","modulation of synaptic transmission", 1.439,-2.370, 5.384, 2.483,-2.4203,0.809,0.434),
c("GO:0071345","cellular response to cytokine stimulus", 2.802, 4.522, 4.890, 2.772,-1.5854,0.862,0.441),
c("GO:0048522","positive regulation of cellular process",22.541,-5.087, 5.375, 3.677,-1.6986,0.813,0.446),
c("GO:0061448","connective tissue development", 1.225,-5.900,-3.400, 2.413,-1.6474,0.917,0.446),
c("GO:0071822","protein complex subunit organization", 5.803, 2.996,-5.970, 3.087,-1.3228,0.918,0.450),
c("GO:0048545","response to steroid hormone", 1.653, 5.624, 4.374, 2.543,-1.4776,0.911,0.462),
c("GO:0051956","negative regulation of amino acid transport", 0.043, 6.018,-0.203, 1.000,-1.3409,0.807,0.467),
c("GO:0043516","regulation of DNA damage response, signal transduction by p53 class mediator", 0.147,-0.211, 6.596, 1.505,-1.7978,0.785,0.469),
c("GO:0045026","plasma membrane fusion", 0.161, 4.630,-4.358, 1.544,-1.3409,0.895,0.473),
c("GO:0043547","positive regulation of GTPase activity", 2.384,-0.999,-5.064, 2.702,-2.4109,0.901,0.487),
c("GO:0051216","cartilage development", 0.912,-6.350,-2.490, 2.286,-1.3057,0.884,0.493),
c("GO:0033043","regulation of organelle organization", 4.796, 3.376,-5.209, 3.005,-1.9341,0.854,0.498));

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
