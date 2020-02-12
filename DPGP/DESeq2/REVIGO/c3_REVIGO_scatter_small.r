

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
revigo.data <- rbind(c("GO:0033630","positive regulation of cell adhesion mediated by integrin", 0.081, 3.539,-6.144, 1.255,-3.5000,0.859,0.000),
c("GO:0050667","homocysteine metabolic process", 0.052,-2.561,-6.331, 1.079,-4.1209,0.852,0.000),
c("GO:0050918","positive chemotaxis", 0.271,-5.820, 2.746, 1.763,-4.7055,0.844,0.000),
c("GO:0051303","establishment of chromosome localization", 0.332,-6.176,-2.092, 1.851,-3.6016,0.853,0.000),
c("GO:0003009","skeletal muscle contraction", 0.166, 1.999, 7.139, 1.556,-3.1620,0.892,0.020),
c("GO:0001508","action potential", 0.575,-1.330,-0.577, 2.086,-1.7916,0.910,0.038),
c("GO:0030198","extracellular matrix organization", 1.030, 6.962,-0.310, 2.338,-4.0227,0.826,0.065),
c("GO:0090407","organophosphate biosynthetic process", 2.260, 2.079,-7.346, 2.679,-1.3110,0.917,0.075),
c("GO:0071526","semaphorin-plexin signaling pathway", 0.123,-1.238, 6.525, 1.431,-2.5455,0.882,0.078),
c("GO:0043069","negative regulation of programmed cell death", 4.089, 1.602, 1.991, 2.936,-1.6963,0.803,0.101),
c("GO:0010838","positive regulation of keratinocyte proliferation", 0.047, 2.082,-3.006, 1.041,-2.7072,0.858,0.142),
c("GO:0051896","regulation of protein kinase B signaling", 0.655,-1.458, 4.197, 2.143,-1.6421,0.845,0.147),
c("GO:0036314","response to sterol", 0.104,-5.362, 4.240, 1.362,-2.3004,0.923,0.185),
c("GO:0000070","mitotic sister chromatid segregation", 0.617, 7.185,-1.643, 2.117,-3.7982,0.683,0.196),
c("GO:0010770","positive regulation of cell morphogenesis involved in differentiation", 0.627, 5.249, 0.668, 2.124,-3.5778,0.656,0.196),
c("GO:1901570","fatty acid derivative biosynthetic process", 0.166,-0.802,-6.327, 1.556,-1.6362,0.899,0.203),
c("GO:0051592","response to calcium ion", 0.570,-4.613, 3.857, 2.083,-1.3650,0.925,0.213),
c("GO:1903305","regulation of regulated secretory pathway", 0.551,-5.386,-1.792, 2.068,-2.2429,0.788,0.221),
c("GO:0002313","mature B cell differentiation involved in immune response", 0.090, 5.273, 4.621, 1.301,-2.4788,0.793,0.227),
c("GO:0090382","phagosome maturation", 0.090, 6.439,-2.209, 1.301,-1.4038,0.863,0.274),
c("GO:0045124","regulation of bone resorption", 0.185, 2.465, 5.582, 1.602,-1.7079,0.851,0.274),
c("GO:0098655","cation transmembrane transport", 3.381,-6.322,-1.284, 2.853,-1.5708,0.894,0.290),
c("GO:1903508","positive regulation of nucleic acid-templated transcription", 6.515, 1.410,-5.392, 3.138,-2.3733,0.778,0.302),
c("GO:0042572","retinol metabolic process", 0.123,-2.593,-5.325, 1.431,-2.2240,0.810,0.318),
c("GO:0034394","protein localization to cell surface", 0.252,-6.276,-2.540, 1.732,-2.8988,0.893,0.340),
c("GO:0060070","canonical Wnt signaling pathway", 1.159,-1.650, 6.156, 2.389,-1.4509,0.833,0.343),
c("GO:0008645","hexose transport", 0.560,-5.720,-1.243, 2.076,-1.9756,0.877,0.346),
c("GO:0033993","response to lipid", 4.093,-4.496, 4.602, 2.936,-1.8992,0.902,0.352),
c("GO:0016050","vesicle organization", 1.425, 7.195,-1.182, 2.479,-1.4314,0.832,0.355),
c("GO:0035065","regulation of histone acetylation", 0.237, 5.388,-4.080, 1.708,-1.5708,0.777,0.359),
c("GO:0010906","regulation of glucose metabolic process", 0.527,-1.546,-6.559, 2.049,-1.6028,0.839,0.380),
c("GO:0035108","limb morphogenesis", 0.788, 5.693, 4.402, 2.223,-1.7465,0.846,0.384),
c("GO:0016202","regulation of striated muscle tissue development", 0.584, 3.973, 5.458, 2.093,-2.4788,0.776,0.387),
c("GO:0045992","negative regulation of embryonic development", 0.133, 3.385, 4.153, 1.462,-2.3847,0.819,0.392),
c("GO:0001569","branching involved in blood vessel morphogenesis", 0.195, 4.964, 5.294, 1.623,-2.0901,0.832,0.394),
c("GO:0008543","fibroblast growth factor receptor signaling pathway", 0.332,-3.580, 4.776, 1.851,-1.3787,0.839,0.398),
c("GO:0035999","tetrahydrofolate interconversion", 0.052,-2.254,-6.551, 1.079,-2.7072,0.848,0.413),
c("GO:0046683","response to organophosphorus", 0.575,-5.320, 3.575, 2.086,-1.8757,0.916,0.424),
c("GO:0045616","regulation of keratinocyte differentiation", 0.142, 4.274, 5.431, 1.491,-1.4825,0.791,0.432),
c("GO:0031532","actin cytoskeleton reorganization", 0.404, 7.270,-2.043, 1.934,-1.6516,0.776,0.433),
c("GO:0008285","negative regulation of cell proliferation", 2.849, 2.011, 0.912, 2.779,-1.5562,0.829,0.435),
c("GO:1900182","positive regulation of protein localization to nucleus", 0.594,-3.111,-2.263, 2.100,-2.0889,0.777,0.440),
c("GO:0043200","response to amino acid", 0.522,-4.941, 4.557, 2.045,-1.3559,0.913,0.451),
c("GO:0019433","triglyceride catabolic process", 0.123,-3.412,-5.965, 1.431,-1.7079,0.855,0.452),
c("GO:0090174","organelle membrane fusion", 0.708, 6.949,-1.984, 2.176,-2.2753,0.777,0.457),
c("GO:0071822","protein complex subunit organization", 5.803, 6.455,-3.181, 3.087,-2.0062,0.839,0.461),
c("GO:0019216","regulation of lipid metabolic process", 1.349,-0.983,-6.604, 2.455,-1.7645,0.837,0.495),
c("GO:0048522","positive regulation of cellular process",22.541, 2.326,-3.920, 3.677,-1.4770,0.816,0.496),
c("GO:0048523","negative regulation of cellular process",20.376, 1.656, 1.085, 3.633,-1.7676,0.837,0.497));

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
