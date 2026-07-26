module TD.Query.CreateRichMessageWithAi
  (CreateRichMessageWithAi(..)
  , defaultCreateRichMessageWithAi
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates a new rich message using an AI model. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests. Returns 'TD.Data.RichMessage.RichMessage'
data CreateRichMessageWithAi
  = CreateRichMessageWithAi
    { prompt        :: Maybe T.Text -- ^ Prompt that will be used to create the message; 0-getOption("text_composition_style_prompt_length_max") characters
    , language_code :: Maybe T.Text -- ^ Pass a language code in which the text will be created
    , add_emojis    :: Maybe Bool   -- ^ Pass true to add emoji to the text
    }
  deriving (Eq, Show)

instance I.ShortShow CreateRichMessageWithAi where
  shortShow
    CreateRichMessageWithAi
      { prompt        = prompt_
      , language_code = language_code_
      , add_emojis    = add_emojis_
      }
        = "CreateRichMessageWithAi"
          ++ I.cc
          [ "prompt"        `I.p` prompt_
          , "language_code" `I.p` language_code_
          , "add_emojis"    `I.p` add_emojis_
          ]

instance AT.ToJSON CreateRichMessageWithAi where
  toJSON
    CreateRichMessageWithAi
      { prompt        = prompt_
      , language_code = language_code_
      , add_emojis    = add_emojis_
      }
        = A.object
          [ "@type"         A..= AT.String "createRichMessageWithAi"
          , "prompt"        A..= prompt_
          , "language_code" A..= language_code_
          , "add_emojis"    A..= add_emojis_
          ]

defaultCreateRichMessageWithAi :: CreateRichMessageWithAi
defaultCreateRichMessageWithAi =
  CreateRichMessageWithAi
    { prompt        = Nothing
    , language_code = Nothing
    , add_emojis    = Nothing
    }

