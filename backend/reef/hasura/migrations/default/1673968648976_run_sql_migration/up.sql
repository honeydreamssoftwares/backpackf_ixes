CREATE OR REPLACE VIEW "public"."mad_feed_user_vote_sums" AS 
 SELECT mad_feed_posts.author as user_id,
    COALESCE(sum(mad_feed_votes.value), (0)::numeric) AS total,
    COALESCE((count(mad_feed_votes.value))::numeric, (0)::numeric) AS total_count
   FROM (auth.mad_feed_posts
     LEFT JOIN auth.mad_feed_votes ON ((mad_feed_posts.post_id = mad_feed_votes.post_id)))
  GROUP BY mad_feed_posts.author;
