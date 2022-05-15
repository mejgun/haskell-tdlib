{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatJoinRequests where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatJoinRequest as ChatJoinRequest
import qualified Utils as U

-- |
data ChatJoinRequests = -- | Contains a list of requests to join a chat @total_count Approximate total number of requests found @requests List of the requests
  ChatJoinRequests
  { -- |
    requests :: Maybe [ChatJoinRequest.ChatJoinRequest],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show ChatJoinRequests where
  show
    ChatJoinRequests
      { requests = requests_,
        total_count = total_count_
      } =
      "ChatJoinRequests"
        ++ U.cc
          [ U.p "requests" requests_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON ChatJoinRequests where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatJoinRequests" -> parseChatJoinRequests v
      _ -> mempty
    where
      parseChatJoinRequests :: A.Value -> T.Parser ChatJoinRequests
      parseChatJoinRequests = A.withObject "ChatJoinRequests" $ \o -> do
        requests_ <- o A..:? "requests"
        total_count_ <- o A..:? "total_count"
        return $ ChatJoinRequests {requests = requests_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON ChatJoinRequests where
  toJSON
    ChatJoinRequests
      { requests = requests_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "chatJoinRequests",
          "requests" A..= requests_,
          "total_count" A..= total_count_
        ]
