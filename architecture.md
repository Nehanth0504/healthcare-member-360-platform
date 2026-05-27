# Healthcare Member 360 Platform Architecture

## Purpose

This project simulates a Salesforce healthcare service console experience where agents can view a complete Member 360 profile.

## Flow

```txt
User searches member
        ↓
LWC captures search keyword
        ↓
Apex controller returns member data
        ↓
LWC displays Member 360 dashboard
```

## Components

- `member360Dashboard` Lightning Web Component
- `Member360Controller` Apex controller
- Apex wrapper classes
- Mock healthcare member data

## Enterprise Patterns Demonstrated

- LWC to Apex communication
- Apex wrapper response pattern
- Service Cloud style UI
- Error handling
- Empty state handling
- Integration-ready architecture

## Future Architecture

```txt
Salesforce LWC
        ↓
Apex Service Layer
        ↓
Named Credential
        ↓
MuleSoft API
        ↓
Eligibility / Claims / Member Systems
```
