import { LightningElement } from 'lwc';
import getMember360Details from '@salesforce/apex/Member360Controller.getMember360Details';

export default class Member360Dashboard extends LightningElement {
    searchKey = '';
    member;
    error;
    isLoading = false;
    hasSearched = false;

    caseColumns = [
        { label: 'Case Number', fieldName: 'caseNumber' },
        { label: 'Subject', fieldName: 'subject' },
        { label: 'Status', fieldName: 'status' },
        { label: 'Priority', fieldName: 'priority' },
        { label: 'Created Date', fieldName: 'createdDate' }
    ];

    claimColumns = [
        { label: 'Claim Number', fieldName: 'claimNumber' },
        { label: 'Type', fieldName: 'claimType' },
        { label: 'Amount', fieldName: 'amount' },
        { label: 'Status', fieldName: 'status' },
        { label: 'Service Date', fieldName: 'serviceDate' }
    ];

    get memberFound() {
        return this.member !== undefined && this.member !== null;
    }

    get noMemberFound() {
        return this.hasSearched && !this.memberFound && !this.error && !this.isLoading;
    }

    get caseCount() {
        return this.member && this.member.cases ? this.member.cases.length : 0;
    }

    get claimCount() {
        return this.member && this.member.claims ? this.member.claims.length : 0;
    }

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
    }

    handleSearch() {
        this.error = undefined;
        this.member = undefined;
        this.isLoading = true;
        this.hasSearched = true;

        getMember360Details({ searchKey: this.searchKey })
            .then((result) => {
                this.member = result;
                this.isLoading = false;
            })
            .catch((error) => {
                this.member = undefined;
                this.isLoading = false;
                this.error = this.getErrorMessage(error);
            });
    }

    handleClear() {
        this.searchKey = '';
        this.member = undefined;
        this.error = undefined;
        this.isLoading = false;
        this.hasSearched = false;
    }

    getErrorMessage(error) {
        if (error && error.body && error.body.message) {
            return error.body.message;
        }
        if (error && error.message) {
            return error.message;
        }
        return 'Unexpected error while loading member details.';
    }
}
