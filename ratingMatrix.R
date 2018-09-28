library(RCurl)
ratings_url = getURL("https://raw.githubusercontent.com/zygmuntz/goodbooks-10k/master/ratings.csv")
ratings = read.csv(text = ratings_url)

#Create ratings matrix with rows as users and columns as books.
library(reshape2)
ratingMat = dcast(ratings, user_id~book_id, value.var = "rating", na.rm=FALSE)
ratingMat = as.matrix(ratingMat[,-1])

library(recommenderlab)
#Convert ratings matrix to real rating matrx which makes it dense
ratingMat = as(ratingMat, "realRatingMatrix")

ratingMat = normalize(ratingMat)

