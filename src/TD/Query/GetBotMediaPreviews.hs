module TD.Query.GetBotMediaPreviews
  (GetBotMediaPreviews(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of media previews of a bot. Returns 'TD.Data.BotMediaPreviews.BotMediaPreviews'
data GetBotMediaPreviews
  = GetBotMediaPreviews
    { bot_user_id :: Maybe Int -- ^ Identifier of the target bot. The bot must have the main Web App
    }
  deriving (Eq, Show)

instance I.ShortShow GetBotMediaPreviews where
  shortShow
    GetBotMediaPreviews
      { bot_user_id = bot_user_id_
      }
        = "GetBotMediaPreviews"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON GetBotMediaPreviews where
  toJSON
    GetBotMediaPreviews
      { bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "getBotMediaPreviews"
          , "bot_user_id" A..= bot_user_id_
          ]

