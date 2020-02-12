

# A treemap R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","freqInDbPercent","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0005513","detection of calcium ion",0.033,0.934,0.000,"detection of calcium ion"),
c("GO:0048545","response to steroid hormone",1.653,0.911,0.195,"detection of calcium ion"),
c("GO:0034612","response to tumor necrosis factor",0.888,0.909,0.402,"detection of calcium ion"),
c("GO:0006586","indolalkylamine metabolic process",0.052,0.935,0.000,"indolalkylamine metabolism"),
c("GO:0045428","regulation of nitric oxide biosynthetic process",0.247,0.838,0.199,"indolalkylamine metabolism"),
c("GO:0006383","transcription from RNA polymerase III promoter",0.204,0.910,0.147,"indolalkylamine metabolism"),
c("GO:0006661","phosphatidylinositol biosynthetic process",0.294,0.874,0.167,"indolalkylamine metabolism"),
c("GO:0098781","ncRNA transcription",0.180,0.896,0.243,"indolalkylamine metabolism"),
c("GO:0042791","5S class rRNA transcription from RNA polymerase III type 1 promoter",0.009,0.893,0.488,"indolalkylamine metabolism"),
c("GO:0061448","connective tissue development",1.225,0.917,0.000,"connective tissue development"),
c("GO:0010717","regulation of epithelial to mesenchymal transition",0.351,0.819,0.446,"connective tissue development"),
c("GO:0051216","cartilage development",0.912,0.884,0.493,"connective tissue development"),
c("GO:0043588","skin development",1.296,0.897,0.231,"connective tissue development"),
c("GO:0003180","aortic valve morphogenesis",0.033,0.896,0.251,"connective tissue development"),
c("GO:0001702","gastrulation with mouth forming second",0.171,0.885,0.303,"connective tissue development"),
c("GO:0090399","replicative senescence",0.043,0.905,0.153,"connective tissue development"),
c("GO:0035137","hindlimb morphogenesis",0.199,0.894,0.268,"connective tissue development"),
c("GO:0099003","vesicle-mediated transport in synapse",0.617,0.886,0.000,"vesicle-mediated transport in synapse"),
c("GO:0051029","rRNA transport",0.028,0.877,0.188,"vesicle-mediated transport in synapse"),
c("GO:0045047","protein targeting to ER",0.114,0.873,0.256,"vesicle-mediated transport in synapse"),
c("GO:0035428","hexose transmembrane transport",0.119,0.821,0.283,"vesicle-mediated transport in synapse"),
c("GO:0051956","negative regulation of amino acid transport",0.043,0.807,0.414,"vesicle-mediated transport in synapse"),
c("GO:0043268","positive regulation of potassium ion transport",0.142,0.774,0.488,"vesicle-mediated transport in synapse"),
c("GO:0061668","mitochondrial ribosome assembly",0.019,0.931,0.009,"mitochondrial ribosome assembly"),
c("GO:0071822","protein complex subunit organization",5.803,0.918,0.450,"mitochondrial ribosome assembly"),
c("GO:0033043","regulation of organelle organization",4.796,0.854,0.354,"mitochondrial ribosome assembly"),
c("GO:0045026","plasma membrane fusion",0.161,0.895,0.126,"mitochondrial ribosome assembly"),
c("GO:0030199","collagen fibril organization",0.190,0.898,0.277,"mitochondrial ribosome assembly"),
c("GO:0030865","cortical cytoskeleton organization",0.180,0.923,0.222,"mitochondrial ribosome assembly"),
c("GO:0034350","regulation of glial cell apoptotic process",0.043,0.906,0.009,"regulation of glial cell apoptotic process"),
c("GO:0010665","regulation of cardiac muscle cell apoptotic process",0.142,0.899,0.358,"regulation of glial cell apoptotic process"),
c("GO:2000677","regulation of transcription regulatory region DNA binding",0.223,0.906,0.034,"regulation of transcription regulatory region DNA binding"),
c("GO:0043547","positive regulation of GTPase activity",2.384,0.901,0.362,"regulation of transcription regulatory region DNA binding"),
c("GO:0055067","monovalent inorganic cation homeostasis",0.622,0.895,0.042,"monovalent inorganic cation homeostasis"),
c("GO:0045837","negative regulation of membrane potential",0.052,0.882,0.248,"monovalent inorganic cation homeostasis"),
c("GO:0086091","regulation of heart rate by cardiac conduction",0.147,0.844,0.270,"monovalent inorganic cation homeostasis"),
c("GO:0001771","immunological synapse formation",0.066,0.894,0.052,"immunological synapse formation"),
c("GO:0072677","eosinophil migration",0.066,0.800,0.266,"immunological synapse formation"),
c("GO:0051272","positive regulation of cellular component movement",1.985,0.712,0.415,"immunological synapse formation"),
c("GO:0002922","positive regulation of humoral immune response",0.071,0.806,0.407,"immunological synapse formation"),
c("GO:0002579","positive regulation of antigen processing and presentation",0.047,0.845,0.260,"immunological synapse formation"),
c("GO:0040017","positive regulation of locomotion",2.085,0.795,0.436,"immunological synapse formation"),
c("GO:0008284","positive regulation of cell proliferation",4.055,0.827,0.057,"positive regulation of cell proliferation"),
c("GO:0048522","positive regulation of cellular process",22.541,0.813,0.446,"positive regulation of cell proliferation"),
c("GO:0045600","positive regulation of fat cell differentiation",0.266,0.811,0.253,"positive regulation of cell proliferation"),
c("GO:0000281","mitotic cytokinesis",0.185,0.887,0.058,"mitotic cytokinesis"),
c("GO:0046605","regulation of centrosome cycle",0.223,0.829,0.455,"mitotic cytokinesis"),
c("GO:0007215","glutamate receptor signaling pathway",0.366,0.868,0.072,"glutamate receptor signaling pathway"),
c("GO:0098916","anterograde trans-synaptic signaling",2.602,0.860,0.170,"glutamate receptor signaling pathway"),
c("GO:0051056","regulation of small GTPase mediated signal transduction",1.064,0.795,0.193,"glutamate receptor signaling pathway"),
c("GO:0071456","cellular response to hypoxia",0.551,0.838,0.423,"glutamate receptor signaling pathway"),
c("GO:0031622","positive regulation of fever generation",0.033,0.746,0.371,"glutamate receptor signaling pathway"),
c("GO:0042149","cellular response to glucose starvation",0.218,0.863,0.133,"glutamate receptor signaling pathway"),
c("GO:0045738","negative regulation of DNA repair",0.076,0.794,0.360,"glutamate receptor signaling pathway"),
c("GO:0010467","gene expression",23.629,0.940,0.081,"gene expression"),
c("GO:0034645","cellular macromolecule biosynthetic process",21.549,0.886,0.342,"gene expression"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$abslog10pvalue <- as.numeric( as.character(stuff$abslog10pvalue) );
stuff$freqInDbPercent <- as.numeric( as.character(stuff$freqInDbPercent) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
tmPlot(
	stuff,
	index = c("representative","description"),
	vSize = "abslog10pvalue",
	type = "categorical",
	vColor = "representative",
	title = "REVIGO Gene Ontology treemap",
	inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
	lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
	bg.labels = "#CCCCCCAA",     # define background color of group labels
												       # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
	position.legend = "none"
)

dev.off()
