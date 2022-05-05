library(dplyr)
library(psych)
library(ggplot2)
library(tidyr)
library(summarytools)
library(hrbrthemes)
library(ggpubr)


# Check assumptions:
# [ ] Normality
# [ ] Homogeneity

# Normality Assumption -------
# Check skew to see it transformation are necessary. 

iris %>% 
  describeBy( group = "Species")

# visualize histogram of all variables for a quick overview
iris %>% 
  group_by(Species) %>% 
  dfSummary() %>% 
  view()
library(tidyr)
iris_long <- iris %>% 
  pivot_longer(Sepal.Length:Petal.Width, 
               names_to = "name",
               values_to = "value")

iris_long %>% 
  ggplot(aes(x=value, group=Species, fill=Species)) +
  geom_histogram(alpha=.4, position = "dodge") +
  facet_wrap( ~name, scale = "free_y") +
  theme_ipsum()

iris_long %>% 
  ggplot(aes(x=value, group=Species, fill=Species)) +
  geom_density(adjust=1.5, alpha=.4) +
  facet_wrap( ~name, scale = "free_y") +
  theme_ipsum()
## in this case, all of them seems normal distribuited.
## Now, let's check new assumption

# Homogeneity assumption -----
library(rstatix)

iris %>% 
  count(Species) ### start by checking the groups just to be sure.

## `nh` = (nonhomogenous)

nh_S_Ve <- iris_long %>% 
  filter(Species != 'virginica') %>% 
  group_by(name) %>% 
  levene_test(value ~ Species) %>% 
  filter(p<.05)  %>% 
  mutate(contrast = "set vs. ver") # add the contrast 

nh_S_Vi <- iris_long %>% 
  filter(Species != 'versicolor') %>% 
  group_by(name) %>% 
  levene_test(value ~ Species) %>% 
  filter(p<.05)  %>% 
  mutate(contrast = "set vs. vir")

nh_Ve_Vi <-  iris_long %>% 
  filter(Species != 'setosa') %>% 
  group_by(name) %>% 
  levene_test(value ~ Species) %>% 
  filter(p<.05) %>% 
  mutate(contrast = "ver vs. vir")
  
## Unify all nonhomogeneous groups into `nh` (nonhomogenous)
 
nh <- nh_S_Ve %>% 
  full_join(nh_S_Vi) %>% 
  full_join(nh_Ve_Vi) %>% 
  select(name, contrast)

# Run t tests -----
## first, let's get all possible comparisons between groups we have
comparison_groups <- iris %>% get_comparisons(Species)

## t values contrast group calculations - with and without variance assumption ----

### Equal Variance Assumed ----
### ev_t = Equal Variance t
### nev_t = not Equal Variance t (welch adapation of df)

ev_t <- iris_long %>% 
  group_by(name) %>% 
  t_test(value ~ Species,
         comparisons = comparison_groups,
         var.equal = TRUE) %>% 
  select(-contains(".adj")) %>% # remove p adjusted values because we will run it again later with all comparisons.
  mutate( contrast = paste( substr(group1, 1, 3),
                            "vs.",
                            substr(group2, 1, 3)))
  
nev_t <- iris_long %>% 
  group_by(name) %>% 
  t_test(value ~ Species,
         comparisons = comparison_groups,
         var.equal = FALSE) %>% 
  select(-contains(".adj")) %>% # remove p adjusted values because we will run it again later with all comparisons.
  mutate( contrast = paste( substr(group1, 1, 3),
                            "vs.",
                            substr(group2, 1, 3)))


# exctrating t's according to levene's test
all_ts <- ev_t %>% 
  anti_join(nh) %>% 
  full_join(
    nev_t %>% inner_join(nh)
            ) 


result_t_d <- all_ts %>% 
  adjust_pvalue(method = "holm") %>% #calculate adjusted values based on the new data
  select(contrast, everything()) %>% 
  add_significance(p.col = "p",
                   output.col = "p.signif") %>% 
  add_significance() %>% 
  p_format(digits = 4, leading.zero = FALSE) %>% 
  full_join(iris_long %>% 
              group_by(name) %>% 
              rstatix::cohens_d(value ~ Species) # add cohen's d - I have to revie this part
            ) %>%                                # for var.equal = TRUE, and var.equal = FALSE
  mutate(across(statistic:df, ~round(., 2)),
         across(effsize, ~round(., 2))) 


  
# plots ------

iris_long %>% # I still have to find how to add p values and d values into this plot
  ggboxplot(x = "Species", y = "value",
            fill = "Species", palette = "npg", legend = "none",
            ggtheme = theme_pubr(border = TRUE) ) +
  geom_jitter( alpha = .2) +
  facet_wrap(~name, scale = "free_y") 


result_t_d %>% 
  ggplot(aes(x = contrast, y = effsize, fill = name)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_ipsum()


