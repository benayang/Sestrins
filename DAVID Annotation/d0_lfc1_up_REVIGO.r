

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
revigo.data <- rbind(c("GO:0003007","heart morphogenesis", 1.201, 4.042, 4.073, 2.405,-2.3990,0.720,0.000),
c("GO:0051005","negative regulation of lipoprotein lipase activity", 0.028,-1.839,-6.324, 0.845,-1.5302,0.877,0.000),
c("GO:0051592","response to calcium ion", 0.570,-1.376, 6.839, 2.083,-1.3453,0.819,0.000),
c("GO:0072383","plus-end-directed vesicle transport along microtubule", 0.024, 5.701,-1.999, 0.778,-1.7042,0.724,0.022),
c("GO:0048251","elastic fiber assembly", 0.033,-5.249, 2.894, 0.903,-1.4643,0.769,0.048),
c("GO:0046339","diacylglycerol metabolic process", 0.081,-5.134,-3.402, 1.255,-1.3126,0.807,0.052),
c("GO:0009268","response to pH", 0.195, 1.409,-6.695, 1.623,-1.1418,0.838,0.086),
c("GO:0035556","intracellular signal transduction",10.855,-0.925,-1.969, 3.359,-1.8296,0.784,0.133),
c("GO:0048266","behavioral response to pain", 0.104, 6.678, 3.466, 1.362,-1.0020,0.757,0.162),
c("GO:0001974","blood vessel remodeling", 0.242, 2.610, 7.108, 1.716,-1.7126,0.797,0.175),
c("GO:0070588","calcium ion transmembrane transport", 1.249, 5.612,-4.186, 2.422,-1.1473,0.818,0.196),
c("GO:0006629","lipid metabolic process", 5.594,-5.743,-2.434, 3.072,-1.1029,0.823,0.283),
c("GO:0048286","lung alveolus development", 0.256, 4.389, 5.381, 1.740,-1.6229,0.764,0.298),
c("GO:0051260","protein homooligomerization", 1.363,-4.128, 3.341, 2.459,-1.1233,0.784,0.314),
c("GO:2000785","regulation of autophagosome assembly", 0.166,-4.603, 4.144, 1.556,-1.1148,0.784,0.361),
c("GO:0097485","neuron projection guidance", 0.897, 2.128, 2.359, 2.279,-1.5302,0.540,0.417),
c("GO:0044319","wound healing, spreading of cells", 0.142, 5.162, 0.408, 1.491,-1.2018,0.615,0.433),
c("GO:0016477","cell migration", 5.594, 4.910,-1.914, 3.072,-1.1548,0.655,0.642));

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
