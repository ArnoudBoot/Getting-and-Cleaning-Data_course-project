Getting-and-Cleaning-Data_course-project
========================================

Coursera cource "Getting and cleaning data" project results

Hi,
you can find the R-script in the file called "run_analysis.R".
the script is designed for you to set your working directory to the main folder of the source data you downloaded via the link on the coursera peer assessment project instructions page.

For the perpose of this analysis I chose to work using the summarised data (i.e. the subject_train and test_train files)

The script will first upload all required files such as feature information and the data files.
During the uploading, the feature names are immediately incorporated as column names, and then using rbind the X and Y-information is incorporated into 1 file.
these steps are performed seperately for both data sets (train and test)

After checking there was no overlap in subject names (which could have led to problems with the last step of the analysis) I combined both data sets using rbind.
This object was named "raw_data" (no manipulation of any kind has occurred so far, it's just all in 1 file)

subsequently, column indexes were listed of columns containing either "mean()" or "std()", these column indexes were then combined (and column 1 was also included, as to include the subject column in the subselection)
using this index list tidy_data_1 was extracted, containing only columns containing the mean and std values for the measurements.

finally, tiny_data_2 was calculated using the function aggregate, and this table was saved to the working directory.
