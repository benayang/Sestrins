

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
revigo.data <- rbind(c("GO:0006936","muscle contraction", 1.273,-6.330,-4.087, 2.430,-2.8469,0.937,0.000),
c("GO:0008544","epidermis development", 1.448,-6.910, 2.717, 2.486,-3.8951,0.876,0.000),
c("GO:0030199","collagen fibril organization", 0.190,-2.535, 7.195, 1.613,-4.5834,0.861,0.000),
c("GO:0090136","epithelial cell-cell adhesion", 0.071,-2.150, 0.081, 1.204,-2.7223,0.943,0.021),
c("GO:0010837","regulation of keratinocyte proliferation", 0.147, 3.199,-0.139, 1.505,-3.7933,0.876,0.022),
c("GO:0043516","regulation of DNA damage response, signal transduction by p53 class mediator", 0.147, 1.098,-6.527, 1.505,-3.3566,0.832,0.048),
c("GO:0048878","chemical homeostasis", 4.848, 1.876, 2.478, 3.009,-2.8168,0.889,0.049),
c("GO:0060556","regulation of vitamin D biosynthetic process", 0.043, 3.517,-2.074, 1.000,-3.1337,0.796,0.056),
c("GO:1900118","negative regulation of execution phase of apoptosis", 0.043, 6.912, 0.881, 1.000,-1.3278,0.887,0.056),
c("GO:0000281","mitotic cytokinesis", 0.185,-3.591,-1.388, 1.602,-2.2706,0.905,0.063),
c("GO:0033762","response to glucagon", 0.085,-3.735,-5.056, 1.279,-1.7527,0.936,0.072),
c("GO:2000369","regulation of clathrin-dependent endocytosis", 0.081, 1.125, 5.795, 1.255,-4.0414,0.796,0.141),
c("GO:0032438","melanosome organization", 0.085,-1.404, 6.657, 1.279,-2.0800,0.890,0.142),
c("GO:0097581","lamellipodium organization", 0.356,-2.263, 6.269, 1.881,-2.0094,0.877,0.159),
c("GO:0050730","regulation of peptidyl-tyrosine phosphorylation", 1.064, 5.812,-3.065, 2.352,-2.7654,0.810,0.160),
c("GO:0072386","plus-end-directed organelle transport along microtubule", 0.024, 2.237, 6.583, 0.778,-3.2781,0.833,0.161),
c("GO:0043297","apical junction assembly", 0.237,-3.826, 6.027, 1.708,-1.7289,0.861,0.162),
c("GO:0016055","Wnt signaling pathway", 1.847, 1.505,-7.045, 2.591,-1.5540,0.816,0.164),
c("GO:0071248","cellular response to metal ion", 0.655,-3.543,-6.843, 2.143,-1.6506,0.918,0.195),
c("GO:0048538","thymus development", 0.266,-6.751,-0.728, 1.756,-2.5088,0.851,0.199),
c("GO:0035272","exocrine system development", 0.280,-6.737, 0.599, 1.778,-1.3278,0.871,0.209),
c("GO:0045596","negative regulation of cell differentiation", 3.253,-4.346, 2.109, 2.836,-3.5356,0.758,0.242),
c("GO:2000279","negative regulation of DNA biosynthetic process", 0.142, 6.442,-0.269, 1.491,-1.8565,0.851,0.254),
c("GO:0051091","positive regulation of sequence-specific DNA binding transcription factor activity", 0.992, 4.482,-2.548, 2.322,-1.3905,0.786,0.256),
c("GO:1904948","midbrain dopaminergic neuron differentiation", 0.066,-6.403, 1.663, 1.176,-2.7223,0.837,0.256),
c("GO:1905039","carboxylic acid transmembrane transport", 0.370, 2.870, 6.462, 1.898,-1.7289,0.853,0.257),
c("GO:1901098","positive regulation of autophagosome maturation", 0.024, 4.670, 2.629, 0.778,-1.4502,0.819,0.258),
c("GO:0001501","skeletal system development", 2.317,-6.735, 0.079, 2.689,-2.7252,0.846,0.261),
c("GO:0048387","negative regulation of retinoic acid receptor signaling pathway", 0.038, 3.902,-4.971, 0.954,-1.3845,0.860,0.263),
c("GO:0007185","transmembrane receptor protein tyrosine phosphatase signaling pathway", 0.005,-1.043,-7.286, 0.301,-1.4502,0.899,0.274),
c("GO:1904861","excitatory synapse assembly", 0.038,-5.243, 3.681, 0.954,-1.3278,0.829,0.277),
c("GO:0034394","protein localization to cell surface", 0.252, 4.402, 5.683, 1.732,-2.1178,0.909,0.278),
c("GO:0006560","proline metabolic process", 0.047, 0.692,-2.634, 1.041,-1.3845,0.849,0.294),
c("GO:0031507","heterochromatin assembly", 0.057,-3.224, 6.465, 1.114,-1.3278,0.916,0.299),
c("GO:0043009","chordate embryonic development", 3.386,-6.339,-0.212, 2.854,-1.3511,0.839,0.309),
c("GO:0033604","negative regulation of catecholamine secretion", 0.047, 3.813, 4.582, 1.041,-1.4502,0.779,0.311),
c("GO:0010884","positive regulation of lipid storage", 0.104, 3.437, 3.264, 1.362,-2.2433,0.791,0.317),
c("GO:0019935","cyclic-nucleotide-mediated signaling", 0.280, 0.394,-7.461, 1.778,-1.8028,0.874,0.319),
c("GO:0060019","radial glial cell differentiation", 0.057,-6.796, 1.692, 1.114,-1.3845,0.849,0.331),
c("GO:0044058","regulation of digestive system process", 0.185,-6.158,-3.081, 1.602,-1.4502,0.853,0.332),
c("GO:0010634","positive regulation of epithelial cell migration", 0.522,-0.777, 1.465, 2.045,-1.9990,0.696,0.343),
c("GO:1902043","positive regulation of extrinsic apoptotic signaling pathway via death domain receptors", 0.085, 2.638,-4.998, 1.279,-1.4502,0.793,0.346),
c("GO:0090037","positive regulation of protein kinase C signaling", 0.038, 2.828,-5.565, 0.954,-1.3845,0.823,0.348),
c("GO:0051881","regulation of mitochondrial membrane potential", 0.290, 0.957, 2.796, 1.792,-1.7289,0.916,0.353),
c("GO:0043568","positive regulation of insulin-like growth factor receptor signaling pathway", 0.052, 1.979,-5.515, 1.079,-1.3845,0.819,0.355),
c("GO:0008643","carbohydrate transport", 0.708, 3.236, 6.208, 2.176,-1.4502,0.860,0.362),
c("GO:2000178","negative regulation of neural precursor cell proliferation", 0.114, 6.037, 0.978, 1.398,-1.4502,0.878,0.367),
c("GO:0030278","regulation of ossification", 0.950,-6.352,-2.261, 2.303,-1.6615,0.838,0.370),
c("GO:1903077","negative regulation of protein localization to plasma membrane", 0.090, 2.477, 4.956, 1.301,-2.2433,0.767,0.379),
c("GO:0090073","positive regulation of protein homodimerization activity", 0.038,-1.486,-5.568, 0.954,-1.3278,0.924,0.379),
c("GO:0034199","activation of protein kinase A activity", 0.009, 5.372,-3.393, 0.477,-2.3920,0.816,0.383),
c("GO:0061081","positive regulation of myeloid leukocyte cytokine production involved in immune response", 0.052,-2.655,-3.432, 1.079,-1.4502,0.779,0.387),
c("GO:0048146","positive regulation of fibroblast proliferation", 0.261, 5.786,-1.369, 1.748,-1.9141,0.829,0.391));

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
