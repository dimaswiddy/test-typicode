@posts @regression
Feature: API test for post posts
  Background:
    * url baseUrls.typicodeSystem

  Scenario: success create a post
    * def body = 'Hello everyone!'
    * def title = 'My Post'
    * def post = read(jsonResourcePath + '/postPostsRequest.json')

    Given path 'posts'
    And request post
    When method post
    Then status 201
    And match response == read(jsonResourcePath + '/postPostsResponse.json')
    And match response.body == body
    And match response.title == title

  Scenario: failed create a post with non-exist user
  (should be a failed case, because i assume user id is only 1 - 10. should be 404 because user not found)
    * def body = 'Hello everyone!'
    * def title = 'My Post'
    * def post = read(jsonResourcePath + '/postPostsRequest.json')
    * post.userId = 11

    Given path 'posts'
    And request post
    When method post
    Then status 201
    And match response == read(jsonResourcePath + '/postPostsResponse.json')
    And match response.body == body
    And match response.title == title

  Scenario: failed create a post with malformed user id
  (should be a failed case, because i assume user id is using integer. should be 400 because not expected user id format)
    * def body = 'Hello everyone!'
    * def title = 'My Post'
    * def post = read(jsonResourcePath + '/postPostsRequest.json')
    * post.userId = 'unknown'
    * def response = read(jsonResourcePath + '/postPostsResponse.json')
    * response.id = '##string'

    Given path 'posts'
    And request post
    When method post
    Then status 201
    And match response == response
    And match response.body == body
    And match response.title == title