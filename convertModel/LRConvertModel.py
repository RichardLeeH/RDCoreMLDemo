# Required Packages
from sklearn.linear_model import LinearRegression
import pandas as pd
import coremltools

# Load data
data = pd.read_csv('input_data.csv')

# Train a model
model = LinearRegression()
model.fit(data[["Square_Feet"]], data["Price"])

# Convert and save the scikit-learn model
coreml_model = coremltools.converters.sklearn.convert(model, "Square_Feet", "Price")

# Set model metadata
coreml_model.author = 'RichardLee'
coreml_model.license = 'BSD'
coreml_model.short_description = 'Predicts the price of a house in the Seattle area.'

# Set feature descriptions manually
coreml_model.input_description['Square_Feet'] = 'Size (in square feet)'

# Set the output descriptions
coreml_model.output_description['Price'] = 'Price of the house'

# Save the model
coreml_model.save('HousePricer.mlmodel')