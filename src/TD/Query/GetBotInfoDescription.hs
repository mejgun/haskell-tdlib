module TD.Query.GetBotInfoDescription
  (GetBotInfoDescription(..)
  , defaultGetBotInfoDescription
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the text shown in the chat with a bot if the chat is empty in the given language. Can be called only if userTypeBot.can_be_edited == true. Returns 'TD.Data.Text.Text'
data GetBotInfoDescription
  = GetBotInfoDescription
    { bot_user_id   :: Maybe Int    -- ^ Identifier of the target bot
    , language_code :: Maybe T.Text -- ^ A two-letter ISO 639-1 language code or an empty string
    }
  deriving (Eq, Show)

instance I.ShortShow GetBotInfoDescription where
  shortShow
    GetBotInfoDescription
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      }
        = "GetBotInfoDescription"
          ++ I.cc
          [ "bot_user_id"   `I.p` bot_user_id_
          , "language_code" `I.p` language_code_
          ]

instance AT.ToJSON GetBotInfoDescription where
  toJSON
    GetBotInfoDescription
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      }
        = A.object
          [ "@type"         A..= AT.String "getBotInfoDescription"
          , "bot_user_id"   A..= bot_user_id_
          , "language_code" A..= language_code_
          ]

defaultGetBotInfoDescription :: GetBotInfoDescription
defaultGetBotInfoDescription =
  GetBotInfoDescription
    { bot_user_id   = Nothing
    , language_code = Nothing
    }

