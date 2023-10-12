module TD.Data.ChatJoinRequestsInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ChatJoinRequestsInfo
  = ChatJoinRequestsInfo -- ^ Contains information about pending join requests for a chat
    { total_count :: Maybe Int   -- ^ Total number of pending join requests
    , user_ids    :: Maybe [Int] -- ^ Identifiers of at most 3 users sent the newest pending join requests
    }
  deriving (Eq)

instance Show ChatJoinRequestsInfo where
  show ChatJoinRequestsInfo
    { total_count = total_count_
    , user_ids    = user_ids_
    }
      = "ChatJoinRequestsInfo"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "user_ids"    `I.p` user_ids_
        ]

instance AT.FromJSON ChatJoinRequestsInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatJoinRequestsInfo" -> parseChatJoinRequestsInfo v
      _                      -> mempty
    
    where
      parseChatJoinRequestsInfo :: A.Value -> AT.Parser ChatJoinRequestsInfo
      parseChatJoinRequestsInfo = A.withObject "ChatJoinRequestsInfo" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        user_ids_    <- o A..:?  "user_ids"
        pure $ ChatJoinRequestsInfo
          { total_count = total_count_
          , user_ids    = user_ids_
          }

instance AT.ToJSON ChatJoinRequestsInfo where
  toJSON ChatJoinRequestsInfo
    { total_count = total_count_
    , user_ids    = user_ids_
    }
      = A.object
        [ "@type"       A..= AT.String "chatJoinRequestsInfo"
        , "total_count" A..= total_count_
        , "user_ids"    A..= user_ids_
        ]
