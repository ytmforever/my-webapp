#!/opt/vagrant_ruby/bin/ruby
$args = ARGV.dup;
if ARGV.length > 1
  if $args[0] == '-t'
    $target = $args[1]
    $args.shift;
    $args.shift 
  end
else
   $target = 'deploy' 
end

def url(html)
  `mvn -Dmaven.tomcat.url=#{html} tomcat7:#{$target}`
end

for file in $args do
  load file
end
