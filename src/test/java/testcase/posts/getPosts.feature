@posts @regression
Feature: API test for get posts
  Background:
    * url baseUrls.typicodeSystem

  Scenario: success get all posts order by id asc
    Given path 'posts'
    When method get
    Then status 200

    * def firstPost = response[0]
    * def secondPost = response[1]

    And assert firstPost.id < secondPost.id
    And match firstPost == read(jsonResourcePath + '/getPostsResponse.json')

  Scenario: success get posts with valid id
    Given path 'posts'
    When method get
    Then status 200
    
    * def firstPost = response[0]
    
    Given path 'posts', firstPost.id
    When method get
    Then status 200
    And match response.id == firstPost.id
    And match firstPost == read(jsonResourcePath + '/getPostsResponse.json')

  Scenario: failed get posts with not-exist post id
    Given path 'posts','101'
    When method get
    Then status 404
    And match response == {}

  Scenario: failed get posts with malformed post id
    Given path 'posts','string'
    When method get
    Then status 404
    And match response == {}
