datadir = "/home/vanessa/Documents/Work/BRAINMETA/IMAGE_COMPARISON/experiment3_unrelated"
setwd(datadir)
load("confmatrix_finished.Rda")
flat = c()

for (row in 1:nrow(confmatrix)){
  cat("Parsing row",row,"\n")
  for (col in 1:ncol(confmatrix)){
    actual = rownames(confmatrix)[row]
    predicted = colnames(confmatrix)[col]
    entry = cbind(actual,predicted,confmatrix[row,col],row,col)
    flat = rbind(flat,entry)
  }
}

flat = as.data.frame(flat,stringsAsFactors=FALSE)
colnames(flat) = c("actual","predicted","count","x","y")
setwd("/home/vanessa/Documents/Dropbox/Code/Javascript/confusion")
write.table(flat,file="confdata.tsv",sep="\t",row.names=FALSE,col.names=TRUE,quote=FALSE)

labels = c("TASK01_CON07","TASK01_CON08","TASK01_CON09","TASK02_CON25","TASK02_CON26","TASK02_CON27","TASK03_CON19",                   "TASK03_CON20","TASK03_CON22","TASK04_CON61","TASK04_CON62","TASK04_CON63","TASK04_CON64","TASK04_CON65","TASK04_CON66", "TASK04_CON67","TASK04_CON68","TASK04_CON69","TASK04_CON70","TASK04_CON71","TASK04_CON72","TASK04_CON73","TASK05_CON13",                    "TASK05_CON14","TASK05_CON15","TASK06_CON01","TASK06_CON02","TASK06_CON06","TASK07_CON31","TASK07_CON32","TASK07_CON33", "TASK07_CON34","TASK07_CON35","TASK07_CON36","TASK07_CON37","TASK07_CON38","TASK07_CON39","TASK07_CON40","TASK07_CON41", "TASK07_CON45","TASK07_CON46","TASK07_CON47","TASK07_CON48","TASK07_CON49","TASK07_CON50","TASK07_CON51","TASK07_CON52")
          
cat(gsub("CON","",gsub("TASK","",labels)),sep='","')
