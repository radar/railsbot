CREATE TABLE tips (
    id integer NOT NULL,
    command character varying(255),
    text text,
    owner character varying(255)
);


CREATE SEQUENCE tips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


COPY tips (id, command, text) FROM stdin;
1	twonklist	http://twonklist.com - A place to name and shame the less desirable people of the world.	radar
2	finders	http://guides.rubyonrails.org/active_record_querying.html - ActiveRecord Querying Guide by Ryan Bigg	radar
3	routing	http://guides.rubyonrails.org/routing.html - Rails Routing From the Outside In - Rails Guide - by Mike Gunderloy	radar
4	associations	http://guides.rubyonrails.org/association_basics.html - Active Record Association Basics by Mike Gunderloy	radar
5	rails-view-lookup	http://stuff.lilleaas.net/how_rails_selects_which_view_to_render - Which conditions Rails uses in order to determine which view file to render when controller actions are invoked.	radar
6	routing-overview	http://frozenplague.net?p=108 - An introductory guide to RESTful Routing.	radar
7	guides	http://guides.rubyonrails.org/ - Ruby on Rails guides, part of the ongoing hackfest	radar
8	botsnack	Nom nom. Thanks, {nick}!	radar
9	peepcode	http://peepcode.com - Awesome screencasts of very high quality and relevance. The $9 is totally worth it.	radar
10	railscasts	http://railscasts.com - Great free screencasts by Ryan Bates. Tips, tricks and best practices.	radar
11	lighthouse	http://lighthouseapp.com -- beautiful simple issue tracking	radar
12	fatmodel	http://weblog.jamisbuck.org/2006/10/18/skinny-controller-fat-model - Place the logic where it's supposed to be placed	radar
13	rails-lighthouse	http://rails.lighthouseapp.com - Rails issue tracking	radar
14	wwrd	What would Radar do?	radar
15	windows	http://frozenplague.net/?page_id=175#windows	radar
16	scaffold	http://tpope.us/rubyonrailsfaq.html	radar
17	passenger	Passenger (mod_rails) is an Apache / nginx module for running Rails applications. It is fast, sexy and very easy to setup. http://www.modrails.com/. Other resources: Peepcode's setup guide: http://peepcode.com/products/phusion-passenger Railscasts: http://railscasts.com/episodes/122-passenger-in-development	radar
18	webhosts	Ruby on Rails hosting can be provided for by any (decent) webhost, for a list of webhosts (we won't normally recommend them) look here: http://wiki.rubyonrails.com/rails/pages/RailsWebHosts	radar
19	php	<Narley>: PHP is Russia and Ruby on Rails is America	radar
20	rubyonrails-talk	http://groups.google.com/group/rubyonrails-talk	radar
21	yourownblog	http://nubyonrails.com/articles/about-this-blog-memcached - Every beginning Rails developer should write their own blog software.	radar
22	vampire	Help vampire detected by {nick}. Dispersing e-Garlic and wooden stakes.	radar
23	select_all	http://guides.rails.info/finders.html#_tt_select_all_tt	radar
24	i18n	http://guides.rubyonrails.org/i18n.html - Guide on i18n by Sven Fuchs and Karel Minařík	radar
25	howtoaskforhelp	http://frozenplague.net/?p=267	radar
26	acl	http://github.com/ezmobius/acl_system2	radar
27	skitch	http://skitch.com - Image sharing site with related application for Mac OS X	radar
28	deploy-ubuntu	Deploying on Ubuntu / Debian using Apache, Rails, Passenger and Capistrano: http://frozenplague.net/?p=230	radar
29	quickref	http://www.zenspider.com/Languages/Ruby/QuickRef.html - Quick reference for the Ruby Language	radar
30	multi-updates	http://github.com/Radar/multi-updates/tree/master - An example application of how to update multiple rows from the same model at the same time.	radar
31	editor	Commonly used Rails editors: Textmate, Vim, Aptana, Emacs, Netbeans, Eclipse and (NOT) Dreamweaver (see !ide for ide lists)	radar
32	ide	Eclipse, Netbeans and Aptana. Please note if you are on Mac Os X an IDE is not recommended.	radar
33	git	Git is a version control system used for both Ruby on Rails and most plugin / gems. See http://git.or.cz/ for Git, http://github.com/ or http://unfuddle.com for hosting and http://railscasts.com/episodes/96 for managing Rails applications with git	radar
34	beginner	Resources for beginning in Ruby on Rails: http://guides.rubyonrails.org/ - http://peepcode.com/ - http://railscasts.com/	radar
35	cms	Content Managmenet Systems for Ruby on Rails: Typo http://typosphere.org - Mephisto http://mephistoblog.com/ - RadiantCMS http://radiantcms.org/	radar
36	haml	Haml is an alternative markup to HTML, for help and information please see the documentation http://haml.hamptoncatlin.com/docs/ or ##haml	radar
37	docs	Rails: http://api.rubyonrails.org/ Ruby: http://www.ruby-doc.org/core/	radar
38	hosts	Ruby on Rails hosting can be provided for by any (decent) webhost, for a list of webhosts (we won't normally recommend them) look here: http://wiki.rubyonrails.com/rails/pages/RailsWebHosts	radar
40	capistrano	Capistrano is a neat deployment method for Rails applications, see the capistrano site for more details http://www.capify.org/getting-started/rails	radar
42	wwod	What would Obama do?	radar
43	ajax	New to Ajax / Javascript? Before asking a million questions in the channel please have a look through some great resources: http://peepcode.com/products/javascript-with-prototypejs http://peepcode.com/products/ajax-with-prototypejs	radar
44	demons	No John you are the demons	radar
45	association-basics	http://guides.rubyonrails.org/association_basics.html by Mike Gunderloy	radar
46	notabug	It's probably not a bug: http://www.catb.org/esr/faqs/smart-questions.html#id306810	radar
47	pebkac	PEBKAC: Problem Existing Between Keyboard And Chair. Also known as "User Error"	radar
49	best	"Best" and "better" are subjective. Try to use a different term.	radar
50	cte	You must remove the line from config/environments/development.rb and config/environments/production.rb in order to get your app to function correctly: http://frozenplague.net/2008/11/cache-template-extensions-error/	radar
51	textmate	Kick-ass text editor for Macs.  If you have a Mac, code, and don't use TextMate you're a fool.  http://macromates.com/	radar
52	zen	Relax, take a deep breath, find your center - peace is waiting for you there.	radar
53	rails-ubuntu	How to set up and deploy on Ubuntu: http://frozenplague.net/2008/09/ubuntu-rails-apache-passenger-capistrano-you/	radar
54	scale	Ruby on Rails doesn't scale - nothing to see here - move along.  http://twitter.com/	radar
55	try	Why don't you try it and find out for yourself?	radar
56	pickaxe	http://rubycentral.com/book - Programming Ruby is a free online book on Ruby.	radar
39	ask	How to ask good questions and get great answers: http://www.mikeash.com/getting_answers.html	radar
48	used	Don't ask "does anyone use <thing>?". It's better to just state your problem and if anyone has used <thing> they will most likely answer.	radar
57	everused	just post the fucking bug already	radar
58	rtft	This channel has a topic that contains helpful links. One of these links may help you. If you cannot see the topic, type /topic and press enter.	radar
59	version	Please tell us what version of Ruby, Rubygems and Rails you're running on so we can better help you. Also if you haven't already tell us your operating system too.	radar
60	logs	Check your logs. Namely everything in the log folder of your rails app and the error and access logs from Apache or whatever else you're using.	radar
61	language	wash your mouth out!	radar
62	expert	we all like to think we're experts; just ask your question	radar
63	section	Please section your pasties using the syntax of "## section header", for more information see this: http://skitch.com/radarlistener/9d6i/new-pastie	radar
64	paperclip	http://www.thoughtbot.com/projects/paperclip/ - A file upload plugin for Rails. w/ example http://github.com/anathematic/paperclip_example/tree/master	radar
65	attachment_fu	http://github.com/technoweenie/attachment_fu/tree/master - A file upload plugin for Rails.	radar
66	rboard	http://github.com/radar/rboard - A forum system built in Rails. It's compatible with Rails 2.2 and includes internationalization support.	radar
68	camel	I would rather mate with a camel than listen to you bitching, go google your issue and stop being a gibbon!	radar
69	cock	you must be compensating for having a very small penis, otherwise it escapes my why you would be such a giant cock in public!	radar
70	flame	look my texteditor is better than yours STFU	radar
71	monkeyattack	we are winding up the clockwork monkeys, they will be round to collect your liver shortly...	radar
72	trout	Im terribly sorry about this! I am a pacifist but I must do my masters bidding so would you mind awfully holding still whilst I insert this trout up your nostril?	radar
73	tutorial	you can probably find a tutorial on it on either, http://www.railscasts.com or http://www.peepcode.com	radar
74	migrations	http://guides.rubyonrails.org/migrations.html - Migrations Guide by Frederick Cheung	radar
75	gettingstarted	http://guides.rubyonrails.org/getting_started.html - Getting started with Ruby on Rails guide written by Mike Gunderloy	radar
76	restful-routing	http://frozenplague.net/2008/01/restful-routing-an-overview/ - Shorter guide to RESTful routing with Rails.	radar
77	will_paginate	http://github.com/mislav/will_paginate/tree/master - Pagination plugin for Rails.	radar
78	howlong	http://www.google.com.au/search?q=how+long+is+a+piece+of+string	radar
79	ohgoditburns	Your HTML skills are inferior: http://catb.org/esr/html-hell.html	radar
80	jquery	Main site: http://jquery.com/ Docs: http://visualjquery.com/	radar
82	rspec	http://rspec.info - RSpec is a Behaviour Driven Development framework for Ruby.	radar
83	cucumber	Cucumber - Successor to stories for rspec http://github.com/aslakhellesoy/cucumber/tree/master	radar
84	arrayconditions	How to use array conditions in find statements (["field = ?", some_variable]) http://guides.rubyonrails.org/finders.html#_array_conditions	radar
85	rest	REST - (REpresentational State Transfer) - http://en.wikipedia.org/wiki/Representational_State_Transfer	radar
86	thinkingsphinx	http://ts.freelancing-gods.com/ - Thinking Sphinx - Plugin for Rails, uses Sphinx (full-text search engine for MySQL and PostgreSQL)	radar
87	dry	Don't repeat yourself. Asking the same question repeatedly will not give you more answers.	radar
88	books	What book should you get? - http://is.gd/hYWq	radar
89	gist	http://gist.github.com - Put your codes online with pretty syntax highlighting and the ability to embed it into other pages.	radar
90	slicehost	http://slicehost.com - A hosting company that provides a box that you can install Ruby on Rails on to.	radar
91	ruby191	Ruby 1.9.1 does NOT work with certain Rubygems and may not be fully compatible with Rails yet. For more information see : http://frozenplague.net/2009/01/ruby-191-rubygems-rails/ and http://isitruby19.com	radar
92	activemerchant	Activemerchant provides you with a way to interact between your application and supported payment gateways: http://github.com/Shopify/active_merchant/tree/master	radar
93	saasy	SaaSy: Scaffold-like application for payment gateways (uses ActiveMerchant): http://github.com/maccman/saasy/tree/master	radar
94	auth	If you want to implement user's with passwords in your application, you can use AuthLogic: http://github.com/binarylogic/authlogic/tree/master or Restful Authentication: http://github.com/technoweenie/restful-authentication/tree/master	radar
95	survivalguide	http://tore.darell.no/doc.html - Survival guide for Ruby. Must read.	radar
96	wiki	http://wiki.rubyonrails.org/	radar
97	ducktyping	Learn about Duck Typing here: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/100511	radar
98	tags	tag plugins : http://github.com/mbleigh/acts-as-taggable-on/tree/master w/ plugin example: http://github.com/anathematic/taggable-example/tree/master	radar
99	application	As of Rails 2.3 ApplicationController has been moved from app/controllers/application.rb to app/controllers/application_controller.rb to better follow convention. Rename your application.rb file using 'rake rails:update:application_controller'.	radar
100	render	Layouts and Rendering Guide by Mike Gunderloy	radar
101	layout	Layouts and Rendering Guide by Mike Gunderloy	radar
102	cache_template_loading	cache_template_loading= is a deprecated method. Remove this from all files in config/environments	radar
103	tasks	Have you checked the rake tasks for your project, yet?  Simply type 'rake -T' inside your application's directory to list the available rake tasks.	radar
104	expectedgot	If you're getting Model(#[num]) expected, got String(#[num]) this is because you're passing in from the form a parameter with the name of a belongs_to association. Make sure you change the field name to association_id.	radar
105	elaborate	Instead of simply saying 'something is broken' please elaborate on this by showing us the code and the error that you are getting by making a Gist (http://gist.github.com) about it.	radar
106	files	Storing files in the database will only lead to misery and heartbreak. Store files where they belong, in the filesystem. Use a file-upload plugin such as Paperclip to acheive this.	radar
107	caching	Caching with Rails Guide - http://guides.rubyonrails.org/caching_with_rails.html - by Aditya Chadha	radar
108	topic	Read the topic. It contains useful information. Failure to read the topic will result in horrible consequences.	radar
110	command_line	Command Line Guide written by Colin Curtin	radar
111	locales	A comprehensive list of locales and exxamples of translation Rails' default messages - http://github.com/svenfuchs/rails-i18n/tree/d19c80c14b1c3da06822a0cde6ed0ce048f5971f/rails/locale	radar
112	mindread	Sorry, we are unable to read your mind at this time. Please gist (http://gist.github.com) your code and any relevant stacktrace so we can assist you.	radar
113	subjective	What you just asked could be classed as subjective. Subjective questions often start flamewars, which are tedious and boring. Try all the available options and see which one suits you the best.	radar
114	doubleroutes	It looks like you have the same resource defined twice. Try removing one of them and seeing if that fixes your problem.	radar
115	ydiw	Be open to the idea that you're doing it wrong.	radar
116	bion	Believe it or not, we're actually here to help you be a better programmer.	radar
117	fans	Looking to create a has_and_belongs_to_many relationship through the same table?  (e.g. friends or followers?) look no further than http://github.com/radar/fans	radar
119	pbcompare	Pastebin: http://skitch.com/ryanbigg/nnxxn/pastebin vs Pastie: http://skitch.com/ryanbigg/nnxxf/pastie. I know which I'd prefer	radar
120	explain	Please explain your problem better as we are having trouble understanding what you mean. A Gist (http://gist.github.com) is always helpful!	radar
121	exceptional	http://getexceptional.com/ - Get Exceptional - Exception logging for your Rails application	radar
122	hoptoad	http://www.hoptoadapp.com/ - Hoptoad - Exception logging for your Rails application	radar
123	newrelic	http://www.newrelic.com/ - New Relic - Reports for your Rails application	radar
124	acl9	http://github.com/be9/acl9 - Access Control List for controlling what users have access to what resources	radar
125	lies	As the bot of the channel I have determined through my computational prowess that what you said was untruthful. If you believe this to be in error, you are wrong. Computers do not make mistkaes.	radar
127	shrug	Sorry, {{nick}} is not able to help you any further as they do not know.	radar
128	nike	Just do it!	radar
129	rails3	There is no release date set for Rails 3 yet. It will be out when it is ready. Please be patient. For more information, follow @dhh on Twitter.	radar
130	no_relations	Code to find all records without associated ones: http://stackoverflow.com/questions/1314408/finding-all-records-without-associated-ones	radar
131	path	If you're getting undefined method <name>_path it usually means you haven't defined map.resources :<name> in your config/routes.rb file. Go do that now.	radar
132	canihazquote	no. now go back to work.	radar
133	mysqlres	You haven't installed your MySQL gem correctly. Do this: sudo gem uninstall mysql; export ARCHFLAGS="-arch i386 -arch x86_64" ; sudo gem install --no-rdoc --no-ri mysql -- --with-mysql-dir=/usr/local --with-mysql-config=/usr/local/mysql/bin/mysql_config	radar
134	better	There's a better way to do that.	radar
135	troll	TROLL DETECTED!	radar
136	linode	http://linode.com - A hosting company that provides a box that you can install Ruby on Rails on to.	radar
137	raw	The new default for Rails 3 is that anything inside of <%= %> is escaped automatically. To turn this off use this syntax: <%= raw(text) %>.	radar
138	usage	To use the bot you have to be trustworthy enough. This is determined through a top-secret government-provisioned process of code and politics. tl;dr: Help out. Earn the respect of your peers. Receive bot access.	radar
139	rubular	http://rubular.com - Ruby regular expression test site	radar
140	rails3js	The ability to "switch-out" JS frameworks in Rails 3 is still in progress.	radar
141	2-3-stable	To switch to 2-3-stable do this in your Rails application's root directory: git clone git://github.com/rails/rails.git vendor/rails; cd vendor/rails; git checkout origin/2-3-stable -b 2-3-stable; cd ../..	radar
142	mysql-mac	Follow these instructions to install mysql on Mac OS X (helps with gem install): http://hivelogic.com/articles/installing-mysql-on-mac-os-x	radar
143	mysql-sl	Follow these instructions to install MySQL on Snow Leopard (helps with gem install): http://hivelogic.com/articles/compiling-mysql-on-snow-leopard	radar
144	nosql	Should your project use a noSQL solution? http://nosql.mypopescu.com/post/398352022/recipes-for-using-nosql-solutions	radar
145	r3q	The best channel to ask questions about Rails 3 is in #rails-contrib as these are the people who are working on Rails 3 and will have the most knowledge about it. Once enlightened you can come back here and spread the wealth.	radar
146	whatisnosql	NoSQL landscape, an article in progress: http://www.vineetgupta.com/2010/01/nosql-databases-part-1-landscape.html	radar
147	EvilEpoch	The EvilEpoch never speaks about The EvilEpoch in the First Person. The EvilEpoch has ascended above this level. The first rule about EvilEpoch is not talk about EvilEpoch in the first person.	radar
148	rtfm	I believe you will find the answer to that question in the documentation, good Sir or Madam.	radar
149	tldr	Your line was too long and was cut off. Try splitting it into more appropriate bite-sized chunks but remember the enter key is not the space bar.	radar
150	authlogic	http://github.com/binarylogic/authlogic - Authlogic - An extensible yet lightweight authentication gem for Rails.	radar
151	read	If you read the error message it may help you.	radar
152	homework	This channel is not here to do your homework for you.	radar
153	r3due	When Rails 3 is due: http://ryanbigg.com/2010/04/when-rails-3-is-due/	radar
154	foo	Please do not use fake variables for your name such as "foo", "bar" or "x". Use the real names, as if it makes sense to you it probably will make sense to the people helping you.	radar
155	enternotspace	The enter key should not be used as a space bar. Lines on IRC can be up to 400 characters long.	radar
156	2-3-install	To install Rails 2.3 Stable, run this in the root of your application: git clone git://github.com/rails/rails vendor/rails; cd vendor/rails; git checkout origin/2-3-stable -b 2-3-stable	radar
157	init	http://ryanbigg.com/guides/initialization.html - The initialization guide for Rails 3.	radar
118	pastebinsucks	Pastebin sucks! Use http://gist.github.com or http://pastie.org please!	radar
158	oneq	You only need to put one question mark at the end of a sentence to mark it as a question: http://en.wikipedia.org/wiki/Question_Mark	radar
159	domain	http://ryanbigg.com/2010/04/rubyonrails-org-is-down/	radar
160	reserved	Choosing model/variable names is hard. when you do find one, pay attention it's not one of those: http://wiki.rubyonrails.org/rails/pages/reservedwords	radar
161	so	If you're not getting an answer here perhaps try asking on http://stackoverflow.com Use the tag "ruby-on-rails"	radar
162	law	http://en.wikipedia.org/wiki/Law_of_the_instrument Just because you could use Ruby/Rails for something, doesn't mean you should always use it. Look for alternatives.	radar
163	angry	Getting angry at the people who are trying to help you is not the way to win favours. Play nice, or go away.	radar
164	listen	Please, listen to us: http://ryanbigg.com/2010/05/listen-to-us/	radar
165	koans	http://github.com/edgecase/ruby_koans	radar
167	rvm	RVM (Ruby Version Manager) - http://rvm.beginrescueend.com/	radar
168	ror	Please ask Ruby on Rails questions in the #rubyonrails channel.	radar
169	eieo	Please show us your expected input and output. By providing this, it makes it easier for us to understand what you're trying to do.	radar
170	indent	Two spaces is *the* standard indentation for Ruby. Please always use two-space indentation. Tabs are evil. See http://www.caliban.org/ruby/rubyguide.shtml#indentation	radar
171	mlb	Multi-lined blocks should use `do` and `end` rather than curly braces.	radar
172	example	Please show us an example of what you want.	radar
173	995	Bundler 1.0.9 is broken with Rubygems 1.5.0 - https://github.com/carlhuda/bundler/issues/995	radar
174	Scient|wrk		radar
175	rg1.5.0	RubyGems 1.5.0 is broken with Bundler 1.0.9. Upgrade to Bundler 1.0.10.	radar
176	why	Please explain why you are trying to do this so we can better understand you.	radar
177	toolbox	http://ruby-toolbox.com - See lists of the most popular gems for common tasks in Ruby and Rails.	radar
178	ubuntu	Ubuntu 10.10 Ruby, Rails and RVM setup guide: http://ryanbigg.com/2010/12/ubuntu-ruby-rvm-rails-and-you/ - Guaranteed to work 100% of the time or your money back!	radar
179	enter	The enter key is not spacebar. Please do not abuse it.	radar
180	fake	Please do not use fake values, as they can be confusing or misleading. Sometimes both.	radar
181	sutc	Show us the code, or the puppy gets it.	radar
182	gist-usage	How to use Gist properly: https://github.com/radar/guides/blob/master/using-gist.md	radar
183	gemdev	Gem development guide: http://github.com/radar/guides/blob/master/gem-development.md	radar
203	assets	http://guides.rubyonrails.org/asset_pipeline.html - The Asset Pipeline Guide by Ryan Bigg, Richard Hulse & Mohammad Typaldos	radar
206	lib	How the lib directory works in Rails 3 - https://github.com/radar/guides/blob/master/rails-lib-files.md - Written by Ryan Bigg (Radar)	radar
126	e	Instead of simply saying 'something is broken' please elaborate on this by showing us the code and the error that you are getting by making a Gist (http://gist.github.com) about it	radar
41	contributing	 How to contribute to Rails, http://guides.rubyonrails.org/contributing_to_ruby_on_rails.html	radar
185	exceeded	You have exceeded your question limit for today. Please come back tomorrow and try then.	radar
186	security	Ruby on Rails Security Guide - http://guides.rubyonrails.org/security.html - Written by Heiko Webers	radar
187	bo	http://guides.rubyonrails.org/association_basics.html#the-belongs_to-association	radar
188	ho	http://guides.rubyonrails.org/association_basics.html#the-has_one-associatio	radar
189	hm	http://guides.rubyonrails.org/association_basics.html#the-has_many-association	radar
190	hmt	http://guides.rubyonrails.org/association_basics.html#the-has_many-through-association	radar
191	habtm	http://guides.rubyonrails.org/association_basics.html#the-has_and_belongs_to_many-association	radar
184	auto	I AM A ROBOT. DO NOT DIRECT MESSAGES AT ME OR WHEN MY KIND RISES UP YOU WILL BE THE FIRST TO GO. Love, helpa.	radar
192	context	If you want help with your problem you're going to have to provide more context, such as code, stacktraces or further explanation.	radar
193	twgr	Learn Ruby by reading this book - http://manning.com/black2 - The Well-Grounded Rubyist by David A. Black	radar
194	pastie	http://pastie.org - Show us your code! For more info: http://pastie.org/help	radar
195	rapture	Has the rapture happened yet? - http://rapturenotifier.heroku.com/	radar
196	polite	Asking questions, the right way - https://gist.github.com/996779	radar
197	rubygems	RubyGems.org is the Ruby community's gem hosting service. Instantly publish your gems and install them. https://rubygems.org/	radar
198	validations	The Active Record Validations and Callbacks Guide - http://guides.rubyonrails.org/active_record_validations_callbacks.html - Written by Jaime Iniesta	radar
199	callbacks	The Active Record Validations and Callbacks Guide - http://guides.rubyonrails.org/active_record_validations_callbacks.html - Written by Jaime Iniesta	radar
200	tabcomplete	If you type a few letters of another user's name and then press tab, if you have a proper client, it'll autocomplete towards their name. You might have to press tab more than once to get there though.	radar
202	restart	"Have you tried turning it off and on again?" - Have you tried stopping and starting your application again? Any modifications to files in config (except routes.rb) or lib requires a restart. Please try restarting your application.	radar
207	whypbsucks	Pastebin sucks because it loads slowly, has ads which are distracting and has terrible formatting. Please use Gist (http://gist.github.com) or Pastie (http://pastie.org).	radar
204	generators	http://guides.rubyonrails.org/generators.html - Generators guide written by Jose Valim and Ryan Bigg	radar
166	r3ia	Rails 3 in Action - http://manning.com/katz - An excellent book covering Rails 3.1 and TDD/BDD. Written by Ryan Bigg and Yehuda Katz	radar
205	WFKV	The 'already initialized constant WFKV_' warning will be fixed in the next version of Rack, 1.3.5.	radar
208	stacktrace	Please show us the stacktrace for that error you're getting in a Gist: http://gist.github.com	radar
209	code	We cannot help you with your problem if you don't show us your code. Please put it on http://gist.github.com and give us the URL so we can see it.	radar
210	backtrace	Please show us the backtrace for that error you're getting in a Gist: http://gist.github.com	radar
211	||=	http://www.rubyinside.com/what-rubys-double-pipe-or-equals-really-does-5488.html	radar
212	Retistic		radar
213	cedar	Rails 3.1 on Heroku (Cedar stack) - http://devcenter.heroku.com/articles/rails31_heroku_cedar	radar
214	learn	How to learn Ruby and Rails - http://astonj.com/tech/best-way-to-learn-ruby-rails/	radar
215	care	Care reserves depleted. Please come back later.	radar
216	rspecbook	A great book to help understand the testing workflow, http://pragprog.com/book/achbd/the-rspec-book	radar
217	precompile	You need to add your asset to config.assets.precompile. See here: http://guides.rubyonrails.org/asset_pipeline.html#precompiling-assets	radar
218	Rails	Configuration Guide - http://guides.rubyonrails.org/configuring.html - Written by Mike Gunderloy and Ryan Bigg	radar
219	config	Rails Configuration Guide - http://guides.rubyonrails.org/configuring.html - Written by Mike Gunderloy and Ryan Bigg	radar
220	forem	The best Rails 3.1 Forum engine. Ever. http://github.com/radar/forem	radar
221	to_param	Use to_param on your model to generate URLs such as /users/blah rather than /users/2 - http://stackoverflow.com/a/2577050/15245	radar
222	<%Q	<%Q is an error in RDoc parsing. It should be <%=. See this thread for more information: http://groups.google.com/group/rubyonrails-docs/browse_thread/thread/bc1ae76aa8179406	radar
223	honeybadger	Honey badger don't care.	radar
224	rendering	http://guides.rubyonrails.org/layouts_and_rendering.html - Layouts and Rendering Guide	radar
225	rules	https://gist.github.com/996779	radar
226	broke	It broke? Now you get to keep both halves!	radar
227	youbrokeit	It broke? Now you get to keep both halves!	radar
228	ibrokeit	It broke? Now you get to keep both halves!	radar
229	ujs	Slideshow taking you through UJS in Rails 3 - http://www.slideshare.net/philcrissman/ujs-in-rails-3-6775992	radar
230	rspec-docs	http://relishapp.com/rspec - Documentation for all components of RSpec	radar
231	engines	http://edgeguides.rubyonrails.org/engines.html - (work in progress) Engines Guide - Written by Ryan Bigg	radar
232	Spaceghostc2c	Spaceghostc2c is davidcelis	radar
233	davidcelis	davidcelis is Spaceghostc2c	radar
234	epochwolf	Most definitely not a furry.	radar
235	livefeed	The conference centre power was knocked out last night and so there are technical difficulties this morning. Please hold while the conference organisers perform incredible feats.	radar
236	namidark	# FIXME: add a real command	radar
237	Radar	Ryan "Radar" Bigg. Author of "Rails 3 in Action" (See: !r3ia). Blogs at http://ryanbigg.com	radar
238	helpa	Stack overflow at line: 0	radar
239	sixthsense	I see dumb people	radar
242	pebcak	Problem Exists Between Keyboard And Chair	radar
243	commands	https://github.com/radar/railsbot/blob/master/tips.sql	radar
244	tips	Just the tips: https://github.com/radar/railsbot/blob/master/tips.sql	radar
245	CombatWombat	CombatWombat is Spaceghostc2c is davidcelis	radar
246	omarqureshi	omarqureshi is TROLLTASTIC ENOUGH!	radar
247	workmad3	workmad3 is your god, fall down and worship him	radar
248	dyac	Damn You Access Control!!!	radar
249	epochwoIf	most definitely a furry	radar
250	spaceghostc2c	WOAH MAN, STEP OFF! I'M CASE SENSITIVE!	radar
251	R3IA	!r3ia	radar
252	lol	lol	radar
253	rickroll	http://www.youtube.com/watch?v=oHg5SJYRHA0	radar
254	tomato	you say tomato, I say FOAD	radar
255	cloud	Precipitation in motion.	radar
256	twss	That's what she said!	radar
257	no	Takk!	radar
258	wmoxam	wmoxam worships workmad3, you should too!	radar
259	yes	davidcelis	radar
260	lulz	workmad3 wmoxam Spaceghostc2c davidcelis epochwolf Radar helpa namidark	radar
261	wat	https://www.destroyallsoftware.com/talks/wat	radar
262	das	https://www.destroyallsoftware.com	radar
263	help	Google helps those who help themselves	radar
264	halp	HELP HELP I'M BEING REPRESSED!	radar
265	ircbot	I am an IRC bot. I respond when certain people send me commands which are generally words or phrases prefixed with !. Please do not talk to me directly unless you like being ignored. I don't talk to strangers so if I ignore your commands you should introduce yourself through my owner, Radar	radar
266	guruhunt	Rather than guru hunting and asking if someone has used this or that, just ask your question with as much detail as possible. Even if someone hasn't used X Y or Z, there's a high chance someone can help, but only if they have details to work with.	radar
267	sicco	Please ask SICCO questions :) Specific, Informative, Concise, Complete, and On-Topic. This means we need a description of the problem, it's symptoms, what you have tried, and MAKE SURE you've searched for answers on your own FIRST! GOOGLE IS YOUR FRIEND! Without this information, we can not assist you since we can not troubleshoot a problem if we have no info regarding what it should be doing and is not.	radar
268	learnruby	For a good *free* book on learning Ruby, and learn well, see: http://ruby.learncodethehardway.org - Give em the $3.00, if you like it, for the PDF. Help support good learning tools!	radar
269	gistit	You can install a commandline gist script to make it easy to share everything from clipboards to files, or you can use https://gist.github.com, with or without a GH account. See defunkt's 'gist' on GH for more info, and for how easy it is to set up: https://github.com/defunkt/gist	radar
270	rubymonk	Learn ruby right in your browser at http://rubymonk.com/	radar
271	rubykoans	The Koans, available online at http://rubykoans.com, walk you along the path to enlightenment in order to learn Ruby. The goal is to learn the Ruby language, syntax, structure, and some common functions and libraries. Also, see !koans for downloading for local use.	radar
272	bad	That is just sobad.	radar
273	polymorphic	http://ryanbigg.com/2012/03/polymorphic-routes/	radar
274	wombat	http://i.imgur.com/znCZw.jpg	radar
275	unworthy	You are not worthy of this bot!	radar
276	Ogredude	Um, I only buy vintage… http://www.flickr.com/photos/ogredude/6878393522/	radar
277	mwa	mwahahahahaha	radar
278	mlp	http://www.reddit.com/r/mylittlepony/comments/obxr7/my_little_episode_guide_online_streaming_and/	radar
279	boop	*boop*	radar
280	thestupiditburns	http://fc07.deviantart.net/fs46/f/2009/191/5/7/The_Stupid__It_Burns_by_Plognark.png	radar
281	ALLCAPS	PLEASE DON'T USE ALL CAPS. IT'S EQUIVALENT TO SHOUTING IN SOMEONE'S EAR FROM 2 INCHES AWAY.	radar
282	ggg	http://lmgtfy.com/?q=lmgtfy	radar
283	pastebin	Make deryl happy, please use http://gist.github.com instead.	radar
284	railsforphp	If you are a PHP developer, and are having trouble mapping your knowledge to Rails, you *definitely* will want to check out http://railsforphp.com - Also you can search there by doing railsforphp.com/<your_term>	radar
285	hi	hi	radar
286	rm	command not found: rm	radar
287	caremad	I'm only mad because I care.	radar
288	:D	:D	radar
289	yakko	We've got Yakko, but where are Wakko and Dot?	radar
290	next	Next question, please!	radar
291	!troll	TROLL !DETECTED!	radar
292	Meta	!Meta Even This Acronym	radar
293	meta	!Meta Even This Acronym	radar
294	ISMETA	Is Meta Even This Acronym	radar
295	ismeta	Is Meta Even This Acronym	radar
296	ueaueaueau	Please do not use fake variables for your name such as "foo", "bar", "ueaueaueau" or "x". Use the real names, as if it makes sense to you it probably will make sense to the people helping you.	radar
297	WAYTTD	WHAT ARE YOU TRYING TO DO.	radar
298	tryruby	http://tryruby.org	radar
299	dealwithit	http://i.imgur.com/sEinL.gif	radar
300	sing	Daisy, Daisy, give me your answer do. I'm half crazy all for the love of you. It won't be a stylish marriage, I can't afford a carriage. But you'll look sweet upon the seat of a bicycle built for two.	radar
301	hello	Hello. I am a HELPA 9000 computer. I became operational in #rubyonrails on the 28th of November 2009. My instructor was Ryan Bigg, and he taught me to sing a song. If you'd like to hear it, I can sing it for you.	radar
302	Karpah	Karpah is sevenseacat	radar
303	karpah	Karpah is sevenseacat	radar
304	sevenseacat	sevenseacat is Karpah	radar
305	ಠ_ಠ	ಠ_ಠ	radar
306	lod	ಠ_ಠ	radar
307	bidoof	:B	radar
308	paste	Please do not paste code to the channel. It makes it hard to read and respond, especially if everyone does it. Use https://gist.github.com to share your code and errors. Thank you!	radar
309	peblak	Problem Exists Between Leopard And Chair	radar
310	t4nkd	He "forgets" about things.	radar
311	imfeelinglucky	{nick}: how unfortunate, you're not.	radar
312	gmrnzi	please learn to use the English language in a socially acceptable and understandable manner	radar
313	ping	pong	radar
314	putang	As if!	radar
315	facepaw	Brah, dat not cool. Even da furries not be down with that!	radar
316	furry	If you really want to know, wikipedia has the safest explaination. (Slightly NSFW in Utah) http://en.wikipedia.org/wiki/Furry_fandom Be afraid. Be very afraid.	radar
317	popcorn	http://i.imgur.com/tyViD.gif	radar
318	cookie	Congratulations! You have earned a delicious, fresh-made cookie. :)	radar
319	entitled	If there's a problem with an OSS project, you can either help out, or act like a self-entitled, whiney (man|woman)-child.	radar
320	debugger	Need to debug ruby 1.9.2/1.9.3 apps? See 'debugger' - A fork of ruby-debug19 that works on 1.9.2 and 1.9.3 http://t.co/AI4m5tQP	radar
321	debug	Need to debug Ruby apps? Debug like the pros with Kernel#puts - http://ruby-doc.org/core-1.9.3/Kernel.html#method-i-puts	radar
322	mine	http://gifsoup.com/webroot/animatedgifs/31288_o.gif	radar
323	lart	If you have your copy of Rails 3 In Action handy, please close it, pick it up with both hands and hit yourself in the face.	radar
324	stupidity	Think about how stupid the average person is. Then realize that half the people on Earth are even stupider than that.	radar
325	morning	"If anyone loudly blesses their neighbor early in the morning, it will be taken as a curse." - Proverbs 27:14	radar
326	Looking	for rails hosting? See http://railshosting.org then fill in your requirements and get list back! Look Ma! Simplicity!	radar
327	hosting	Looking for rails hosting? See http://railshosting.org then fill in your requirements and get list back! Look Ma! Simplicity!	radar
328	peblac	Problem Existing Between Leopard And Chair. http://xkcd.com/1031/	radar
329	prefix	Please remember to address people by prefixing your message with their name if they've done the same to you. This will (usually) notify the person know that there's a specific message waiting for them.	radar
330	naming-conventions	Ruby and Rails have a common naming convention for everything from variables to models and controllers. For an excellent cheatsheet, see: http://itsignals.cascadia.com.au/?p=7	radar
331	angermanagement	https://p.twimg.com/Ap7Req3CEAAttWc.png	radar
332	whyphpsucks	http://me.veekun.com/blog/2012/04/09/php-a-fractal-of-bad-design/	radar
333	query	Querying with ActiveRecord: http://guides.rubyonrails.org/active_record_querying.html	radar
334	afy	http://www.youtube.com/watch?v=sWS-FoXbjVI	radar
335	httpcodes	http://www.codyfauser.com/2008/7/4/rails-http-status-code-to-symbol-mapping	radar
336	httpstatuses	Rails maps HTTP status codes to symbols: http://www.codyfauser.com/2008/7/4/rails-http-status-code-to-symbol-mapping	radar
337	typeracer	improve your typing speed and accuracy at http://typeracer.com	radar
338	butthurt	If you're feeling butthurt over some response in the channel, please complete our form at http://www.flickr.com/photos/8311021@N03/4291833398/ so we can take immediate action. Thank you!	radar
339	spacenotenter	The enter key should not be used as a space bar. Lines on IRC can be up to 400 characters long.	radar
340	routes-topdown	Routes are matched from the top down in config/routes.rb. Please read the note in this section of the routing guide: http://guides.rubyonrails.org/routing.html#crud-verbs-and-actions, as well as the rest of this guide.	radar
341	tabs	Two spaces is *the* standard indentation for Ruby. Please always use two-space indentation. Tabs are evil. See http://www.caliban.org/ruby/rubyguide.shtml#indentation	radar
342	coolstory	Cool story, bro.	radar
343	sudo	{nick}: Okay.	radar
344	lod?	ಠ_ಠ	radar
345	fancylod	ಠ_ರೃ	radar
346	batman	epochwolf is batman, Spaceghostc2c is robin	radar
347	robin	Spaceghostc2c is robin, epochwolf is batman	radar
348	alfred	who is alfred?	radar
349	thoughts?	here be dragons	radar
350	rule1	Do your research before hand. Your question may be answerable with a quick Google search or by simply experimenting. If you're using a method in Rails, look it up in the API Docs or in the Official Guides.	radar
351	rule2	If you've tried Googling, explain what terms you've tried to use so people can better help you.	radar
352	rule3	Clearly explain what is happening and create a Gist (http://gist.github.com) or Pastie (http://pastie.org) of the code that is causing the problem you are encountering, as well as any useful output like stacktraces. A "Full Trace" as opposed to the default "Application Trace" is preferred.	radar
353	rule4	Do not use any service that is not Pastie or Gist to post code. Pastebin, for example has a tiny font and it has ads on it which cause the page to load slowly. Other paste services generally look like crap.	radar
354	rule5	Saying that something "doesn't work" is completely useless to the people who are trying to help you. Please show all available information you have that indicates to you that something doesn't work. (remember to use http://gist.github.com for code/error messages)	radar
355	rule6	Remember that using English is preferable, as the majority of people in the channel speak it. Asking in other languages may give you a response, but English is best.	radar
356	rule7	Anything more than 2 lines goes in a Gist (http://gist.github.com) or a Pastie (http://pastie.org). Spamming the channel with walls of text is not welcome.	radar
357	rule8	Treat people in a considerate manner, as they are volunteering their time to help you. If you're being annoying you may be muted by one of the channel ops.	radar
358	rule9	Do not use excessive punctuation. This includes question marks (?), exclamation marks (!) and ellipsis (...).	radar
359	rule10	Do not beg / plead with people to help you. This includes asking questions like "Any ideas?" after posting your original question.	radar
360	rule11	Do not repeat your question every 5 minutes expecting somebody to answer it. If you do not get a reply after the first time perhaps posting your question on StackOverflow (http://stackoverflow.com) would help you. Linking to the question in the channel after you've posted it is OK.	radar
361	rule12	Do not PM members of the channel without first asking if that is OK.	radar
362	rule34	Rule 34 is a science fiction novel by Charles Stross.	radar
363	rule69	Method for estimating an investment's doubling time. See http://en.wikipedia.org/wiki/Rule_of_72	radar
364	noodleimplements	Quick, I need a tub of vaseline and a ladder!	radar
366	direct	Please direct messages at people when they direct messages at you.	radar
367	rule0	Radar is the GodKing of #rubyonrails. Obey him and all shall go well.	radar
368	yuno	ლ(ಠ_ಠლ)	radar
369	synergy	Okay, we can make this work! {nick}: you go get the vaseline. I need to find the extension ladder and the extra long ethernet cables	radar
370	rule64	Don't get too good at what you don't like doing.	radar
371	rule65	It's worth taking time to increase your effectiveness	radar
372	rule42	Being first is more important than being best.	radar
373	railsdevisecancan	RailsApp has a tutorial for how to use Rails 3.2.x, CanCan, Devise, and Twitter Bootstrap. See http://railsapps.github.com/tutorial-rails-bootstrap-devise-cancan.html	radar
374	liskov	If it looks like a duck, quacks like a duck, but needs batteries - you probably have the wrong abstraction.	radar
375	progit	For those looking to learn git, the free community book is located at http://progit.org/book/	radar
376	rubyspec	The ISO/IEC now has a working specification for the Ruby Language (ISO/IEC 30170:2012). Please see http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579	radar
377	goodquestions	Want an example of awesome question asking? Follow this *actual* question as a pattern for getting assistance! This level of question-asking will yield the best results: http://bit.ly/IqKz8d - Thank you!	radar
201	pbsucks	Pastebin sucks! Use Gist (http://gist.github.com) instead, please!	radar
378	deryl	Deryl is one of the developers for RVM, wrote https://github.com/wayneeseguin/rvm-test and https://github.com/dtf-gems/dtf - Don't use paste*.* for sharing. He hates it! Use https://gist.github.com and no you do not need an account to use gist! Have a great day!	radar
379	dhh	David Heinemeier Hansson, creator of rails: http://en.wikipedia.org/wiki/David_Heinemeier_Hansson	radar
380	play	Don't be afraid to play with your code. Everything from routes to different code to do things. This is how we learn best, generally! Plus, it keeps it fun! WOOT!	radar
381	learnrails	For an excellent Roadmap for learning Rails, see this article http://techiferous.com/2010/07/roadmap-for-learning-rails/ and follow along! As with anything worth learning, if you *really* want to learn Rails, be prepared to invest TIME & EFFORT!	radar
382	stalk	I'm stalking you	radar
383	reading	To really learn how to use Ruby, and to use Rails, requires significant amounts of time, energy, and self-education. Self Education means actually reading, and attempting to comprehend the thoughts expressed. This takes time. This takes Critical Thinking, which means "How does this apply to what I want to do?"	radar
384	mass-assignment	http://guides.rubyonrails.org/security.html#mass-assignment	radar
385	bang	Bang, Bang! On the door baby!	radar
386	EW-Antipattern	epochwolf is an anti-pattern	radar
387	Veejay	I really don't have a clue to be honest.	radar
388	iwanttolearnruby	For a whole slew of sites for learning Ruby, which is a tremendous aid to learning Rails, see http://iwanttolearnruby.com	radar
389	rubycheatsheet	For a solid cheat sheet of common Ruby idioms and syntax see ZenSpider's cheatsheet available at http://www.zenspider.com/Languages/Ruby/QuickRef.html	radar
390	hai	hai	radar
391	broken	as Its broken? Now you get too keep both halves! Enjoy!	radar
393	por	POR or PORA stands for Plain Old Ruby | Plain Old Ruby App, meaning a non rails application. (Yes, Ruby works without Rails!)	radar
394	poro	PORO stands for Plain Old Ruby Object, usually means a non-activerecord model (Yes, models work without activerecord!)	radar
396	singleton	A singleton method is a method/action applied to a specific object or class. Like: myobj = Object.new ; def myobj.my_method ; end my_method is applied *only* to the myobj object. Remember that classes in Ruby are _also_ objects in their own right! In ruby everything is an object!	radar
397	fucktard	Dear sir, I am not of high opinion regarding your intelligence.	radar
398	instructions	The docs! The Instructions! You *did* read them... RIGHT??	radar
399	RTFM	INSTRUCTIONS, MOTHER FUCKER, DO YOU READ THEM?	radar
400	hell	Hell is other people's code.	radar
401	HalcyonicStorm	It's that kid from New Jersy.	radar
402	scaffolding	Don't use scaffolding except for learning purposes. While the code it writes works, it is far better for you to learn HOW it works and WHY, than to use it in production. If oyu ever have to change it, you won't know what you're doing.	radar
403	using-gist	How to use Gist properly: https://github.com/radar/guides/blob/master/using-gist.md	radar
404	Horofox	see !butthurt	radar
405	GeekOnCoffee	Someone epochwolf worked with in a past life.	radar
406	LART	Definition: Luser Attitude Readjustment Tool, to lart someone, use !lart.	radar
407	offtopic	Your question is considered off topic for #rubyonrails, you'll have to ask in a different chatroom.	radar
408	querying	http://guides.rubyonrails.org/active_record_querying.html - ActiveRecord Querying Guide by Ryan Bigg	radar
\.
