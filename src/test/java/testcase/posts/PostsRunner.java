package testcase.posts;

import com.intuit.karate.junit5.Karate;


public class PostsRunner {
    @Karate.Test
    Karate testGetPosts() {
        return Karate.run("getPosts").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPostPosts() {
        return Karate.run("postPosts").relativeTo(getClass());
    }

}
