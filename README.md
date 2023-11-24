# dbt-template

[![Makefile CI](https://github.com/obar1/pyproject-template/actions/workflows/makefile.yml/badge.svg)](https://github.com/obar1/pyproject-template/actions/workflows/makefile.yml)

simple dbt project template with some models
- load some data from http://archive.ics.uci.edu/ to local duckdb
- simple dataflow using `dbt`

## setup 

use makefile [here](./Makefile)

## example of usage

- load sample data in local db
```shell
make loaddb0
```
![Alt text](others/image-0.png)

- have a look at the data loaded
```shell
make connectdb0
```
![Alt text](others/image-1.png)

- run dbt 
```shell
make run
```
![Alt text](others/image-2.png)

- have a look at the models generated
```shell
make connectdb0
```
![Alt text](others/image-3.png)

![Alt text](others/image-4.png)
...
![Alt text](others/image-5.png)

> do the same for wine ... :)

## dbt extensions

def I suggest [innoverio.vscode-dbt-power-user](https://github.com/AltimateAI/vscode-dbt-power-user)
