options(stringsAsFactors = FALSE)
setwd('~/Dropbox/R/fauxktrends')
library(RSQLite)
library(syuzhet)
library(feather)


db <- dbConnect(SQLite(), 'data/userdata.db')

dat <- dbGetQuery(db, 'select username, 
                  match_pct, 
                  enemy_pct,
                  other_pct, dating_pct, sex_pct, ethics_pct, lifestyle_pct, religion_pct,
                  age, 
                  state, 
                  basic_info,
                  background_info,
                  misc_info, 
                  six_things,
                  self_summary,
                  life, good_at, notice_first, favorites, private_admit,thinking_about,friday_night,message_me
                  from tbl_userdata')


data('state.regions', package='choroplethrMaps')
rec.state <- state.regions$region
names(rec.state) <- state.regions$abb

dat$state2 <- relevel(as.factor(rec.state[dat$state]), 'wisconsin')

# basic info:
sexual_identities <-c('Lesbian','Asexual','Gay','Questioning','Straight',
                      'Pansexual','Bisexual','Demisexual','Sapiosexual',
                      'Queer','Heteroflexible','Homoflexible')
gender_identities <- c('Woman', 'Gender Nonconforming', 'Androgynous', 
                       'Genderqueer', 'Genderfluid', 'Trans', 'Cis', 'Intersex',
                       'Non-binary', 'Man', 'Transgender', 'Transsexual')
relationship_types <- c('Open relationship', 'Married', 'Single', 'Seeing Someone')
body_types <- c('Curvy', 'Used up', 'Fit', 'Overweight', 'Average build', 'Thin',
                'Full figured', 'Jacked', 'A little extra')

dat[make.names(paste0('d_sex_', tolower(sexual_identities)))] <- lapply(sexual_identities, function(x)
  grepl(x, dat$basic_info, fixed=TRUE))
dat[make.names(paste0('d_gender_', tolower(gender_identities)))] <- lapply(gender_identities, function(x)
  grepl(x, dat$basic_info, fixed=TRUE))
dat[make.names(paste0('d_relation_', tolower(relationship_types)))] <- lapply(relationship_types, function(x)
  grepl(x, dat$basic_info, fixed=TRUE))
dat[make.names(paste0('d_body_', tolower(body_types)))] <- lapply(body_types, function(x)
  grepl(x, dat$basic_info, fixed=TRUE))

# misc info
diet_type     <- c('Vegetarian', 'Vegan', 'Kosher')
pets <- c('Has dogs', 'Has cats')
kids <- c('Doesnt have kids', 'Has kid(s)', 'Has a kid')
drinking <- c('Doesnt drink', 'Drinks socially', 'Drinks often')
smoking  <- c('Smokes regularly', 'Never smokes', 'Smokes sometimes')
drugs <- c('Sometimes does drugs')

dat[make.names(paste0('d_diet_', tolower(diet_type)))] <- lapply(diet_type, function(x)
  grepl(x, dat$misc_info, fixed=TRUE))
dat[make.names(paste0('d_pets_', tolower(pets)))] <- lapply(pets, function(x)
  grepl(x, dat$misc_info, fixed=TRUE))
dat[make.names(paste0('d_kids_', tolower(kids)))] <- lapply(kids, function(x)
  grepl(x, dat$misc_info, fixed=TRUE))
dat[make.names(paste0('d_drinking_', tolower(drinking)))] <- lapply(drinking, function(x)
  grepl(x, dat$misc_info, fixed=TRUE))
dat[make.names(paste0('d_smoking_', tolower(smoking)))] <- lapply(smoking, function(x)
  grepl(x, dat$misc_info, fixed=TRUE))
dat[make.names(paste0('d_drugs_', tolower(drugs)))] <- lapply(drugs, function(x)
  grepl(x, dat$misc_info, fixed=TRUE))


# background info
religion <- c('Atheist', 'Agnostic', 'Christian', 'Jewish', 'Other religion', 'Catholic',
              'Buddhist', 'Sikh')
education_type <- c('University', 'Post grad', 'Space camp', 'High school', 'Two-year college')
dat[make.names(paste0('d_religion_', tolower(religion)))] <- lapply(religion, function(x)
  grepl(x, dat$background_info, fixed=TRUE))
dat[make.names(paste0('d_education_', tolower(education_type)))] <- lapply(education_type, function(x)
  grepl(x, dat$background_info, fixed=TRUE))



# top 6-things terms
topterms <- c("famil", "friend", "music", "love", "food", "book", 
              "coffe", "cell|phone", "water", "dog", "laugh", "god",
              "travel", "car", "chocol", "kid", "internet", "wine", 
              "cat", "sleep", "air", "peopl", "sunshin", "passport", 
              "natur", "humor", "iphon", "work", "job", "art", 
              "tea", "son", "health", "faith", "beach", "shoe", 
              "daughter",  "bed","anim", "pet", "convers", "money", 
              "danc", "children", "run", "movi", "read", "adventur", 
              "camera", "ocean", "sun", "comput", "netflix", "ice", 
              "chapstick")
dat[,make.names(paste0('f_', topterms))] <- lapply(topterms, 
                                                   function(x){
                                                     grepl(x, dat$six_things, ignore.case=TRUE)
                                                   })


dat[grep('^(d|f)_', names(dat))] <- lapply(dat[grep('^(d|f)_', names(dat))], as.integer)

write_feather(dat, "~/personal/portfolio/code/OKC/data/formatted_data.feather")

cols <- c(sen_lf='life', sen_ga='good_at', sen_nf='notice_first', sen_fv='favorites', 
  sen_pa='private_admit', sen_ta='thinking_about', sen_fn='friday_night', sen_mm='message_me')

sen <- lapply(dat[, cols],
              function(x) {
                s <- get_nrc_sentiment(x)
                n <- nchar(x, type='bytes')
                s[1:ncol(s)] <- lapply(s, function(y) (y/n)*100 )
                data.frame(s)})
for (i in seq_along(sen)){
    names(sen[[i]]) <- paste0(names(cols)[i], '_', names(sen[[i]]))
}


oks <- data.frame(dat, do.call(cbind, sen))

write_feather(oks, file = '~/personal/portfolio/code/OKC/data/sentiment_data.feather')
