defmodule SlideDex.Builder do
  import SlideDex.Slides, only: [slides: 0]

  @page_head """
  <html>
    <head>
      <meta charset="utf-8" />
      <link rel="stylesheet" href="/css/slide.css" />
    </head>
    <body>
      <div class="slidewrap">
  """

  @page_foot """
      </div>
      <script src="/js/nav.js"></script>
    </body>
  </html>
  """

  def all do
    unless File.exists?("../../priv/static/") do
      File.mkdir("../../priv")
      File.mkdir("../../priv/static")
    end

    for slide <- slides do
      slide_content = slide |> Earmark.to_html
      file_content = @page_head <> slide_content <> @page_foot
      curr_slideno = Enum.find_index(slides, &(&1 == slide)) +1
      :ok = File.write(Path.expand("../../priv/static/#{to_string(curr_slideno)}.html", __DIR__), file_content)
    end
  end
end

