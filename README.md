# Analyis of Open Peer Review at PeerJ and Royal Society.
 
This is a repository to analyze open peer reviews at PeerJ and the Royal Society Open Science and Royal Society Open Biology.

It contains scripts to download all reviews and convert them in text files that are textmined and analyzed. 



## For PeerJ articles:

1) Run peerj_download_reviews_create_text.R. This script will cycle through the websites https://peerj.com/articles/1/reviews/ to https://peerj.com/articles/7233/reviews/ and download the html on each page. It will store each html page as a text file. In this text file text labels are added (so the txt files are not just the html text). The script adds:
- label_version
- label_recommendation
- label_br (basic reporting)
- label_author (author of the review)
- label_ed (experimental design)
- label_votf (validity of the findings)
- label_cfta (comments for the authors)

These labels are used to find information  in the text mining phase.

2) run textmining_peerj.R. This script will go through all the review files in the peerj_reviews_txt folder and extract the information for the final dataframe: 
- df_link: Link to the reviews
- df_section: section of peerJ the article is published in
- df_days: Days between submission and date of the current version
- df_version: Version of the manuscript (revision number)
- df_recommendation: Recommendation (for PeerJ by the editor)
- df_word_count: Word count for all different sections the reviewer fills in.
- df_masked: Is the reviewer masked or known
- df_reviewer_name: If known, what is the name of the reviewer (if not known, Reviewer and number)

This script saved the generated dataframe (where each row contains the data for one review for a version of the manuscript) as a rds file: peerj_data.rds. 

## For Royal Society Open Science articles:

1) Run royal_society_open_science_create_txt.R. There is a section in the code that can be used to download all PDF reviews based on a list of the DOI's of all articles in Royal Society Open Science, which is stored in the folder royal_society_pdf_files (OS_pdf_list.txt). This script will cycle through the article pages and download the PDF file on each page. It will store each PDF file. 

Not all reviews in Royal Society Open Science are open. If they are not open, the downloaded PDF file will not be readable. The script "check_open_review_royal_society.R" checks if PDF files are readable and creates a list of reviews that are open and can be textmined (Article_ID_OS.txt in the royal_society_pdf_files folder). This list contains all the article ID's that are included in the final analysis. 

The script then reads in all pdf files and transforms them to text files, which are also stored. In this text file text labels are added (so the txt files are not just the html text). The script adds:
- label_version
- label_recommendation
- label_br (basic reporting)
- label_author (author of the review)
- label_ed (experimental design)
- label_votf (validity of the findings)
- label_cfta (comments for the authors)

These labels are used to find information in the text mining phase.

2) run textmining_open_science.R. This script will go through all the review files in the open_science folder in the royal_society_txt_files folder and extracts the information for the final dataframe: 
- df_link: Link to the reviews
- df_section: section of peerJ the article is published in
- df_days: Days between submission and date of the current version
- df_version: Version of the manuscript (revision number)
- df_recommendation: Recommendation (for PeerJ by the editor)
- df_word_count: Word count for all different sections the reviewer fills in.
- df_masked: Is the reviewer masked or known
- df_reviewer_name: If known, what is the name of the reviewer (if not known, empty)
- df_reviewer_number: The reviewer number assigned by Royal Society - this can be linked to their individual recommendation in the datafile.

This script saved the generated dataframe (where each row contains the data for one review for a version of the manuscript) as a rds file: royal_society_data_os.rds.  

## For Royal Society Open Biology articles:

The procedure is basically identical to the Open Science journals. The script contains one tiny difference (recommendations are found searching for "Recommendation?"" not Recommendation"). The data file generated is royal_society_data_ob.rds.