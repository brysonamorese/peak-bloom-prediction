


```{r}
library(dplyr)

cherry <- read.csv("data/washingtondc.csv") |> 
  bind_rows(read.csv("data/liestal.csv")) |> 
  bind_rows(read.csv("data/kyoto.csv")) |> 
  bind_rows(read.csv("data/vancouver.csv")) |> 
  bind_rows(read.csv("data/nyc.csv"))
```

```{r}
head(cherry)
```

```{r}
str(cherry)
summary(cherry)

```
```{r}
library(ggplot2)

ggplot(cherry, aes(x = year, y = bloom_doy, color = location)) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE) +
  labs(title = "Peak bloom trends over time", y = "Day of Year", x = "Year")

```
```{r}
ggplot(cherry, aes(x = bloom_doy)) +
  geom_histogram(bins = 30, fill = "lightblue") +
  facet_wrap(~location, scales = "free_y") +
  labs(title = "Distribution of peak bloom days")

```
```{r}
pairs(cherry[, c("bloom_doy", "lat", "long", "alt", "year")])

```


