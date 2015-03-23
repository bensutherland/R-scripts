############PLOT GREY WHITE GREY PANEL ON Rqtl GENOME SCAN#######
# replace "all.out.0.nocov" with any scanone model
# in the object with chromosome lengths given in sfqtl$geno
# collect the length of each chr
len.chr = NULL
for(i in names(sfqtl$geno)){
  len.chr = c(len.chr, max(sfqtl$geno[[i]]$map))  
}

len.chr
# add buffer space (gaps between blocks)
buffer.leng <- len.chr + 25
cu.buffer.leng <- cumsum(buffer.leng) #finds the cumulative position for each dividing block
# find x-axis positions
left.grey <- c(0, cu.buffer.leng[c(FALSE, TRUE)])
right.grey <- c(cu.buffer.leng[c(TRUE, FALSE)])


plot(out.am, alternate.chrid=T, type="n", lodcolumn=6, ylim = c(0,8), ylab = "Length (cm) T2",
     xlab = "")
rect(xleft = left.grey[0:21], xright= right.grey[0:21],
     ybottom = 0, ytop = 11,
     col = c("lightgrey"),
     border=NA)
plot(out.am, alternate.chrid=T, add=TRUE, lodcolumn=6, ylim = c(0,8), ylab = "Length (cm) T2",
     xlab = "")
abline(h=pheno.lev.a["leng.cm_0709"], lty=3)
abline(h=summary(operm.am[,"leng.cm_0709"], 0.05), lty=1)
