module TD.Query.GetBotMediaPreviewInfo
  (GetBotMediaPreviewInfo(..)
  , defaultGetBotMediaPreviewInfo
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the list of media previews for the given language and the list of languages for which the bot has dedicated previews. Returns 'TD.Data.BotMediaPreviewInfo.BotMediaPreviewInfo'
data GetBotMediaPreviewInfo
  = GetBotMediaPreviewInfo
    { bot_user_id   :: Maybe Int    -- ^ Identifier of the target bot. The bot must be owned and must have the main Web App
    , language_code :: Maybe T.Text -- ^ A two-letter ISO 639-1 language code for which to get previews. If empty, then default previews are returned
    }
  deriving (Eq, Show)

instance I.ShortShow GetBotMediaPreviewInfo where
  shortShow
    GetBotMediaPreviewInfo
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      }
        = "GetBotMediaPreviewInfo"
          ++ I.cc
          [ "bot_user_id"   `I.p` bot_user_id_
          , "language_code" `I.p` language_code_
          ]

instance AT.ToJSON GetBotMediaPreviewInfo where
  toJSON
    GetBotMediaPreviewInfo
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      }
        = A.object
          [ "@type"         A..= AT.String "getBotMediaPreviewInfo"
          , "bot_user_id"   A..= bot_user_id_
          , "language_code" A..= language_code_
          ]

defaultGetBotMediaPreviewInfo :: GetBotMediaPreviewInfo
defaultGetBotMediaPreviewInfo =
  GetBotMediaPreviewInfo
    { bot_user_id   = Nothing
    , language_code = Nothing
    }

