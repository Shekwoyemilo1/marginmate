# MarginMate MVP

A first working prototype of our business-profitability tool.

## Run it
Open `index.html` in a modern browser. No installation or build step is needed.

## What works
- Live per-sale profit and margin calculator
- Product lab to save and compare products
- Monthly profit target and estimated sales-needed calculation
- Browser-local persistence using localStorage
- CSV export of saved products
- Responsive layout for phone and desktop

## Important prototype limits
- Values are currently denominated in USD.
- Data is stored only in the current browser/device; it is not synced and is not suitable for multi-user production use.
- Profit estimates exclude taxes, returns, subscriptions, and other overhead unless entered into the cost fields.
- There is no account system, hosted database, payment system, or AI integration yet.

## Suggested next build
1. Add currency selection.
2. Add product editing and expected monthly sales.
3. Move data to a backend with authentication and a database.
4. Validate the idea with a few real sellers before adding paid plans.
