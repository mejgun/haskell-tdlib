module TD.Data.CommunityAddChatRequests
  (CommunityAddChatRequests(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CommunityAddChatRequest as CommunityAddChatRequest
import qualified Data.Text as T

data CommunityAddChatRequests
  = CommunityAddChatRequests -- ^ Contains a list of requests to add chats to a community
    { total_count :: Maybe Int                                               -- ^ Approximate total number of requests found
    , requests    :: Maybe [CommunityAddChatRequest.CommunityAddChatRequest] -- ^ List of the requests
    , next_offset :: Maybe T.Text                                            -- ^ The offset for the next getCommunityAddChatRequests request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow CommunityAddChatRequests where
  shortShow CommunityAddChatRequests
    { total_count = total_count_
    , requests    = requests_
    , next_offset = next_offset_
    }
      = "CommunityAddChatRequests"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "requests"    `I.p` requests_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON CommunityAddChatRequests where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "communityAddChatRequests" -> parseCommunityAddChatRequests v
      _                          -> mempty
    
    where
      parseCommunityAddChatRequests :: A.Value -> AT.Parser CommunityAddChatRequests
      parseCommunityAddChatRequests = A.withObject "CommunityAddChatRequests" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        requests_    <- o A..:?  "requests"
        next_offset_ <- o A..:?  "next_offset"
        pure $ CommunityAddChatRequests
          { total_count = total_count_
          , requests    = requests_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

