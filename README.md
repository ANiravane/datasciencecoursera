'run_analysis.R' can be used to obtain a cleaneded dataset from the provided UCI HAR Dataset. 

The train and test datasets have been merged, after also adding a column for the corresponding subjects and activites. 

Following this, means and standard deviations for each measurement are obtained. 

The activities, that are stored in numeric form, are replaced by their descriptive names.

The merged dataset is then split on the basis of the subject that took performed each activity.

Within each subjects observations, an average of each measurement is taken by grouping based on the activity performed.

The new dataset is formed. A file named 'new_dataset.txt' is created and the new dataset is stored in it.

Variables used:
train: It is used to store the training data.
test: It is used to store the test data.
dataset: The merged training and test data is stored.
means: Stores all the means of measurment columns.
sds: Stores all the standard deviations of measurement columns.
separated: Variable used to store an intermediate result.
new_dataset: Used to store the final required dataset, which is later stored in a file called 'new_dataset.txt'.
