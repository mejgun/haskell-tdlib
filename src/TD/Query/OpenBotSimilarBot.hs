module TD.Query.OpenBotSimilarBot
  (OpenBotSimilarBot(..)
  , defaultOpenBotSimilarBot
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that a bot was opened from the list of similar bots. Returns 'TD.Data.Ok.Ok'
data OpenBotSimilarBot
  = OpenBotSimilarBot
    { bot_user_id        :: Maybe Int -- ^ Identifier of the original bot, which similar bots were requested
    , opened_bot_user_id :: Maybe Int -- ^ Identifier of the opened bot
    }
  deriving (Eq, Show)

instance I.ShortShow OpenBotSimilarBot where
  shortShow
    OpenBotSimilarBot
      { bot_user_id        = bot_user_id_
      , opened_bot_user_id = opened_bot_user_id_
      }
        = "OpenBotSimilarBot"
          ++ I.cc
          [ "bot_user_id"        `I.p` bot_user_id_
          , "opened_bot_user_id" `I.p` opened_bot_user_id_
          ]

instance AT.ToJSON OpenBotSimilarBot where
  toJSON
    OpenBotSimilarBot
      { bot_user_id        = bot_user_id_
      , opened_bot_user_id = opened_bot_user_id_
      }
        = A.object
          [ "@type"              A..= AT.String "openBotSimilarBot"
          , "bot_user_id"        A..= bot_user_id_
          , "opened_bot_user_id" A..= opened_bot_user_id_
          ]

defaultOpenBotSimilarBot :: OpenBotSimilarBot
defaultOpenBotSimilarBot =
  OpenBotSimilarBot
    { bot_user_id        = Nothing
    , opened_bot_user_id = Nothing
    }

