module TD.Query.ComposeRichMessageWithAi
  (ComposeRichMessageWithAi(..)
  , defaultComposeRichMessageWithAi
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputRichMessage as InputRichMessage
import qualified Data.Text as T

-- | Changes a rich message using an AI model. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests. Returns 'TD.Data.RichMessage.RichMessage'
data ComposeRichMessageWithAi
  = ComposeRichMessageWithAi
    { message                    :: Maybe InputRichMessage.InputRichMessage -- ^ The original message
    , translate_to_language_code :: Maybe T.Text                            -- ^ Pass a language code to which the text will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values
    , style_name                 :: Maybe T.Text                            -- ^ Name of the style of the resulted text; handle updateTextCompositionStyles to get the list of supported styles; pass an empty string to keep the current style of the text or if a custom prompt is used
    , custom_prompt              :: Maybe T.Text                            -- ^ Custom prompt that will be used instead of style_name; 0-getOption("text_composition_style_prompt_length_max") characters
    , add_emojis                 :: Maybe Bool                              -- ^ Pass true to add emoji to the text
    }
  deriving (Eq, Show)

instance I.ShortShow ComposeRichMessageWithAi where
  shortShow
    ComposeRichMessageWithAi
      { message                    = message_
      , translate_to_language_code = translate_to_language_code_
      , style_name                 = style_name_
      , custom_prompt              = custom_prompt_
      , add_emojis                 = add_emojis_
      }
        = "ComposeRichMessageWithAi"
          ++ I.cc
          [ "message"                    `I.p` message_
          , "translate_to_language_code" `I.p` translate_to_language_code_
          , "style_name"                 `I.p` style_name_
          , "custom_prompt"              `I.p` custom_prompt_
          , "add_emojis"                 `I.p` add_emojis_
          ]

instance AT.ToJSON ComposeRichMessageWithAi where
  toJSON
    ComposeRichMessageWithAi
      { message                    = message_
      , translate_to_language_code = translate_to_language_code_
      , style_name                 = style_name_
      , custom_prompt              = custom_prompt_
      , add_emojis                 = add_emojis_
      }
        = A.object
          [ "@type"                      A..= AT.String "composeRichMessageWithAi"
          , "message"                    A..= message_
          , "translate_to_language_code" A..= translate_to_language_code_
          , "style_name"                 A..= style_name_
          , "custom_prompt"              A..= custom_prompt_
          , "add_emojis"                 A..= add_emojis_
          ]

defaultComposeRichMessageWithAi :: ComposeRichMessageWithAi
defaultComposeRichMessageWithAi =
  ComposeRichMessageWithAi
    { message                    = Nothing
    , translate_to_language_code = Nothing
    , style_name                 = Nothing
    , custom_prompt              = Nothing
    , add_emojis                 = Nothing
    }

