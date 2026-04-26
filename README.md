# Multiple-Regression-of-housing-market
 This project analyzes housing price data using multiple linear regression in R. The goal is to estimate a baseline model, diagnose its statistical issues, and develop an improved model that better satisfies OLS assumptions and more accurately explains variation in home prices.  
<-Dataset
The dataset, homeSales.csv, contains home sale prices and property characteristics, including:

Number of bedrooms

Number of bathrooms

Square footage of living area

Year built

School district indicators (HS, SC)

Sale price

Base Model
The base model predicts raw sale price using six predictors:
Code
lm(price ~ bedrooms + bathrooms + sqft_living + yr_built + HS + SC)
<-Key Findings:
Bedrooms and year built have negative coefficients, which is counterintuitive.
School‑district effects are extremely large, suggesting omitted variables or nonlinear structure.
Diagnostic plots show heteroskedasticity, curvature, and several moderately influential points.
VIF values indicate low multicollinearity, so the issues stem from model form rather than collinearity.

The improved model provides a more accurate, interpretable, and statistically valid representation of housing prices. By addressing nonlinearity and heteroskedasticity through log‑transformations, the model better satisfies OLS assumptions and yields insights that align with real‑world housing market behavior.

Conclusion
The base model violates several OLS assumptions and does not adequately capture the structure of housing prices.
