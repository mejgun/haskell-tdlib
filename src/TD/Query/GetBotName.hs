module TD.Query.GetBotName(GetBotName(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetBotName -- ^ Returns the name of a bot in the given language. Can be called only if userTypeBot.can_be_edited == true
  = GetBotName
    { bot_user_id   :: Maybe Int    -- ^ Identifier of the target bot
    , language_code :: Maybe T.Text -- ^ A two-letter ISO 639-1 language code or an empty string
    }
  deriving (Eq)

instance Show GetBotName where
  show
    GetBotName
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      }
        = "GetBotName"
          ++ I.cc
          [ "bot_user_id"   `I.p` bot_user_id_
          , "language_code" `I.p` language_code_
          ]

instance AT.ToJSON GetBotName where
  toJSON
    GetBotName
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      }
        = A.object
          [ "@type"         A..= AT.String "getBotName"
          , "bot_user_id"   A..= bot_user_id_
          , "language_code" A..= language_code_
          ]
