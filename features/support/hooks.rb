Before do
  page.current_window.resize_to(1366, 768)
  visit "/"
end

After do |scenario|
  screenshot = page.save_screenshot("logs/screenshots/#{scenario.__id__}.png")
  shot_b64 = Base64.encode64(File.open(screenshot, "rb").read)
  embed(shot_b64, "image/png", "Screenshot")
end
