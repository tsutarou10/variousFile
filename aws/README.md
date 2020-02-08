# Personal note of AWS

## AWS Elastic Transcoder
AWS Elastic Transcoder is the service that can convert video files to video files compatible with various devices.

## Amazon SES
Amazon SES (Simple Email Service) is a service provided by Amazon that can send and recive E-mail.

## Amazon DocumentDB
Amazon DocumentDB is a full managed document database service that is scarable and high available.
This service can be recieved schemaless JSON.

### Usecase Example
- user profile (It is often different by each user to save data.)
- Product data on EC site

### DynamoDB vs DocumentDB
DynamoDB is higher scarable than DocumentDB is. However superiority of DocumentDB is that you can flexibily query. So it is convinience when there is multiple accsess petern.

## Step Functions
Step Functions is a managed service that can visually design connecting subdivided functions.
You can design how to execute AWS Lambda, Amazon ECS, services you define and so on.

### Step Functions vs other service
- You want to track all services and events in applications.
    - You should use Step Functions.
- You need high scalable queue to manage messages between services.
    - You should use SQS.

## QuickSight
QuickSight is a BI service that can automatically scale without managing.
