@IsTest
private class Member360ControllerTest {

    @IsTest
    static void testGetMemberById() {
        Test.startTest();
        Member360Controller.Member360Wrapper result =
            Member360Controller.getMember360Details('M001');
        Test.stopTest();

        System.assertNotEquals(null, result);
        System.assertEquals('John Smith', result.memberName);
        System.assertEquals('NYM', result.lineOfBusiness);
    }

    @IsTest
    static void testGetMemberByName() {
        Test.startTest();
        Member360Controller.Member360Wrapper result =
            Member360Controller.getMember360Details('Sarah');
        Test.stopTest();

        System.assertNotEquals(null, result);
        System.assertEquals('M002', result.memberId);
        System.assertEquals('MLTC', result.lineOfBusiness);
    }

    @IsTest
    static void testNoMemberFound() {
        Test.startTest();
        Member360Controller.Member360Wrapper result =
            Member360Controller.getMember360Details('XYZ');
        Test.stopTest();

        System.assertEquals(null, result);
    }

    @IsTest
    static void testBlankSearch() {
        Test.startTest();
        Member360Controller.Member360Wrapper result =
            Member360Controller.getMember360Details('');
        Test.stopTest();

        System.assertEquals(null, result);
    }
}
