#Welcome to RwithAammar - Publication Ready Graphs (Part-3)
###############################################################
#install following packages
###############################################################
install.packages("readxl")
install.packages("tidyverse")

#main package for Today
install.packages("ggpubr")
###############################################################
#Load All Packages
###############################################################
library(readxl)
library(tidyverse)
library(ggpubr)
###############################################################
#Import Data set in R
###############################################################
# 1- Boxplot with jitter points and means comparison
data("ToothGrowth")
#simple boxplot
p1 <- ggboxplot(ToothGrowth, x = "dose", y = "len",
          color = "dose", palette =c("blue", "red", "green"),
          add = "jitter", shape = "dose", 
          xlab = "Dose", ylab = "Length", legend.title="Dose")
p1
#showing mean comparisons
# Specify the comparisons you want
my_comparisons <- list( c("0.5", "1"), c("1", "2"), c("0.5", "2") )
#show significant stars
p1 + stat_compare_means(comparisons = my_comparisons,
                       method = "t.test",
                       label = "p.signif",
                       )+ # Add pairwise comparisons p-value
  stat_compare_means(label.y = 50)+ylim(0,60)  # Add global p-value
#against control treatment or reference group
p1 + stat_compare_means(label.y = 42,
                       method = "t.test",
                       label = "p.signif",
                       ref.group = "0.5")  # Add global p-value
#show p-values
p1 <- p1 + stat_compare_means(comparisons = my_comparisons)+ # Add pairwise comparisons p-value
  stat_compare_means(label.y = 50)+ylim(0,60);p1  # Add global p-value

###############################################################
##multiple grouping variable
###############################################################
# Box plot facetted by "dose"
p2 <- ggboxplot(ToothGrowth, x = "supp", y = "len",
               color = "supp", palette = "npg",
               add = "jitter",
               facet.by = "dose", short.panel.labs = FALSE);p2
# Use only p.format as label. Remove method name.
p2 <- p2 + stat_compare_means(
  aes(label = paste0("p = ", ..p.format..))
);p2

###############################################################
##making violin plots
###############################################################
#violin plots
p3 <- ggviolin(ToothGrowth, x = "dose", y = "len",
                color = "dose", palette =c("#00AFBB", "#E7B800", "#FC4E07"),
                add = "jitter", shape = "dose", 
                xlab = "Dose", ylab = "Length", legend.title="Dose");p3
#showing mean comparisons
# Specify the comparisons you want
my_comparisons <- list( c("0.5", "1"), c("1", "2"), c("0.5", "2") )
#show significant stars
p3 <- p3 + stat_compare_means(comparisons = my_comparisons,
                        method = "t.test",
                        label = "p.signif")+ # Add pairwise comparisons p-value
  stat_compare_means(label.y = 50)+ylim(0,60);p3 

# 4- Violin plots with box plots inside

p4 <- ggviolin(ToothGrowth, x = "supp", y = "len",
                fill = "supp", palette = "npg",
                facet.by = "dose", short.panel.labs = FALSE,
               add = "boxplot", add.params = list(fill = "white"));p4
# Use only p.format as label. Remove method name.
p4 <- p4 + stat_compare_means(
  aes(label = paste0("p = ", ..p.format..))
);p4
p4 <- p4 + stat_compare_means(
  aes(label = paste0(..p.signif..))
);p4

###############################################################
##combine all plots
###############################################################
ggarrange(p1, p2, p3,p4 + rremove("x.text"), 
          labels = c("A", "B", "C", "D"),
          ncol = 2, nrow = 2) %>% 
  ggexport(filename = "test.png", res = 200, width = 1600, height = 1600)

# 3 plots together

ggarrange(p1,                                                 # First row with boxplt
          ggarrange(p2, p3, ncol = 2, labels = c("B", "C")), # Second row with violinplot
          nrow = 2, 
          labels = "A"                                        # Labels of the boxplot plot
)  %>% 
  ggexport(filename = "test2.png", res = 200, width = 1600, height = 1600)
