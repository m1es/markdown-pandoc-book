require './lib/book.rb'

namespace :book do
  desc 'Generate a PDF file using Pandoc from an input folder with Markdown files'
  task :generate, [:input_folder, :output_file] do |task, args|
    args.with_defaults(input_folder: './src', output_file: './build/output.pdf')
    Book.new(args).generate
  end
end
