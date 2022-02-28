library(dplyr)
library(psych)
library(ggplot2)
library(tidyr)
library(summarytools)
library(hrbrthemes)
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


nonhomogenous_S_Ve <- iris_long %>% 
  filter(Species != 'virginica') %>% 
  group_by(name) %>% 
  levene_test(value ~ Species) %>% 
  filter(p<.05)  %>% 
  mutate(contrast = "set vs ver") # add the contrast 

nonhomogenous_S_Vi <- iris_long %>% 
  filter(Species != 'versicolor') %>% 
  group_by(name) %>% 
  levene_test(value ~ Species) %>% 
  filter(p<.05)  %>% 
  mutate(contrast = "set vs vir")

nonhomogenous_Ve_Vi <-  iris_long %>% 
  filter(Species != 'setosa') %>% 
  group_by(name) %>% 
  levene_test(value ~ Species) %>% 
  filter(p<.05) %>% 
  mutate(contrast = "ver vs vir")
  
## Unify all nonhomogeneous groups into `nh` (nonhomogenous)
 
nh <- nonhomogenous_S_Ve %>% 
  full_join(nonhomogenous_S_Vi) %>% 
  full_join(nonhomogenous_Vi_Ve) 


# Run t tests -----
## first, let's get all possible comparisons between groups we have
comparison_groups <- iris %>% get_comparisons(Species)

## t values contrast group calculations - with and without variance assumption ----

### Equal Variance Assumed ----

iris_long %>% 
  group_by(name) %>% 
  t_test(value ~ Species,
         comparisons = comparison_groups,
         var.equal = TRUE) %>% 
  select(-contains(".adj")) %>% # remove p adjusted values because we will run it again later with all comparisons.
  mutate( contrast = paste( substr(group1, 1, 3),
                            "vs. ",
                            substr(group2, 1, 3)))
  


