module TD.Query.GetBotInfoShortDescription(GetBotInfoShortDescription(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetBotInfoShortDescription -- ^ Returns the text shown on a bot's profile page and sent together with the link when users share the bot in the given language. Can be called only if userTypeBot.can_be_edited == true
  = GetBotInfoShortDescription
    { bot_user_id   :: Maybe Int    -- ^ Identifier of the target bot
    , language_code :: Maybe T.Text -- ^ A two-letter ISO 639-1 language code or an empty string
    }
  deriving (Eq)

instance Show GetBotInfoShortDescription where
  show
    GetBotInfoShortDescription
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      }
        = "GetBotInfoShortDescription"
          ++ I.cc
          [ "bot_user_id"   `I.p` bot_user_id_
          , "language_code" `I.p` language_code_
          ]

instance AT.ToJSON GetBotInfoShortDescription where
  toJSON
    GetBotInfoShortDescription
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      }
        = A.object
          [ "@type"         A..= AT.String "getBotInfoShortDescription"
          , "bot_user_id"   A..= bot_user_id_
          , "language_code" A..= language_code_
          ]
