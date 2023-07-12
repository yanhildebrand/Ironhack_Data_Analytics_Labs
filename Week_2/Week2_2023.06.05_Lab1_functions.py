



# Rename columns to lower case
df.columns=[i.lower() for i in df.columns]
print(df.columns)

# Homogenize State column
df["st"] = df["st"].replace({"Cali": "California"})
df["st"] = df["st"].replace({"WA": "Washington"})
df["st"] = df["st"].replace({"AZ": "Arizona"})

# Fix "Number of Open Complaints" column
if len(str(df["number of open complaints"][2])) > 1:
    df["number of open complaints"] = df["number of open complaints"].apply(lambda x:str(x)[2])


# change column data types
df['customer'] = pd.Categorical(df.customer)
df['st'] = pd.Categorical(df.st)
df['gender'] = pd.Categorical(df.gender)
df['education'] = pd.Categorical(df.education)
df['policy type'] = pd.Categorical(df["policy type"])
df['vehicle class'] = pd.Categorical(df["vehicle class"])
df['number of open complaints'] = df['number of open complaints'].astype(dtype = 'int64')
df['customer lifetime value'] = df['customer lifetime value'].str.replace("%", "")

# drop nas
df = df.dropna()

# drop duplicates
df = df.drop_duplicates(keep="first")
