module TD.Query.GetBotInfoShortDescription
  (GetBotInfoShortDescription(..)
  , defaultGetBotInfoShortDescription
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the text shown on a bot's profile page and sent together with the link when users share the bot in the given language. Can be called only if userTypeBot.can_be_edited == true. Returns 'TD.Data.Text.Text'
data GetBotInfoShortDescription
  = GetBotInfoShortDescription
    { bot_user_id   :: Maybe Int    -- ^ Identifier of the target bot
    , language_code :: Maybe T.Text -- ^ A two-letter ISO 639-1 language code or an empty string
    }
  deriving (Eq, Show)

instance I.ShortShow GetBotInfoShortDescription where
  shortShow
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

defaultGetBotInfoShortDescription :: GetBotInfoShortDescription
defaultGetBotInfoShortDescription =
  GetBotInfoShortDescription
    { bot_user_id   = Nothing
    , language_code = Nothing
    }

