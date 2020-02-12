

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
revigo.data <- rbind(c("GO:0006613","cotranslational protein targeting to membrane", 0.085,-1.916, 4.523, 1.279,-2.1573,0.751,0.000),
c("GO:0034341","response to interferon-gamma", 0.475,-6.489, 0.265, 2.004,-2.4220,0.844,0.000),
c("GO:0000184","nuclear-transcribed mRNA catabolic process, nonsense-mediated decay", 0.171,-2.278,-6.231, 1.568,-2.0019,0.823,0.011),
c("GO:1904019","epithelial cell apoptotic process", 0.427, 4.052, 6.638, 1.959,-1.9177,0.884,0.063),
c("GO:2001014","regulation of skeletal muscle cell differentiation", 0.085, 6.256,-0.168, 1.279,-1.9177,0.695,0.063),
c("GO:0090311","regulation of protein deacetylation", 0.195, 4.494,-6.478, 1.623,-1.9686,0.769,0.097),
c("GO:0042254","ribosome biogenesis", 1.244,-0.442, 0.341, 2.420,-1.4309,0.850,0.160),
c("GO:0006312","mitotic recombination", 0.128,-0.705,-6.738, 1.447,-1.6192,0.857,0.178),
c("GO:0019083","viral transcription", 0.195,-0.110,-5.749, 1.623,-1.9945,0.775,0.203),
c("GO:0016072","rRNA metabolic process", 0.893,-2.169,-5.014, 2.276,-1.5281,0.790,0.234),
c("GO:0043043","peptide biosynthetic process", 3.030,-3.481,-5.181, 2.806,-1.6401,0.819,0.250),
c("GO:0042989","sequestering of actin monomers", 0.043,-0.935, 3.411, 1.000,-1.8722,0.732,0.330),
c("GO:2000209","regulation of anoikis", 0.095, 4.369, 6.670, 1.322,-1.5740,0.886,0.372),
c("GO:0002385","mucosal immune response", 0.123,-5.716, 0.152, 1.431,-1.4959,0.855,0.417),
c("GO:0032365","intracellular lipid transport", 0.085,-2.420, 5.662, 1.279,-1.6975,0.791,0.460),
c("GO:0045047","protein targeting to ER", 0.114,-2.998, 5.216, 1.398,-2.1220,0.813,0.505),
c("GO:0042742","defense response to bacterium", 1.899,-6.943,-0.548, 2.603,-2.3891,0.855,0.539),
c("GO:0006853","carnitine shuttle", 0.031,-1.689, 5.948, 0.845,-1.8311,0.765,0.557),
c("GO:0051147","regulation of muscle cell differentiation", 0.822, 6.409, 0.179, 2.241,-1.3232,0.661,0.579),
c("GO:0071346","cellular response to interferon-gamma", 0.366,-6.437,-0.070, 1.892,-1.9727,0.830,0.599),
c("GO:1990542","mitochondrial transmembrane transport", 0.228,-0.522, 6.671, 1.690,-1.3732,0.862,0.615),
c("GO:0019731","antibacterial humoral response", 0.161,-6.440,-0.608, 1.544,-1.3352,0.854,0.662),
c("GO:1902001","fatty acid transmembrane transport", 0.024,-1.564, 6.211, 0.778,-1.8311,0.797,0.688),
c("GO:0048741","skeletal muscle fiber development", 0.171, 6.221, 0.358, 1.568,-1.7936,0.644,0.705),
c("GO:0045661","regulation of myoblast differentiation", 0.266, 6.277,-0.404, 1.756,-1.4152,0.683,0.725),
c("GO:0035914","skeletal muscle cell differentiation", 0.361, 6.576,-0.202, 1.886,-1.7936,0.674,0.789),
c("GO:0015909","long-chain fatty acid transport", 0.228,-2.105, 5.935, 1.690,-1.4785,0.787,0.797),
c("GO:0016032","viral process", 1.263, 2.444,-6.299, 2.427,-1.4522,0.864,0.810),
c("GO:0048641","regulation of skeletal muscle tissue development", 0.242, 6.690, 0.162, 1.716,-1.7936,0.691,0.813),
c("GO:0090312","positive regulation of protein deacetylation", 0.114, 4.793,-6.359, 1.398,-1.8311,0.775,0.838),
c("GO:0030837","negative regulation of actin filament polymerization", 0.247, 0.122, 1.166, 1.724,-1.5332,0.789,0.842),
c("GO:0055002","striated muscle cell development", 0.708, 6.399, 0.600, 2.176,-1.5740,0.642,0.849),
c("GO:0034470","ncRNA processing", 1.472,-1.861,-5.061, 2.493,-1.4274,0.777,0.851),
c("GO:0014904","myotube cell development", 0.190, 6.383, 0.855, 1.613,-1.7272,0.665,0.857),
c("GO:0006364","rRNA processing", 0.864,-1.135,-3.061, 2.262,-1.5201,0.698,0.857),
c("GO:0045214","sarcomere organization", 0.214, 4.542, 0.561, 1.663,-1.3868,0.593,0.866),
c("GO:0000956","nuclear-transcribed mRNA catabolic process", 0.499,-1.964,-6.093, 2.025,-1.6401,0.814,0.873),
c("GO:0048747","muscle fiber development", 0.294, 6.170, 0.687, 1.799,-1.4456,0.659,0.892));

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
