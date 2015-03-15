desc "compile and publish the site to Github"
task :publish do
  sh "git checkout master"
  comment = %x{ git log -n 1 --no-merges --format=%s%b }.chomp.strip
  sh "bundle exec middleman build"
  sh "cd build && git add -A && git commit -m \"Publishing $(date +\"%Y-%m-%d %H:%M\"): #{comment}\" && git push origin gh-pages"
end

namespace :generate do

  desc "Generate ID spans for dictionary entries"
  task :ids do
    source = "source/dict.html.md"

    lines = File.readlines(source).map { |line|
      line.sub(%r{^- \*\*(.*)\*\*(.*)$},'- <span id="\1">**\1**</span>\2')
    }
    File.open(source,"w") { |f| f.print lines.join; f.close }
  end

end
