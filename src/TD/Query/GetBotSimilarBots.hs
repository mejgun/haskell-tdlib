module TD.Query.GetBotSimilarBots
  (GetBotSimilarBots(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a list of bots similar to the given bot. Returns 'TD.Data.Users.Users'
data GetBotSimilarBots
  = GetBotSimilarBots
    { bot_user_id :: Maybe Int -- ^ User identifier of the target bot
    }
  deriving (Eq, Show)

instance I.ShortShow GetBotSimilarBots where
  shortShow
    GetBotSimilarBots
      { bot_user_id = bot_user_id_
      }
        = "GetBotSimilarBots"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON GetBotSimilarBots where
  toJSON
    GetBotSimilarBots
      { bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "getBotSimilarBots"
          , "bot_user_id" A..= bot_user_id_
          ]

