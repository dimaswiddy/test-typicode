@comments @regression
Feature: API test for posts comments
  Background: 
    * url baseUrls.typicodeSystem
    
  Scenario: success get comment by post id
    * def postId = 1
    Given path 'posts',postId,'comments'
    When method get
    Then status 200
    And match response[0] == read(jsonResourcePath + '/getPostsCommentsResponse.json')
    And match response[0].postId == postId

  Scenario: failed get comment with not found post id (should've return 404 because post id is not exist)
    * def postId = 101
    Given path 'posts',postId,'comments'
    When method get
    Then status 200
    And match response == []

  Scenario: failed get comment with malformed post id (should've return 400 because post id is not number)
    * def postId = 'string'
    Given path 'posts',postId,'comments'
    When method get
    Then status 200
    And match response == []

