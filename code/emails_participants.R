
root <- find_root_file(criterion = is_rstudio_project)
library(xlsx)

## get data
participants <- read.xlsx(file = paste0(root,  
                          "/data/participants_4_nov_intro_r.xlsx"),
                          sheetIndex = 1)


## generate email addresses
participants$email <- paste(participants$voornaam, 
                            participants$achternaam, sep = ".")


participants$email <- paste(participants$email, "hu.nl", sep = "@")

participants$email <- gsub(" ", "", participants$email)

## one participant uses a non-HU address
participants$email <- sub("saskia.tevelde@hu.nl", 
                          "saskia@tevelderesearch.com",
                          participants$email)

## to generate a lst that can be used in MS Outlook
mail_list <- paste(participants$email, ";", sep = "")

## print to file
writeLines(mail_list, con = paste0(root, "/data/mail_list.txt"))
           
## mail directly from R
install.packages("mailR")

           
           
