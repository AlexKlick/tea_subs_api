
# Tea Subscription API
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#queries">Queries</a></li>
    <li><a href="#json-output">JSON Output</a></li>
    <li><a href="#acknowldgements">Acknowldgementst</a></li>
  </ol>
</details>

## About The Project
Tea Subscriptions API is a practice take home exam, done over a 4 day period with approximately 6 hours of work put into it. It is a subscription service where a customer can see their subscriptions, add subscriptions and delete old subscriptions for a tea shipment service. It uses the [Tea-API](https://tea-api-vic-lo.herokuapp.com/) for gathering data on tea that is available for purchasing subscriptions. The goal with this aspect was to simulate a vendor which sources their tea from a wholesale supplier with a changing rotation of tea. 

### Built With

| Framework / Languages       | Testing / Debugging         | Methodology     | Other Gems            |
|-----------------------------|-----------------------------|-----------------|-----------------------|
| ![RubyOnRails][rails-badge] | ![][rspec-badge]            | ![][git-badge]  | ![][factorybot-badge] |
| ![][ruby-badge]             | ![][vcr-badge]              | ![][agile]      | ![][faker-badge]      |
| ![][postgresql-badge]       | ![][webmock-badge]          | ![][rest-badge] | ![][faraday-badge]    |
| ![][active-record-badge]    | ![][capybara-badge]         | ![][tdd-badge]  |                       |
|                             | ![][shoulda-matchers-badge] |                 |                       |
|                             | ![][simplecov-badge]        |                 |                       |
|                             | ![][pry-badge]              |                 |                       |

[git-badge]: https://img.shields.io/badge/git-345d3c.svg?&style=plastic&logo=git&logoColor=white
[rspec-badge]: https://img.shields.io/badge/rspec-345d3c.svg?&style=plastic&logo=rubygems&logoColor=white
[shoulda-matchers-badge]: https://img.shields.io/badge/shoulda--matchers-345d3c.svg?&style=plastic&logo=rubygems&logoColor=white
[vcr-badge]: https://img.shields.io/badge/vcr-345d3c.svg?&style=plastic&logo=rubygems&logoColor=white
[webmock-badge]: https://img.shields.io/badge/webmock-345d3c.svg?&style=plastic&logo=rubygems&logoColor=white
[capybara-badge]: https://img.shields.io/badge/capybara-345d3c.svg?&style=plastic&logo=rubygems&logoColor=white
[postgresql-badge]: https://img.shields.io/badge/PostgreSQL-345d3c.svg?&style=plastic&logo=postgresql&logoColor=white
[rails-badge]: https://img.shields.io/badge/Ruby%20on%20Rails-345d3c.svg?style=plastic&logo=rubyonrails&logoColor=black&color=red
[factorybot-badge]: https://img.shields.io/badge/factorybot-345d3c.svg?&style=plastice&logo=rubygems&logoColor=white
[faker-badge]: https://img.shields.io/badge/faker-345d3c.svg?&style=plastice&logo=rubygems&logoColor=white
[faraday-badge]: https://img.shields.io/badge/faraday-345d3c.svg?&style=plastice&logo=rubygems&logoColor=white
[pry-badge]: https://img.shields.io/badge/pry-345d3c.svg?&style=plastic&logo=rubygems&logoColor=white
[simplecov-badge]: https://img.shields.io/badge/simplecov-345d3c.svg?&style=plastic&logo=rubygems&logoColor=white
[active-record-badge]: https://img.shields.io/badge/ActiveRecord-345d3c.svg?&style=plastic&logo=rubyonrails&logoColor=white
[ruby-badge]: https://img.shields.io/badge/ruby-345d3c.svg?&style=plastic&logo=ruby&logoColor=white
[agile]: https://img.shields.io/badge/Agile%20Process-blue.svg?logo=data:image/png;base64,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
[tdd-badge]: https://img.shields.io/badge/TDD-345d3c.svg?&style=plastic&logo=TDD&logoColor=white
[rest-badge]: https://img.shields.io/badge/REST-345d3c.svg?&style=plastic&logo=REST&logoColor=white

## Getting Started

### Prerequisites
In order to run this application locally, you will need:
* rails 5.2.6
* ruby 2.7.2
* [PostgreSQL](https://www.postgresql.org/docs/9.5/functions-aggregate.html)

## Usage

1. Clone the repo
   ```
   git clone https://github.com/AlexKlick/tea_subs_api.git
   ```
2. Change directory
   ```
   cd tea_subs_api
   ```
3. Install gems
   ```
   bundle install
   ```
4. Create local DB
   ```
   rails db:create
   rails db:migrate
   ```
5. Seed Database to have some users
   ```
    rails db:seed
   ```
6. Running Locally
   ```
    rails s 
   ```
7. Running Tests
   ```
    bundle exec rspec
   ```
## Queries

| HTTP Verb   | Endpoint                                      | Type                     | Description                                       | JSON Output         |
|-------------|-----------------------------------------------|--------------------------|---------------------------------------------------|---------------------|
| GET         | /api/v1/customers/:customer_id/tea_subscriptions     | tea_subscriptions index  | return all tea subscriptions for a given customer | [Link](#tea_subscriptions_index)  |
| POST        | /api/v1/customers/:customer_id/tea_subscriptions     | tea_subscriptions create | create a new subscription for a customer          | [Link](#create_subscription) |
| PUT / PATCH | /api/v1/customers/:customer_id/tea_subscriptions/:id | tea_subscriptions update | cancel a tea subscription for a customer          | [Link](#cancel_subscription) |                   

## JSON Output
### Tea Subscriptions Index
```
GET http://localhost:3000/api/v1/customers/1/tea_subscriptions

{
    "data": [
        {
            "id": "5",
            "type": "TeaSubscription",
            "attributes": {
                "title": "chamomileeverymonthly",
                "price": 10.99,
                "status": "active",
                "frequency": "monthly"
            },
            "relationships": {
                "customer": {
                    "data": {
                        "id": "1",
                        "type": "Customer"
                    }
                }
            }
        }
    ]
}
```
### Create Subscription
```
POST http://localhost:3000/api/v1/customers/1/tea_subscriptions?frequency=monthly&price=10.99

  Status: 201 Created
```
### Cancel Subscription
```
  Status: 202 Accepted
  
  this updates the GET request to:
  {
    "data": [
        {
            "id": "5",
            "type": "TeaSubscription",
            "attributes": {
                "title": "chamomileeverymonthly",
                "price": 10.99,
                "status": "deactivated",
                "frequency": "monthly"
            },
            "relationships": {
                "customer": {
                    "data": {
                        "id": "1",
                        "type": "Customer"
                    }
                }
            }
        }
    ]
}
  
```
## Acknowledgements

To complete this project, I used the [Tea API](tea-api-vic-lo.herokuapp.com/#), created by Victoria Lo!
