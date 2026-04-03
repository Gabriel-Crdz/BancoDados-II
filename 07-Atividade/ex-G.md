## Problema

The financial sector of the company wants to know the **smallest** and **highest** values of the products that are sold.
For this, you must display only the **highest** and **lowest** price from the `products` table.

---

## Schema

### products
| Column   | Type    |
|----------|---------|
| id (PK)  | numeric |
| name     | varchar |
| amount   | numeric |
| price    | numeric |

---

## Tabelas

### products
| id | name                 | amount | price  |
|----|----------------------|--------|--------|
| 1  | Two-doors wardrobe   | 100    | 800    |
| 2  | Dining table         | 1000   | 560    |
| 3  | Towel holder         | 10000  | 25.50  |
| 4  | Computer desk        | 350    | 320.50 |
| 5  | Chair                | 3000   | 210.64 |
| 6  | Single bed           | 750    | 460    |

---

## Saida Esperada
| price | price |
|-------|-------|
| 800   | 25.50 |

---

## Solução

```sql
SELECT MAX(price) AS price, MIN(price) AS price
FROM products;
```