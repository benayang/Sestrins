

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
library(ggplot2)
# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","freqInDbPercent","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0006936","muscle contraction",1.273,0.930,0.000,"muscle contraction"),
c("GO:2000739","regulation of mesenchymal stem cell differentiation",0.028,0.812,0.132,"muscle contraction"),
c("GO:0072359","circulatory system development",4.744,0.806,0.362,"muscle contraction"),
c("GO:0051241","negative regulation of multicellular organismal process",4.967,0.746,0.479,"muscle contraction"),
c("GO:0001990","regulation of systemic arterial blood pressure by hormone",0.204,0.899,0.335,"muscle contraction"),
c("GO:0048565","digestive tract development",0.622,0.819,0.204,"muscle contraction"),
c("GO:0001501","skeletal system development",2.317,0.820,0.314,"muscle contraction"),
c("GO:0043009","chordate embryonic development",3.386,0.807,0.295,"muscle contraction"),
c("GO:0030879","mammary gland development",0.712,0.826,0.259,"muscle contraction"),
c("GO:0030278","regulation of ossification",0.950,0.822,0.172,"muscle contraction"),
c("GO:0030540","female genitalia development",0.090,0.853,0.170,"muscle contraction"),
c("GO:0007507","heart development",2.692,0.793,0.419,"muscle contraction"),
c("GO:0007498","mesoderm development",0.551,0.842,0.180,"muscle contraction"),
c("GO:0048667","cell morphogenesis involved in neuron differentiation",2.498,0.723,0.366,"muscle contraction"),
c("GO:0014706","striated muscle tissue development",1.823,0.815,0.488,"muscle contraction"),
c("GO:0007517","muscle organ development",1.724,0.760,0.395,"muscle contraction"),
c("GO:0009948","anterior/posterior axis specification",0.252,0.854,0.120,"muscle contraction"),
c("GO:0060348","bone development",0.940,0.810,0.323,"muscle contraction"),
c("GO:0048732","gland development",2.265,0.806,0.367,"muscle contraction"),
c("GO:0001655","urogenital system development",1.657,0.826,0.273,"muscle contraction"),
c("GO:0032456","endocytic recycling",0.152,0.936,0.000,"endocytic recycling"),
c("GO:0006816","calcium ion transport",1.752,0.914,0.237,"endocytic recycling"),
c("GO:0045921","positive regulation of exocytosis",0.370,0.773,0.427,"endocytic recycling"),
c("GO:0034501","protein localization to kinetochore",0.076,0.932,0.141,"endocytic recycling"),
c("GO:0072666","establishment of protein localization to vacuole",0.147,0.928,0.460,"endocytic recycling"),
c("GO:0015807","L-amino acid transport",0.290,0.896,0.499,"endocytic recycling"),
c("GO:0015671","oxygen transport",0.066,0.916,0.252,"endocytic recycling"),
c("GO:0015669","gas transport",0.100,0.914,0.186,"endocytic recycling"),
c("GO:0043388","positive regulation of DNA binding",0.252,0.921,0.000,"positive regulation of DNA binding"),
c("GO:0043086","negative regulation of catalytic activity",3.723,0.902,0.384,"positive regulation of DNA binding"),
c("GO:0044273","sulfur compound catabolic process",0.119,0.934,0.000,"sulfur compound catabolism"),
c("GO:0010498","proteasomal protein catabolic process",1.757,0.887,0.480,"sulfur compound catabolism"),
c("GO:0070555","response to interleukin-1",0.532,0.939,0.000,"response to interleukin-1"),
c("GO:1901701","cellular response to oxygen-containing compound",4.312,0.906,0.281,"response to interleukin-1"),
c("GO:0031347","regulation of defense response",2.327,0.876,0.109,"response to interleukin-1"),
c("GO:2000050","regulation of non-canonical Wnt signaling pathway",0.114,0.845,0.296,"response to interleukin-1"),
c("GO:0009968","negative regulation of signal transduction",4.967,0.773,0.462,"response to interleukin-1"),
c("GO:0010243","response to organonitrogen compound",3.642,0.924,0.415,"response to interleukin-1"),
c("GO:0034724","DNA replication-independent nucleosome organization",0.085,0.915,0.010,"DNA replication-independent nucleosome organization"),
c("GO:0070206","protein trimerization",0.233,0.902,0.312,"DNA replication-independent nucleosome organization"),
c("GO:1902117","positive regulation of organelle assembly",0.294,0.788,0.325,"DNA replication-independent nucleosome organization"),
c("GO:0030198","extracellular matrix organization",1.030,0.866,0.172,"DNA replication-independent nucleosome organization"),
c("GO:0030261","chromosome condensation",0.157,0.901,0.140,"DNA replication-independent nucleosome organization"),
c("GO:1901880","negative regulation of protein depolymerization",0.294,0.785,0.451,"DNA replication-independent nucleosome organization"),
c("GO:0042113","B cell activation",1.790,0.886,0.013,"B cell activation"),
c("GO:1904705","regulation of vascular smooth muscle cell proliferation",0.100,0.906,0.037,"regulation of vascular smooth muscle cell proliferation"),
c("GO:0008284","positive regulation of cell proliferation",4.055,0.804,0.482,"regulation of vascular smooth muscle cell proliferation"),
c("GO:0040013","negative regulation of locomotion",1.187,0.852,0.049,"negative regulation of locomotion"),
c("GO:0051271","negative regulation of cellular component movement",1.130,0.772,0.329,"negative regulation of locomotion"),
c("GO:0043066","negative regulation of apoptotic process",4.032,0.787,0.311,"negative regulation of locomotion"),
c("GO:0051093","negative regulation of developmental process",4.283,0.724,0.374,"negative regulation of locomotion"),
c("GO:0030203","glycosaminoglycan metabolic process",0.475,0.920,0.054,"glycosaminoglycan metabolism"),
c("GO:0080090","regulation of primary metabolic process",26.245,0.829,0.325,"glycosaminoglycan metabolism"),
c("GO:0018205","peptidyl-lysine modification",1.534,0.902,0.107,"glycosaminoglycan metabolism"),
c("GO:0006367","transcription initiation from RNA polymerase II promoter",0.323,0.908,0.277,"glycosaminoglycan metabolism"),
c("GO:0019216","regulation of lipid metabolic process",1.349,0.866,0.272,"glycosaminoglycan metabolism"),
c("GO:0006352","DNA-templated transcription, initiation",0.522,0.908,0.161,"glycosaminoglycan metabolism"),
c("GO:0032446","protein modification by small protein conjugation",3.732,0.892,0.398,"glycosaminoglycan metabolism"),
c("GO:0006111","regulation of gluconeogenesis",0.228,0.869,0.203,"glycosaminoglycan metabolism"),
c("GO:0010869","regulation of receptor biosynthetic process",0.085,0.883,0.191,"glycosaminoglycan metabolism"),
c("GO:0042415","norepinephrine metabolic process",0.076,0.916,0.347,"glycosaminoglycan metabolism"),
c("GO:0000122","negative regulation of transcription from RNA polymerase II promoter",3.666,0.778,0.487,"glycosaminoglycan metabolism"),
c("GO:1901362","organic cyclic compound biosynthetic process",19.151,0.916,0.285,"glycosaminoglycan metabolism"),
c("GO:0051983","regulation of chromosome segregation",0.408,0.864,0.083,"regulation of chromosome segregation"),
c("GO:0000086","G2/M transition of mitotic cell cycle",0.461,0.850,0.084,"G2/M transition of mitotic cell cycle"),
c("GO:0071173","spindle assembly checkpoint",0.152,0.812,0.415,"G2/M transition of mitotic cell cycle"),
c("GO:0051302","regulation of cell division",0.632,0.886,0.086,"regulation of cell division"),
c("GO:0019933","cAMP-mediated signaling",0.233,0.879,0.087,"cAMP-mediated signaling"),
c("GO:0014065","phosphatidylinositol 3-kinase signaling",0.499,0.870,0.348,"cAMP-mediated signaling"),
c("GO:0048522","positive regulation of cellular process",22.541,0.793,0.096,"positive regulation of cellular process"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$abslog10pvalue <- as.numeric( as.character(stuff$abslog10pvalue) );
stuff$freqInDbPercent <- as.numeric( as.character(stuff$freqInDbPercent) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );
stuff
# by default, outputs to a PDF file
#pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
	stuff,
	index = c("representative","description"),
	vSize = "uniqueness",
	type = "categorical",
	vColor = "representative",
	title = "Cluster 1",
	inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
	lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
	bg.labels = "#CCCCCCAA",     # define background color of group labels
												       # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
	position.legend = "none",
	palette = "Dark2"
)

#dev.off()
