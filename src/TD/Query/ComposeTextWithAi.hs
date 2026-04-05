module TD.Query.ComposeTextWithAi
  (ComposeTextWithAi(..)
  , defaultComposeTextWithAi
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified Data.Text as T

-- | Changes text using an AI model; must not be used in secret chats. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests. Returns 'TD.Data.FormattedText.FormattedText'
data ComposeTextWithAi
  = ComposeTextWithAi
    { text                       :: Maybe FormattedText.FormattedText -- ^ The original text
    , translate_to_language_code :: Maybe T.Text                      -- ^ Pass a language code to which the text will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values
    , style_name                 :: Maybe T.Text                      -- ^ Name of the style of the resulted text; handle updateTextCompositionStyles to get the list of supported styles; pass an empty string to keep the current style of the text
    , add_emojis                 :: Maybe Bool                        -- ^ Pass true to add emoji to the text
    }
  deriving (Eq, Show)

instance I.ShortShow ComposeTextWithAi where
  shortShow
    ComposeTextWithAi
      { text                       = text_
      , translate_to_language_code = translate_to_language_code_
      , style_name                 = style_name_
      , add_emojis                 = add_emojis_
      }
        = "ComposeTextWithAi"
          ++ I.cc
          [ "text"                       `I.p` text_
          , "translate_to_language_code" `I.p` translate_to_language_code_
          , "style_name"                 `I.p` style_name_
          , "add_emojis"                 `I.p` add_emojis_
          ]

instance AT.ToJSON ComposeTextWithAi where
  toJSON
    ComposeTextWithAi
      { text                       = text_
      , translate_to_language_code = translate_to_language_code_
      , style_name                 = style_name_
      , add_emojis                 = add_emojis_
      }
        = A.object
          [ "@type"                      A..= AT.String "composeTextWithAi"
          , "text"                       A..= text_
          , "translate_to_language_code" A..= translate_to_language_code_
          , "style_name"                 A..= style_name_
          , "add_emojis"                 A..= add_emojis_
          ]

defaultComposeTextWithAi :: ComposeTextWithAi
defaultComposeTextWithAi =
  ComposeTextWithAi
    { text                       = Nothing
    , translate_to_language_code = Nothing
    , style_name                 = Nothing
    , add_emojis                 = Nothing
    }

