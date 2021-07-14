package testcase.comments;

import com.intuit.karate.junit5.Karate;

public class CommentsRunner {
    @Karate.Test
    Karate testGetComments() {
        return Karate.run("getComments").relativeTo(getClass());
    }
}
