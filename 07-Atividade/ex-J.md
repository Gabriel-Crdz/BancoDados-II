## Problema

The video store company has the objectives of creating several franchises 
spread throughout Brazil. For this, we want to know in which cities our customers live.
Your task is to help us select the name of all the cities 
where the rental company has clients. **Do not repeat the name of the city.**

---

## Schema

### customers

| Column | Type |
|--------|------|
| id (PK) | numeric |
| name    | varchar |
| street  | varchar |
| city    | varchar |

---

## Tabelas

### customers

| id | name                       | street                         | city          |
|----|----------------------------|--------------------------------|---------------|
| 1  | Giovanna Goncalves Oliveira | Rua Mato Grosso                | Canoas        |
| 2  | Kauã Azevedo Ribeiro        | Travessa Ibiá                  | Uberlândia    |
| 3  | Rebeca Barbosa Santos       | Rua Observatório Meteorológico | Salvador      |
| 4  | Sarah Carvalho Correia      | Rua Antônio Carlos da Silva    | Uberlândia    |
| 5  | João Almeida Lima           | Rua Rio Taiuva                 | Ponta Grossa  |
| 6  | Diogo Melo Dias             | Rua Duzentos e Cinqüenta       | Várzea Grande |

---

## Saida ESperada

| city          |
|---------------|
| Uberlândia    |
| Canoas        |
| Ponta Grossa  |
| Várzea Grande |
| Salvador      |

---

## Solução

```sql
SELECT DISTINCT city 
FROM customers 
ORDER BY city;
```