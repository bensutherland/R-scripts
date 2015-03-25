############PLOT GREY WHITE GREY PANEL ON Rqtl GENOME SCAN#######
#currently works for a 42 chromosome plot
# replace "out.am" with any scanone model
# replace "pheno.lev.a" with chromosome-wide significance level vector
# replace "operm.am" with genome-wide significance level vector

# in the read.cross object with chromosome lengths (replace sfqtl)
# to collect the length of each chr
len.chr = NULL
for(i in names(sfqtl$geno)){
  len.chr = c(len.chr, max(sfqtl$geno[[i]]$map))  
}

len.chr 

buffer.leng <- len.chr + 25 # add buffer space (gaps between blocks)
cu.buffer.leng <- cumsum(buffer.leng) #finds the cumulative position for each dividing block

left.grey <- c(0, cu.buffer.leng[c(FALSE, TRUE)]) # find x-axis positions, left side
right.grey <- c(cu.buffer.leng[c(TRUE, FALSE)])   # find x-axis positions, right side

# plot scanone object (replace "out.am")
plot(out.am, alternate.chrid=T, type="n", lodcolumn=6, ylim = c(0,8), ylab = "Length (cm) T2",
     xlab = "") #choose lodcolumn
rect(xleft = left.grey[0:21], xright= right.grey[0:21],
     ybottom = 0, ytop = 11,
     col = c("lightgrey"),
     border=NA)
plot(out.am, alternate.chrid=T, add=TRUE, lodcolumn=6, ylim = c(0,8), ylab = "Length (cm) T2",
     xlab = "")
abline(h=pheno.lev.a["leng.cm_0709"], lty=3)
abline(h=summary(operm.am[,"leng.cm_0709"], 0.05), lty=1)
