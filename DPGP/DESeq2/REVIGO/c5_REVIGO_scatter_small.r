

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
revigo.data <- rbind(c("GO:0042534","regulation of tumor necrosis factor biosynthetic process", 0.095, 4.517,-3.097, 1.322,-3.3202,0.706,0.000),
c("GO:0072423","response to DNA damage checkpoint signaling", 0.028, 0.395, 5.379, 0.845,-1.7479,0.923,0.009),
c("GO:0060192","negative regulation of lipase activity", 0.071,-0.872, 0.126, 1.204,-1.6243,0.933,0.033),
c("GO:0002696","positive regulation of leukocyte activation", 1.880, 5.878, 2.345, 2.599,-2.9856,0.714,0.057),
c("GO:0032026","response to magnesium ion", 0.076,-1.259, 6.851, 1.230,-1.6243,0.945,0.064),
c("GO:0048259","regulation of receptor-mediated endocytosis", 0.361,-5.644,-1.576, 1.886,-2.2822,0.765,0.065),
c("GO:2000586","regulation of platelet-derived growth factor receptor-beta signaling pathway", 0.024, 4.374, 5.162, 0.778,-1.5738,0.854,0.082),
c("GO:0034382","chylomicron remnant clearance", 0.028,-1.562,-2.225, 0.845,-1.6816,0.872,0.121),
c("GO:1903726","negative regulation of phospholipid metabolic process", 0.043, 2.475,-6.280, 1.000,-1.7479,0.752,0.134),
c("GO:0032060","bleb assembly", 0.052,-5.347,-4.701, 1.079,-1.6816,0.882,0.144),
c("GO:0018149","peptide cross-linking", 0.299, 3.545,-4.367, 1.806,-2.0569,0.919,0.161),
c("GO:0002115","store-operated calcium entry", 0.076,-5.229, 2.551, 1.230,-1.6816,0.914,0.195),
c("GO:0046173","polyol biosynthetic process", 0.195, 4.401,-6.883, 1.623,-1.6243,0.873,0.202),
c("GO:0036066","protein O-linked fucosylation", 0.014, 5.287,-5.864, 0.602,-1.3557,0.870,0.202),
c("GO:0007252","I-kappaB phosphorylation", 0.071, 4.760,-4.145, 1.204,-1.5286,0.851,0.229),
c("GO:0006612","protein targeting to membrane", 0.513,-6.017, 0.010, 2.037,-1.8399,0.779,0.229),
c("GO:0001881","receptor recycling", 0.171, 3.763, 4.547, 1.568,-1.5738,0.876,0.238),
c("GO:2000379","positive regulation of reactive oxygen species metabolic process", 0.389, 6.623,-0.208, 1.919,-2.2142,0.803,0.242),
c("GO:0060267","positive regulation of respiratory burst", 0.028, 6.773,-2.103, 0.845,-1.6243,0.835,0.245),
c("GO:0051770","positive regulation of nitric-oxide synthase biosynthetic process", 0.062, 6.644,-1.378, 1.146,-1.5738,0.819,0.260),
c("GO:0010755","regulation of plasminogen activation", 0.052, 5.374,-4.695, 1.079,-1.5286,0.865,0.260),
c("GO:0030194","positive regulation of blood coagulation", 0.109, 4.262, 1.639, 1.380,-2.8343,0.678,0.266),
c("GO:2000050","regulation of non-canonical Wnt signaling pathway", 0.114, 4.127, 5.423, 1.398,-1.4879,0.832,0.266),
c("GO:0045686","negative regulation of glial cell differentiation", 0.119, 0.580,-4.999, 1.415,-1.6243,0.735,0.271),
c("GO:0000183","chromatin silencing at rDNA", 0.161,-0.611,-5.702, 1.544,-1.4879,0.746,0.274),
c("GO:0010763","positive regulation of fibroblast migration", 0.057,-2.831, 4.077, 1.114,-1.7479,0.758,0.293),
c("GO:0001325","formation of extrachromosomal circular DNA", 0.377,-3.654,-6.061, 1.903,-1.4879,0.852,0.294),
c("GO:1900225","regulation of NLRP3 inflammasome complex assembly", 0.047,-4.648,-5.604, 1.041,-1.5286,0.844,0.300),
c("GO:1903587","regulation of blood vessel endothelial cell proliferation involved in sprouting angiogenesis", 0.019, 1.761,-1.549, 0.699,-1.4879,0.832,0.301),
c("GO:1903504","regulation of mitotic spindle checkpoint", 0.066,-2.830,-5.142, 1.176,-1.7479,0.727,0.308),
c("GO:1902043","positive regulation of extrinsic apoptotic signaling pathway via death domain receptors", 0.085, 5.007, 3.572, 1.279,-1.7479,0.774,0.313),
c("GO:0070266","necroptotic process", 0.133, 1.739, 6.951, 1.462,-1.3851,0.896,0.335),
c("GO:1903960","negative regulation of anion transmembrane transport", 0.047,-4.353,-0.059, 1.041,-1.6243,0.782,0.346),
c("GO:0060294","cilium movement involved in cell motility", 0.090,-4.572, 4.671, 1.301,-1.5286,0.818,0.360),
c("GO:0099637","neurotransmitter receptor transport", 0.062,-5.728, 3.680, 1.146,-1.5286,0.898,0.367),
c("GO:0042088","T-helper 1 type immune response", 0.180,-1.546, 3.901, 1.591,-1.6816,0.881,0.379),
c("GO:0032371","regulation of sterol transport", 0.195,-5.990, 2.250, 1.623,-1.6816,0.798,0.387),
c("GO:0034501","protein localization to kinetochore", 0.076,-6.180, 3.037, 1.230,-1.4507,0.885,0.393),
c("GO:0050829","defense response to Gram-negative bacterium", 0.242, 0.708, 6.864, 1.716,-1.7153,0.884,0.412),
c("GO:0051172","negative regulation of nitrogen compound metabolic process", 7.246, 1.125,-5.940, 3.184,-1.6816,0.752,0.414),
c("GO:0031325","positive regulation of cellular metabolic process",13.187, 5.965,-0.639, 3.444,-1.5062,0.748,0.444),
c("GO:0002604","regulation of dendritic cell antigen processing and presentation", 0.038,-0.986, 3.232, 0.954,-1.6243,0.854,0.453),
c("GO:0040037","negative regulation of fibroblast growth factor receptor signaling pathway", 0.076, 2.474, 2.672, 1.230,-1.4507,0.772,0.457),
c("GO:0030799","regulation of cyclic nucleotide metabolic process", 0.651, 3.723,-6.035, 2.140,-1.6816,0.803,0.462),
c("GO:0000187","activation of MAPK activity", 0.508, 4.826,-0.637, 2.033,-1.3169,0.686,0.463),
c("GO:0051895","negative regulation of focal adhesion assembly", 0.066,-2.944,-5.994, 1.176,-1.3851,0.772,0.468),
c("GO:0000132","establishment of mitotic spindle orientation", 0.090,-5.810,-0.293, 1.301,-1.3851,0.764,0.478),
c("GO:0048268","clathrin coat assembly", 0.057,-4.951,-5.736, 1.114,-1.3851,0.906,0.478),
c("GO:0032667","regulation of interleukin-23 production", 0.038, 2.628,-1.611, 0.954,-1.6816,0.787,0.478),
c("GO:0090656","t-circle formation", 0.038,-3.207,-4.946, 0.954,-1.4879,0.814,0.479),
c("GO:0034724","DNA replication-independent nucleosome organization", 0.085,-5.763,-5.046, 1.279,-1.4166,0.914,0.485),
c("GO:0001766","membrane raft polarization", 0.038,-6.598, 0.189, 0.954,-1.6816,0.819,0.485),
c("GO:0032490","detection of molecule of bacterial origin", 0.052, 0.993, 5.707, 1.079,-1.6816,0.903,0.487),
c("GO:0016482","cytosolic transport", 0.617,-6.278, 1.734, 2.117,-1.3103,0.885,0.489),
c("GO:0043652","engulfment of apoptotic cell", 0.033,-6.574,-0.538, 0.903,-1.5738,0.842,0.489),
c("GO:1903209","positive regulation of oxidative stress-induced cell death", 0.071, 4.536, 4.022, 1.204,-1.7479,0.764,0.490),
c("GO:0071636","positive regulation of transforming growth factor beta production", 0.066, 5.426, 0.384, 1.176,-1.6243,0.739,0.497),
c("GO:0032700","negative regulation of interleukin-17 production", 0.071, 0.928,-4.504, 1.204,-1.5738,0.722,0.499));

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
