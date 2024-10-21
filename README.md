Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

```sql
duckdb dev.duckdb
create schema raw;
set schema='raw';
create table EchoFindingCodesEmbeddedInStudy as select * from '.private/EchoFindingCodesEmbeddedInStudy.csv';
create table EchoStudies as select * from '.private/EchoStudies.csv';
.exit
```

```sql
select
	EchoFindingCodesEmbeddedInStudy.*
from
	DataMining.dbo.EchoStudies
	inner join DataMining.dbo.EchoFindingCodesEmbeddedInStudy on EchoStudies.PerformedProcedureID = EchoFindingCodesEmbeddedInStudy.PerformedProcedureID
where
	1 = 1
	AND EchoStudies.FormattedProcedureDate < '20240101'--@EndDate
	AND EchoStudies.StudyConfig3 like '%TRANSCRANIAL%'
;
```