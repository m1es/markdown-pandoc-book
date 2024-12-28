class Book
  def initialize(args)
    @input_folder = args[:input_folder]
    @output_file = args[:output_file]
  end

  def generate
    # Concatenate main and front matter into two separate files
    print "Using the following source files:"
    @main_concat_file = concatenate('main')
    @front_concat_file = concatenate('front')

    # Run Pandoc to generate PDF
    system "pandoc #{@main_concat_file} #{pandoc_args.join(' ')} -o #{@output_file}"
    print "File generated, see: #{@output_file}"
  end

  private

  def pandoc_args
    [
      "--toc",
      "--include-in-header", "./latex/custom_styling.tex",
      "--template=./latex/template.latex",
      "--pdf-engine=xelatex",
      "-B", "#{@front_concat_file}",
      "-V", "linkcolor:blue",
      "-V", "geometry:a5paper",
      "-V", "geometry:margin=1.8cm",
      "-V", "toc-title='Table of contents'",
      "-V", "title='Title of the book'",
      "-V", 'subtitle="Subtitle of the book"',
      "-V", "author='Author'",
      "-V", "linestretch=1.25",
      "-V", "documentclass=book",
      "-V", "classoption=oneside",
      "-V", "lang=nl"
    ]
  end

  def concatenate(type)
    input_dir = "#{@input_folder}/#{type}"
    concat_file = "./tmp/#{type}.txt"
    files = Dir.children(input_dir).sort

    concat_files(input_dir, files, concat_file)
    concat_file
  end

  def concat_files(input_dir, files, output_file)
    File.open(output_file, "w") do |f|
      files.each do |filename|
        next if filename == '.DS_Store'

        puts "#{input_dir}/#{filename}"
        file = File.open("#{input_dir}/#{filename}")
        f.write file.read
        f.write "\n\n" # Making sure we stitch with some enters in between
        file.close
      end
    end
  end

  def print(str)
    puts "====="
    puts str
    puts "~~~~~"
  end
end
