# having a look at the column names
df.columns

# lower case column names
df.columns=[i.lower() for i in df.columns]

# check number of null values
df.isnull().sum(axis = 0)

# drop empty columns or columns with too many null values
df = df.drop("unnamed: 0",axis=1)
df = df.drop("vehicle type",axis=1)

# fill "number of open complaints" column with 0
df['number of open complaints'] = df['number of open complaints'].fillna(0)

# change date column to date datatype
df['effective to date'] = pd.to_datetime(df['effective to date'])

# extract month from date column
df['month'] = df['effective to date'].dt.month