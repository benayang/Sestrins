

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
revigo.data <- rbind(c("GO:0001508","action potential",0.575,0.910,0.000,"action potential"),
c("GO:0008209","androgen metabolic process",0.085,0.899,0.256,"action potential"),
c("GO:0006936","muscle contraction",1.273,0.921,0.000,"muscle contraction"),
c("GO:0003091","renal water homeostasis",0.057,0.870,0.299,"muscle contraction"),
c("GO:0014706","striated muscle tissue development",1.823,0.881,0.000,"striated muscle tissue development"),
c("GO:0048523","negative regulation of cellular process",20.376,0.837,0.497,"striated muscle tissue development"),
c("GO:0048844","artery morphogenesis",0.309,0.850,0.206,"striated muscle tissue development"),
c("GO:0071173","spindle assembly checkpoint",0.152,0.778,0.262,"striated muscle tissue development"),
c("GO:0045616","regulation of keratinocyte differentiation",0.142,0.791,0.425,"striated muscle tissue development"),
c("GO:0090505","epiboly involved in wound healing",0.142,0.830,0.425,"striated muscle tissue development"),
c("GO:0043069","negative regulation of programmed cell death",4.089,0.803,0.242,"striated muscle tissue development"),
c("GO:0060538","skeletal muscle organ development",0.883,0.835,0.235,"striated muscle tissue development"),
c("GO:0035108","limb morphogenesis",0.788,0.846,0.359,"striated muscle tissue development"),
c("GO:0045992","negative regulation of embryonic development",0.133,0.819,0.190,"striated muscle tissue development"),
c("GO:0014032","neural crest cell development",0.309,0.794,0.459,"striated muscle tissue development"),
c("GO:0000902","cell morphogenesis",4.411,0.712,0.479,"striated muscle tissue development"),
c("GO:0051592","response to calcium ion",0.570,0.925,0.000,"response to calcium ion"),
c("GO:0008543","fibroblast growth factor receptor signaling pathway",0.332,0.839,0.451,"response to calcium ion"),
c("GO:0050918","positive chemotaxis",0.271,0.844,0.213,"response to calcium ion"),
c("GO:0043200","response to amino acid",0.522,0.913,0.411,"response to calcium ion"),
c("GO:0036314","response to sterol",0.104,0.923,0.196,"response to calcium ion"),
c("GO:0046683","response to organophosphorus",0.575,0.916,0.295,"response to calcium ion"),
c("GO:0033993","response to lipid",4.093,0.902,0.424,"response to calcium ion"),
c("GO:0090407","organophosphate biosynthetic process",2.260,0.917,0.000,"organophosphate biosynthesis"),
c("GO:0019216","regulation of lipid metabolic process",1.349,0.837,0.495,"organophosphate biosynthesis"),
c("GO:0010906","regulation of glucose metabolic process",0.527,0.839,0.393,"organophosphate biosynthesis"),
c("GO:0046653","tetrahydrofolate metabolic process",0.090,0.843,0.464,"organophosphate biosynthesis"),
c("GO:0006355","regulation of transcription, DNA-templated",15.922,0.814,0.350,"organophosphate biosynthesis"),
c("GO:0034308","primary alcohol metabolic process",0.185,0.888,0.223,"organophosphate biosynthesis"),
c("GO:0000096","sulfur amino acid metabolic process",0.161,0.853,0.357,"organophosphate biosynthesis"),
c("GO:1901570","fatty acid derivative biosynthetic process",0.166,0.899,0.193,"organophosphate biosynthesis"),
c("GO:0019433","triglyceride catabolic process",0.123,0.855,0.216,"organophosphate biosynthesis"),
c("GO:0098655","cation transmembrane transport",3.381,0.894,0.000,"cation transmembrane transport"),
c("GO:0034394","protein localization to cell surface",0.252,0.893,0.205,"cation transmembrane transport"),
c("GO:0051303","establishment of chromosome localization",0.332,0.853,0.340,"cation transmembrane transport"),
c("GO:0034502","protein localization to chromosome",0.332,0.887,0.418,"cation transmembrane transport"),
c("GO:1903305","regulation of regulated secretory pathway",0.551,0.788,0.346,"cation transmembrane transport"),
c("GO:0008645","hexose transport",0.560,0.877,0.291,"cation transmembrane transport"),
c("GO:0090382","phagosome maturation",0.090,0.863,0.013,"phagosome maturation"),
c("GO:0031532","actin cytoskeleton reorganization",0.404,0.776,0.439,"phagosome maturation"),
c("GO:0071822","protein complex subunit organization",5.803,0.839,0.461,"phagosome maturation"),
c("GO:0016050","vesicle organization",1.425,0.832,0.294,"phagosome maturation"),
c("GO:0090174","organelle membrane fusion",0.708,0.777,0.360,"phagosome maturation"),
c("GO:0030198","extracellular matrix organization",1.030,0.826,0.163,"phagosome maturation"),
c("GO:0035065","regulation of histone acetylation",0.237,0.777,0.310,"phagosome maturation"),
c("GO:0051383","kinetochore organization",0.076,0.813,0.233,"phagosome maturation"),
c("GO:0033628","regulation of cell adhesion mediated by integrin",0.166,0.888,0.041,"regulation of cell adhesion mediated by integrin"),
c("GO:0010837","regulation of keratinocyte proliferation",0.147,0.888,0.043,"regulation of keratinocyte proliferation"),
c("GO:0008285","negative regulation of cell proliferation",2.849,0.829,0.484,"regulation of keratinocyte proliferation"),
c("GO:0051302","regulation of cell division",0.632,0.862,0.054,"regulation of cell division"),
c("GO:0051983","regulation of chromosome segregation",0.408,0.810,0.074,"regulation of chromosome segregation"),
c("GO:0071526","semaphorin-plexin signaling pathway",0.123,0.882,0.083,"semaphorin-plexin signaling pathway"),
c("GO:0060070","canonical Wnt signaling pathway",1.159,0.833,0.343,"semaphorin-plexin signaling pathway"),
c("GO:0051896","regulation of protein kinase B signaling",0.655,0.845,0.147,"semaphorin-plexin signaling pathway"),
c("GO:0048522","positive regulation of cellular process",22.541,0.816,0.096,"positive regulation of cellular process"));

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
