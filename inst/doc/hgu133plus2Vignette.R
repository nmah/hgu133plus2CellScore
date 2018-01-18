## ----label='version', include=FALSE, cache=FALSE-------------------------
#suppressPackageStartupMessages(library(Biobase))
library(Biobase)
pkg.ver <- package.version("hgu133plus2CellScore")

## ----label='Setup', include=FALSE, cache=FALSE----------------------

## Save the current working directory
dir.main <- getwd()
## Set the name of the directory in which figures will be saved (if any)
dir.figures <- 'figures'

## global chunk options
library(knitr)
opts_chunk$set(
    concordance=FALSE,
    cashe=2,
    ## cache is only valid with a specific version of R and session info
    ## cache will be kept for at most a month (re-compute the next month)
    cache.extra=list(R.version,
                     sessionInfo(),
                     format(Sys.Date(), '%Y-%m')
                     ),
    autodep=TRUE,
    fig.path=paste0(dir.figures,"/"),
    tidy=FALSE,
    size="small",
    message=FALSE,
    warning=FALSE
)
options(width=70, promp="R> ", continue="+  ", useFancyQuotes=FALSE)

## ----eval=FALSE-----------------------------------------------------
#  source("https://bioconductor.org/biocLite.R")
#  biocLite()

## ----eval=FALSE-----------------------------------------------------
#  biocLite("hgu133plus2CellScore")

## ----eval=TRUE, echo=FALSE, cache=FALSE-----------------------------
options(BIOCINSTALLER_ONLINE_DCF=FALSE)

## ----eval=TRUE, echo=1:2, cache=FALSE, include=TRUE-----------------
library(Biobase)
library(hgu133plus2CellScore)

## ----eval=TRUE------------------------------------------------------
eset.std

## ----eval=FALSE-----------------------------------------------------
#  ## Install affy
#  source("https://bioconductor.org/biocLite.R")
#  biocLite("affy")
#  ## Install YuGene
#  install.packages("YuGene")
#  
#  ## Load the packages
#  library(affy)
#  library(YuGene)
#  
#  ## Read in all *.CEL files in the current working directory;
#  ## if the files are not in the working directory then uncomment
#  ## the first command line and then read the files. Note that
#  ## path_to_CEL should be replaced with path to the directory
#  ## containing the *.CEL files
#  
#  #setwd(path_to_CEL)
#  data <- ReadAffy()
#  
#  ## Background noise correction
#  bg.corr <- expresso(data, bg.correct=TRUE, bgcorrect.method="rma",
#                      normalize=FALSE, pmcorrect.method="pmonly",
#                      summary.method="avgdiff")
#  ## Log2-transform the background corrected data
#  bg.corr.log2 <- log2(bg.corr)
#  ## Perform YuGene transform (that results with
#  ## normalized expression values between 0 and 1)
#  normalized.matrix <- YuGene(bg.corr.log2)
#  
#  ## Calculate mas5 present/absent calls
#  co <- mas5calls(data)
#  co <- assayData(co)[["se.exprs"]] #extract detection p-values
#  pvalue.detection.cutoff <- 0.05
#  calls.matrix <- co < pvalue.detection.cutoff

## ----eval=FALSE-----------------------------------------------------
#  ## Example code:
#  ## Create a new assayData object from the normalized expression data
#  ## and the calls matrix
#  assay.data <- assayDataNew(exprs=as.matrix(normalizedSub.matrix),
#                             calls=as.matrix(callsSub.matrix) )
#  ## Create an AnnotatedDataFrame object from the phenotype data frame
#  pheno.table <- new("AnnotatedDataFrame", data=phenotype.data.frame)
#  ## Create an AnnotatedDataFrame object from the annotation data frame
#  annotation.table <- new("AnnotatedDataFrame", data=annotation.data.frame)
#  ## Create the new ExpressionSet object with all the data in one object
#  eset.std <- ExpressionSet(assayData=assay.data,
#                            phenoData=pheno.table,
#                            featureData=annotation.table)

## ----eval=TRUE, echo=TRUE-------------------------------------------
sessionInfo()

