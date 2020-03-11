

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
revigo.data <- rbind(c("GO:0042303","molting cycle", 0.551,-5.800,-4.357, 2.068,-3.7122,0.834,0.000),
c("GO:0048285","organelle fission", 3.053, 4.313,-3.153, 2.809,-1.4261,0.897,0.000),
c("GO:0048872","homeostasis of number of cells", 1.372, 2.513,-0.371, 2.462,-1.3452,0.927,0.000),
c("GO:0002181","cytoplasmic translation", 0.256, 1.220,-3.790, 1.740,-1.3551,0.928,0.015),
c("GO:0060326","cell chemotaxis", 1.173, 1.944, 5.655, 2.394,-3.5817,0.762,0.029),
c("GO:0072089","stem cell proliferation", 0.603,-0.428,-6.474, 2.107,-2.7911,0.862,0.030),
c("GO:0045445","myoblast differentiation", 0.413,-5.233, 4.511, 1.944,-2.6248,0.741,0.079),
c("GO:0045787","positive regulation of cell cycle", 1.463, 5.578, 1.616, 2.490,-1.4756,0.870,0.091),
c("GO:0009611","response to wounding", 2.303, 4.284, 2.719, 2.687,-1.6650,0.900,0.120),
c("GO:0032963","collagen metabolic process", 0.347,-4.912,-4.779, 1.869,-1.3077,0.833,0.168),
c("GO:1990868","response to chemokine", 0.009,-0.743, 7.778, 0.477,-1.3474,0.874,0.172),
c("GO:0060021","palate development", 0.451,-4.360, 2.913, 1.982,-1.9791,0.796,0.185),
c("GO:0007548","sex differentiation", 1.311,-6.522, 4.339, 2.442,-1.9083,0.793,0.190),
c("GO:0001503","ossification", 1.838,-6.653,-3.864, 2.589,-2.7911,0.822,0.199),
c("GO:0043588","skin development", 1.296,-5.421, 0.094, 2.438,-2.6248,0.716,0.219),
c("GO:0043062","extracellular structure organization", 1.035, 4.831,-2.191, 2.340,-1.4062,0.868,0.235),
c("GO:0060537","muscle tissue development", 1.918,-6.669, 2.555, 2.607,-2.5651,0.729,0.243),
c("GO:0071772","response to BMP", 0.793, 0.327, 7.289, 2.225,-1.8015,0.830,0.254),
c("GO:0055123","digestive system development", 0.689,-5.686,-0.864, 2.164,-1.3474,0.736,0.264),
c("GO:0001501","skeletal system development", 2.317,-6.755,-0.398, 2.689,-2.5801,0.711,0.304),
c("GO:0061458","reproductive system development", 2.246,-6.142,-0.121, 2.676,-1.3474,0.712,0.326),
c("GO:0033687","osteoblast proliferation", 0.128,-0.940,-6.751, 1.447,-1.5416,0.869,0.376),
c("GO:0071103","DNA conformation change", 0.950, 4.056,-3.634, 2.303,-1.4062,0.898,0.406),
c("GO:0002237","response to molecule of bacterial origin", 1.558, 1.493, 6.619, 2.517,-1.9765,0.814,0.477),
c("GO:0032103","positive regulation of response to external stimulus", 1.178, 3.694, 4.884, 2.396,-1.4075,0.836,0.477),
c("GO:0050673","epithelial cell proliferation", 1.733,-0.119,-6.612, 2.563,-2.3174,0.857,0.483),
c("GO:1905330","regulation of morphogenesis of an epithelium", 0.518,-7.247, 2.318, 2.041,-2.5544,0.707,0.487),
c("GO:0061448","connective tissue development", 1.225,-6.169, 2.739, 2.413,-2.5544,0.737,0.537),
c("GO:0008544","epidermis development", 1.448,-6.611, 2.927, 2.486,-2.4141,0.734,0.548),
c("GO:2000027","regulation of organ morphogenesis", 0.912,-6.890, 0.401, 2.286,-1.4608,0.694,0.610),
c("GO:0050900","leukocyte migration", 1.410, 1.711, 3.859, 2.474,-2.3174,0.859,0.625));

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
#, limits=(c(1, max(one.data$log10_p_value))
require("ggrepel")
library("wesanderson")

pal <- wes_palette("Zissou1", 100, type = "continuous")

p = ggplot(one.data)
p = p + geom_point(aes( plot_X, plot_Y, colour = log10_p_value, size = plot_size), alpha = 0.6 ) + scale_size_area()
p = p + scale_colour_gradientn(colours = pal)
p = p + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) +
  scale_size_area()
p = p + scale_size(range=c(1,30)) + theme_bw()
ex <- data.frame(subset(one.data, subset=dispensability<0.15))
p = p + geom_label_repel( data = ex, aes(plot_X, plot_Y, label = description, fontface="bold"),
                          colour = "black", size=5, force=3, segment.size = 1)
p = p + labs (y = "semantic space x", x = "semantic space y");
p = p + theme(legend.key = element_blank(), legend.position = "right", legend.key.size = unit(1,"cm"), 
              legend.key.width = unit(0.75,"cm"), axis.text.x=element_text(size=12), axis.text.y=element_text(size=12),
              legend.justification = "top", axis.title.x=element_blank(), axis.title.y=element_blank())
p = p + guides(size=FALSE) + labs_pubr() + coord_fixed()
p

# --------------------------------------------------------------------------
# Output the plot to screen

ggsave(p, filename=file.path(projdir,"Figures","d0_gopb_REVIGO.tiff"), units="in", width=10, height=10, dpi=320)

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
