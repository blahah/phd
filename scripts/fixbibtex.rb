#!/usr/bin/env ruby

# clean up bibtex files by removing unwanted fields,
# replacing troublesome strings and removing bad
# characters

removefields = ['copyright']

removeregexes = removefields.map { |x| Regexp.new("#{x} =") }

replacements = [[/--/, '-'],
                [/(pages = \{\d+) -(\d+\})/, "\\1-\\2"],
                [/ó/,'{\'o}'],
                [/é/,'{\'e}'],
                [/ö/,'{\"o}'],
                [/ä/,'{\"a}'],
                [/ü/,'{\"u}'],
                [/ñ/,'{\~n}'],
                [/á/,'{\'a}'],
                [/‐/,'-'],
                [/‐/,'-'],
                [/′/,'$^{\prime}$']]

removals = [/©/, /∗/, /\*/]

file = 'zotero.bib'
fixedfile = 'fixed.bib'

puts 'scanning file'
removedlines = 0
replaced = 0
removed = 0

File.open(fixedfile, 'w') do |fixed|
  deletenextline = false
  File.open(file, 'r').each do |line|
    # does the line end in {escaped} text?
    escaped = line =~ /\{[^\}]+\}$/
    # are we in the middle of a field that needs deleting?
    if deletenextline
      if line.rstrip.end_with?('},')
        deletenextline = false
      end
      if line.rstrip =~ /^\}\,/
        deletenextline = false
      else
        next
      end
    end
    keep = true
    # check for bad fields
    removeregexes.each do |field|
      if line =~ field
        keep = false
        removedlines += 1

        deletenextline = true unless line.rstrip.end_with?('},')
      end
    end
    next if not keep
    # perform any replacements
    replacements.each do |pattern, replacement|
      replaced += 1 if line.gsub!(pattern, replacement)
    end
    # strip bad chars
    removals.each do |pattern|
      removed += 1 if line.gsub!(pattern, '')
    end
    # save
    fixed << line
  end
end

puts "removed #{removedlines} bad lines, replaced #{replaced} bad strings and removed #{removed} bad characters!"