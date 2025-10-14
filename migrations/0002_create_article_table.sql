-- Migration number: 0002 	 2025-07-06T22:04:18.794Z
-- npx wrangler d1 execute example-db --remote --file=0002_create_article_table.sql
-- npx wrangler d1 execute betterbelieving-d1 --remote --command "SELECT id,name,slug,category FROM article ORDER BY name;"
CREATE TABLE IF NOT EXISTS [article] (
  id INTEGER PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  "slug" text, 
  "keywords" text, 
  "content" blob, 
  "category" text
)

INSERT INTO article (id, name, slug, keywords, content, category) 
VALUES ('1', 'The 5 R''s of Sanctification', '/spiritual-growth/live-set-apart-for-God/', 'holy, sanctify, renew, rebuild, resist, renounce, run', 'The salvation that is offered by God through Jesus Christ is awesome! Our sins are forgiven. God gives us a new heart with new desires. Heaven is our final destination! And He gives us life abundant here on earth. Live set apart for GodBut there is work to do. How do we get started on this journey of sanctification? What can I do to grow in my Christian walk? How can I be more like Jesus? Sanctification means to be set apart or to be holy– it is a process of being freed from sin and purified. But wait a minute, didn’t Jesus set me free me from sin and purify me already? Yes, that is an internal reality in your spirit. Sanctification is working that out in your daily life as relates to your soul and body (the things you think, say, and do).', 'Spiritual Growth');

INSERT INTO article (id, name, slug, keywords, content, category) 
VALUES ('2', 'Practical Steps to Renew Your Mind', '/spiritual-growth/renew-your-mind/', 'mind, thinking, thoughts, renew', 'The Christian life requires us to actively renew our thinking. It all starts in your mind. What you believe in your mind will shape the fruit of your life. Your thoughts precede your words and lead to your actions. That which occupies our mind will characterize your life. If you continue to believe as you always have, you will continue to act as you always have. Those actions will produce the same results. To change the outcome, you must change the input. (Remember GIGO: garbage in, garbage out).', 'Spiritual Growth');

INSERT INTO article (id, name, slug, keywords, content, category) 
VALUES ('3', 'Sharing the Gospel: The Romans Road', '/christian-living/sharing-the-gospel-the-romans-road/', 'gospel, forgiveness, evangelism, boldness', 'Sharing the Good News of Jesus Christ The gospel of Jesus Christ is the good news that the world needs to hear. Yet, often Christians shy away from telling how God expressed his love in Christ’s sacrifice. Like most Christian doctrines, the gospel is simple enough to share with a child and yet its depth is studied in graduate schools and contemplated by learned scholars. Don’t think you need a Bible degree to share the gospel. Being a witness and explaining the good news about Jesus is not exclusively for the pastor, priest, or evangelist – the responsibility falls on each of us who call Jesus our Savior and Lord. Sharing the gospel using the “Romans Road” provides a nice outline that anyone can follow when presenting the gospel.', 'Christian Living');

INSERT INTO article (id, name, slug, keywords, content, category) 
VALUES ('4', 'How to Spend Time with God', '/christian-living/how-to-spend-time-with-God/', 'devotions, quiet time', 'Do you struggle to know what to do when seeking the Lord? When you hear of daily devotions or quiet time with God, do you just draw a blank? Spending time with God can be a daunting task. When you sit down to meet with the Lord, you might be asking, “Now what?” What can I do in my quiet times with God to draw closer to Him? Or you have been consistently meeting with the Lord but you feel stuck. Perhaps the routine has become monotonous and borders on rote or feels robotic.', 'Christian Living');

