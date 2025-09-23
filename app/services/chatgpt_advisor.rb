require "openai"

class ChatgptAdvisor
  def self.get_advice(input)
    client = OpenAI::Client.new  

    response = client.responses.create(
      model: "gpt-4o-mini",
      input: input
    )

    response.output_text || "回答を取得できませんでした。"
  rescue => e
    Rails.logger.error("OpenAI API error: #{e.message}")
    "エラーが発生しました: #{e.message}"
  end
end
