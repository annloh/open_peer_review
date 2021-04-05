# runfile for file doenload

# PeerJ
source("R/peerj_download_reviews_create_text.R")
peerj_download(ids = 1:7930)

source("R/textmining_peerj.R")
textmining_peerj()

#PeerJ CS
source("R/peerj_cs_download_reviews_create_text.R")
peerj_cs_download(ids = 1:225)

source("R/textmining_peerj_cs.R")
textmining_peerj_cs()

#RSOS
source("R/download_RSOS_pdf.R")
download_RSOS_pdf()

source("R/check_not_corrupt_royal_society_open_science.R")

source("R/royal_society_open_science_create_txt.R")
rsos_create_txt()

source("R/textmining_open_science.R")
textmining_open_science()


#RSOS Open Biology
source("R/download_RSOB_pdf.R")
download_RSOB()

source("R/check_not_corrupt_royal_society_open_biology.R")

source("R/royal_society_open_biology_create_txt.R")
rsob_create_txt()

source("R/textmining_open_biology.R")
textmining_open_biology()
