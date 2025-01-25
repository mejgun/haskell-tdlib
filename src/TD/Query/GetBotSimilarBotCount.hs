module TD.Query.GetBotSimilarBotCount
  (GetBotSimilarBotCount(..)
  , defaultGetBotSimilarBotCount
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns approximate number of bots similar to the given bot. Returns 'TD.Data.Count.Count'
data GetBotSimilarBotCount
  = GetBotSimilarBotCount
    { bot_user_id  :: Maybe Int  -- ^ User identifier of the target bot
    , return_local :: Maybe Bool -- ^ Pass true to get the number of bots without sending network requests, or -1 if the number of bots is unknown locally
    }
  deriving (Eq, Show)

instance I.ShortShow GetBotSimilarBotCount where
  shortShow
    GetBotSimilarBotCount
      { bot_user_id  = bot_user_id_
      , return_local = return_local_
      }
        = "GetBotSimilarBotCount"
          ++ I.cc
          [ "bot_user_id"  `I.p` bot_user_id_
          , "return_local" `I.p` return_local_
          ]

instance AT.ToJSON GetBotSimilarBotCount where
  toJSON
    GetBotSimilarBotCount
      { bot_user_id  = bot_user_id_
      , return_local = return_local_
      }
        = A.object
          [ "@type"        A..= AT.String "getBotSimilarBotCount"
          , "bot_user_id"  A..= bot_user_id_
          , "return_local" A..= return_local_
          ]

defaultGetBotSimilarBotCount :: GetBotSimilarBotCount
defaultGetBotSimilarBotCount =
  GetBotSimilarBotCount
    { bot_user_id  = Nothing
    , return_local = Nothing
    }

