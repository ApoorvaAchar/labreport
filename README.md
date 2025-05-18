# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


curl -X POST http://localhost:3000/api/test_result_upload   -H "Content-Type: application/json"   -d '{
    "patient": {
      "name": "John Doe",
      "gender": "Male",
      "age": 30,
      "test_done_at": "2025-05-14T10:00:00Z",
      "patient_no": "P12345"
    },
    "test_result": [
      {
        "result": "Positive",
        "key": "",
        "unit": "N/A",
        "name": "COVID-19 PCR Test"
      },
      {
        "result": "100",
        "key": "",
        "unit": "mg/dL",
        "name": "Fasting Blood Sugar"
      }
    ]
  }'




In terminal -> Inside application folder 

bundle exec sidekiq