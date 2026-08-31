
# read in counts data
counts_data <- read.csv('counts_data.csv')
head(counts_data)


# read in sample info
colData <- read.csv('sample_info.csv')


# making sure the row names in colData matches to column names in counts_data
all(colnames(counts_data) %in% rownames(colData))


# jumble rows in colData - recreate the error
colData <- colData[sample(1:nrow(colData)),]

# 
# are they in the same order?
all(colnames(counts_data) == rownames(colData))
counts_data <- counts_data[, rownames(colData)]


# Step 2: construct a DESeqDataSet object ----------

dds <- DESeqDataSetFromMatrix(countData = counts_data,
                              colData = colData,
                              design = ~ dexamethasone)

dds <- DESeq(dds)

res <- results(dds)
summary(res)

