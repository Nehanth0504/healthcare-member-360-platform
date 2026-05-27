# Healthcare Member 360 Platform

A Salesforce Lightning Web Component project that simulates a healthcare Member 360 dashboard for service agents.

## Overview

This project demonstrates how a Salesforce developer can build an enterprise-style healthcare dashboard using LWC, Apex, SLDS, and integration-ready architecture.

## Business Use Case

Healthcare call center agents often need to view member information from multiple systems in one place.

This project simulates that experience by showing a single Member 360 view with:

- Member profile
- Eligibility details
- Plan information
- Recent cases
- Recent claims
- Care gaps

## Features

- Member search by ID or name
- Member profile dashboard
- Eligibility summary
- Claims summary
- Case summary
- Care gaps section
- Loading state
- Empty result handling
- Error handling
- Apex test class included
- Integration-ready architecture

## Tech Stack

- Salesforce Lightning Web Components
- Apex
- SLDS
- Salesforce DX
- Mock healthcare data

## Project Structure

```txt
force-app/main/default/classes
force-app/main/default/lwc/member360Dashboard
docs
mock-data
screenshots
README.md
```

## How It Works

```txt
User enters Member ID or Name
        ↓
LWC calls Apex controller
        ↓
Apex returns mock Member 360 wrapper response
        ↓
LWC displays profile, eligibility, cases, claims, and care gaps
```

## Sample Searches

```txt
M001
John
M002
Sarah
XYZ
```

## Main Component

```txt
member360Dashboard
```

## Apex Classes

```txt
Member360Controller.cls
Member360ControllerTest.cls
```

## Future Enhancements

- MuleSoft API integration
- Named Credential configuration
- Real Case object integration
- Claims API callout
- Eligibility API callout
- Platform Event error logging
- AI-generated case summary
- Experience Cloud member portal

## Recruiter Value

This project demonstrates practical Salesforce experience in healthcare workflows, Service Cloud style UI, Lightning Web Components, Apex controller design, and enterprise integration architecture.
