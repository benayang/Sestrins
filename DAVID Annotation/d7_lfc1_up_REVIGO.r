

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
revigo.data <- rbind(c("GO:0030574","collagen catabolic process", 0.128,-0.130,-5.823, 1.447,-4.8097,0.598,0.000),
c("GO:0048384","retinoic acid receptor signaling pathway", 0.147, 5.290, 1.202, 1.505,-1.4411,0.776,0.021),
c("GO:0022617","extracellular matrix disassembly", 0.185, 2.636, 4.590, 1.602,-1.3557,0.790,0.022),
c("GO:0051591","response to cAMP", 0.413,-1.471, 5.578, 1.944,-1.0029,0.814,0.082),
c("GO:0007565","female pregnancy", 0.855,-5.333, 2.531, 2.258,-1.9235,0.732,0.109),
c("GO:0003417","growth plate cartilage development", 0.081,-6.451,-4.323, 1.255,-1.7383,0.643,0.133),
c("GO:0001503","ossification", 1.838,-3.960,-1.300, 2.589,-3.0048,0.669,0.172),
c("GO:0001649","osteoblast differentiation", 1.007,-3.930,-4.413, 2.328,-2.8009,0.577,0.213),
c("GO:0070374","positive regulation of ERK1 and ERK2 cascade", 0.836, 3.992,-4.431, 2.248,-1.2481,0.661,0.247),
c("GO:0006508","proteolysis", 7.873, 5.903,-3.242, 3.220,-1.5184,0.783,0.281),
c("GO:0031214","biomineral tissue development", 0.660,-5.934,-2.770, 2.146,-1.2387,0.616,0.370),
c("GO:0034653","retinoic acid catabolic process", 0.019, 1.818,-7.579, 0.699,-2.0883,0.703,0.431));

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
