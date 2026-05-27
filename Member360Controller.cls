public with sharing class Member360Controller {

    @AuraEnabled(cacheable=true)
    public static Member360Wrapper getMember360Details(String searchKey) {
        if (String.isBlank(searchKey)) {
            return null;
        }

        String keyword = searchKey.trim().toLowerCase();

        List<Member360Wrapper> members = getMockMembers();

        for (Member360Wrapper member : members) {
            if (
                member.memberId.toLowerCase().contains(keyword) ||
                member.memberName.toLowerCase().contains(keyword)
            ) {
                return member;
            }
        }

        return null;
    }

    private static List<Member360Wrapper> getMockMembers() {
        List<Member360Wrapper> members = new List<Member360Wrapper>();

        Member360Wrapper memberOne = new Member360Wrapper();
        memberOne.memberId = 'M001';
        memberOne.memberName = 'John Smith';
        memberOne.dateOfBirth = '04/15/1984';
        memberOne.status = 'Active';
        memberOne.lineOfBusiness = 'NYM';
        memberOne.planName = 'Essential Plan';
        memberOne.county = 'Queens';
        memberOne.phone = '(555) 111-2200';
        memberOne.email = 'john.smith@example.com';

        memberOne.eligibility = new EligibilityWrapper();
        memberOne.eligibility.effectiveDate = '01/01/2026';
        memberOne.eligibility.terminationDate = '12/31/2026';
        memberOne.eligibility.primaryCareProvider = 'Dr. Amanda Lee';
        memberOne.eligibility.pcpStatus = 'Assigned';

        memberOne.cases = new List<CaseSummaryWrapper>{
            new CaseSummaryWrapper('C-1001', 'Benefits Question', 'Open', 'Medium', '05/12/2026'),
            new CaseSummaryWrapper('C-1002', 'Address Update', 'Closed', 'Low', '04/22/2026')
        };

        memberOne.claims = new List<ClaimSummaryWrapper>{
            new ClaimSummaryWrapper('CLM-9001', 'Medical', '$245.00', 'Paid', '05/02/2026'),
            new ClaimSummaryWrapper('CLM-9002', 'Pharmacy', '$38.40', 'Pending', '05/08/2026')
        };

        memberOne.careGaps = new List<String>{
            'Annual wellness visit due',
            'Flu vaccination not recorded'
        };

        members.add(memberOne);

        Member360Wrapper memberTwo = new Member360Wrapper();
        memberTwo.memberId = 'M002';
        memberTwo.memberName = 'Sarah Johnson';
        memberTwo.dateOfBirth = '09/03/1978';
        memberTwo.status = 'Active';
        memberTwo.lineOfBusiness = 'MLTC';
        memberTwo.planName = 'Managed Long Term Care';
        memberTwo.county = 'Brooklyn';
        memberTwo.phone = '(555) 222-3300';
        memberTwo.email = 'sarah.johnson@example.com';

        memberTwo.eligibility = new EligibilityWrapper();
        memberTwo.eligibility.effectiveDate = '02/01/2026';
        memberTwo.eligibility.terminationDate = '12/31/2026';
        memberTwo.eligibility.primaryCareProvider = 'Dr. Michael Brown';
        memberTwo.eligibility.pcpStatus = 'Assigned';

        memberTwo.cases = new List<CaseSummaryWrapper>{
            new CaseSummaryWrapper('C-2001', 'Transportation Request', 'Open', 'High', '05/18/2026')
        };

        memberTwo.claims = new List<ClaimSummaryWrapper>{
            new ClaimSummaryWrapper('CLM-8001', 'Home Care', '$1,250.00', 'Paid', '04/28/2026')
        };

        memberTwo.careGaps = new List<String>{
            'Care plan review required'
        };

        members.add(memberTwo);

        return members;
    }

    public class Member360Wrapper {
        @AuraEnabled public String memberId;
        @AuraEnabled public String memberName;
        @AuraEnabled public String dateOfBirth;
        @AuraEnabled public String status;
        @AuraEnabled public String lineOfBusiness;
        @AuraEnabled public String planName;
        @AuraEnabled public String county;
        @AuraEnabled public String phone;
        @AuraEnabled public String email;
        @AuraEnabled public EligibilityWrapper eligibility;
        @AuraEnabled public List<CaseSummaryWrapper> cases;
        @AuraEnabled public List<ClaimSummaryWrapper> claims;
        @AuraEnabled public List<String> careGaps;
    }

    public class EligibilityWrapper {
        @AuraEnabled public String effectiveDate;
        @AuraEnabled public String terminationDate;
        @AuraEnabled public String primaryCareProvider;
        @AuraEnabled public String pcpStatus;
    }

    public class CaseSummaryWrapper {
        @AuraEnabled public String caseNumber;
        @AuraEnabled public String subject;
        @AuraEnabled public String status;
        @AuraEnabled public String priority;
        @AuraEnabled public String createdDate;

        public CaseSummaryWrapper(String caseNumber, String subject, String status, String priority, String createdDate) {
            this.caseNumber = caseNumber;
            this.subject = subject;
            this.status = status;
            this.priority = priority;
            this.createdDate = createdDate;
        }
    }

    public class ClaimSummaryWrapper {
        @AuraEnabled public String claimNumber;
        @AuraEnabled public String claimType;
        @AuraEnabled public String amount;
        @AuraEnabled public String status;
        @AuraEnabled public String serviceDate;

        public ClaimSummaryWrapper(String claimNumber, String claimType, String amount, String status, String serviceDate) {
            this.claimNumber = claimNumber;
            this.claimType = claimType;
            this.amount = amount;
            this.status = status;
            this.serviceDate = serviceDate;
        }
    }
}
