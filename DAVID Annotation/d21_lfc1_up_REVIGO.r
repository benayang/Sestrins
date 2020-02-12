

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
revigo.data <- rbind(c("GO:0009612","response to mechanical stimulus", 0.973, 3.139,-6.924, 2.314,-1.7448,0.891,0.000),
c("GO:0030199","collagen fibril organization", 0.190,-3.622, 1.525, 1.613,-3.5575,0.868,0.000),
c("GO:0044406","adhesion of symbiont to host", 0.066,-5.440,-2.800, 1.176,-1.5377,0.944,0.000),
c("GO:0045907","positive regulation of vasoconstriction", 0.166, 2.308, 2.815, 1.556,-3.3716,0.695,0.022),
c("GO:0007569","cell aging", 0.423, 7.045,-3.073, 1.954,-2.3672,0.815,0.067),
c("GO:0071498","cellular response to fluid shear stress", 0.090,-2.524,-1.288, 1.301,-1.3200,0.895,0.084),
c("GO:0042493","response to drug", 1.899,-0.854,-6.032, 2.603,-1.6084,0.867,0.114),
c("GO:0003417","growth plate cartilage development", 0.081, 7.281, 1.952, 1.255,-1.5377,0.763,0.149),
c("GO:0070374","positive regulation of ERK1 and ERK2 cascade", 0.836,-2.962, 4.163, 2.248,-2.4817,0.703,0.187),
c("GO:0016485","protein processing", 1.073,-5.717, 1.758, 2.356,-1.4933,0.919,0.221),
c("GO:0048266","behavioral response to pain", 0.104, 5.992, 3.860, 1.362,-1.1781,0.799,0.221),
c("GO:0019800","peptide cross-linking via chondroitin 4-sulfate glycosaminoglycan", 0.038,-6.205, 1.350, 0.954,-1.5882,0.864,0.234),
c("GO:0001649","osteoblast differentiation", 1.007, 6.556,-0.855, 2.328,-1.2791,0.757,0.263),
c("GO:0071333","cellular response to glucose stimulus", 0.613,-0.525,-4.754, 2.114,-2.7929,0.756,0.273),
c("GO:0014902","myotube differentiation", 0.518, 7.393,-2.441, 2.041,-1.2671,0.806,0.278),
c("GO:0008284","positive regulation of cell proliferation", 4.055,-1.301, 6.698, 2.932,-2.0815,0.770,0.289),
c("GO:0006508","proteolysis", 7.873,-5.929, 2.494, 3.220,-1.3878,0.913,0.291),
c("GO:0016525","negative regulation of angiogenesis", 0.385, 6.142, 2.407, 1.914,-2.7754,0.658,0.307),
c("GO:0007605","sensory perception of sound", 0.674, 2.401,-2.335, 2.155,-1.9848,0.847,0.310),
c("GO:0007399","nervous system development",10.304, 6.133, 0.434, 3.337,-1.4622,0.714,0.315),
c("GO:0007588","excretion", 0.218, 1.052,-1.938, 1.672,-1.3200,0.858,0.318),
c("GO:0007596","blood coagulation", 0.864, 3.564, 0.309, 2.262,-1.5121,0.741,0.318),
c("GO:0030335","positive regulation of cell migration", 1.866, 0.399, 5.263, 2.595,-1.5433,0.712,0.321),
c("GO:0034103","regulation of tissue remodeling", 0.332, 5.796, 4.622, 1.851,-1.8864,0.780,0.326),
c("GO:2000379","positive regulation of reactive oxygen species metabolic process", 0.389,-2.395, 6.158, 1.919,-1.0158,0.823,0.340),
c("GO:0002092","positive regulation of receptor internalization", 0.119,-0.973, 5.389, 1.415,-1.0730,0.764,0.358),
c("GO:0034612","response to tumor necrosis factor", 0.888,-0.744,-6.323, 2.274,-1.1051,0.852,0.361),
c("GO:0010575","positive regulation of vascular endothelial growth factor production", 0.119, 3.074, 4.989, 1.415,-2.5593,0.734,0.377),
c("GO:0051926","negative regulation of calcium ion transport", 0.223, 2.077, 7.760, 1.681,-1.5377,0.882,0.380),
c("GO:0006518","peptide metabolic process", 3.618,-6.404,-0.377, 2.883,-1.3493,0.914,0.389),
c("GO:0071560","cellular response to transforming growth factor beta stimulus", 0.926,-1.863,-5.114, 2.292,-1.7713,0.811,0.438),
c("GO:0050919","negative chemotaxis", 0.119, 1.162,-5.411, 1.415,-1.0887,0.818,0.455),
c("GO:0030154","cell differentiation",18.534, 7.134,-1.468, 3.592,-1.3864,0.740,0.473),
c("GO:0030307","positive regulation of cell growth", 0.670,-0.647, 5.837, 2.152,-1.4572,0.778,0.484),
c("GO:0007155","cell adhesion", 6.605,-5.570,-2.967, 3.144,-3.7721,0.946,0.504),
c("GO:0003151","outflow tract morphogenesis", 0.361, 7.228, 1.138, 1.886,-1.8718,0.721,0.519),
c("GO:0001938","positive regulation of endothelial cell proliferation", 0.304,-1.766, 6.921, 1.813,-1.6946,0.810,0.542),
c("GO:0071300","cellular response to retinoic acid", 0.266,-1.956,-5.471, 1.756,-1.7193,0.829,0.546),
c("GO:0071636","positive regulation of transforming growth factor beta production", 0.066, 3.127, 5.266, 1.176,-1.7117,0.743,0.567),
c("GO:0007275","multicellular organism development",23.548, 5.853, 0.278, 3.695,-1.3076,0.709,0.598),
c("GO:0051897","positive regulation of protein kinase B signaling", 0.427,-2.625, 5.088, 1.959,-1.3981,0.775,0.600),
c("GO:0048545","response to steroid hormone", 1.653,-1.458,-5.797, 2.543,-1.0887,0.827,0.611),
c("GO:0001764","neuron migration", 0.755, 5.127, 1.020, 2.204,-1.2078,0.688,0.614),
c("GO:0045777","positive regulation of blood pressure", 0.218, 3.342,-4.209, 1.672,-1.0158,0.812,0.619),
c("GO:0007411","axon guidance", 0.888, 3.898,-1.146, 2.274,-1.0698,0.588,0.637),
c("GO:0010596","negative regulation of endothelial cell migration", 0.185, 4.059, 3.984, 1.602,-1.1986,0.701,0.648),
c("GO:0002040","sprouting angiogenesis", 0.351, 7.254, 0.808, 1.875,-1.0434,0.711,0.685));

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

library(ggpubr)
library(ggsci)
library(viridis)
ggscatter(one.data, x="plot_X", y="plot_Y", 
          color="log10_p_value", size = "plot_size", alpha = 0.6,
          palette = "viridis") + 
  scale_size_area() +
  labs_pubr()
  


# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
