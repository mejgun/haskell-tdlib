{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ChatJoinRequests where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatJoinRequest as ChatJoinRequest
import qualified Utils as U

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
      { requests = requests,
        total_count = total_count
      } =
      "ChatJoinRequests"
        ++ U.cc
          [ U.p "requests" requests,
            U.p "total_count" total_count
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
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatJoinRequests {requests = requests_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON ChatJoinRequests where
  toJSON
    ChatJoinRequests
      { requests = requests,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "chatJoinRequests",
          "requests" A..= requests,
          "total_count" A..= total_count
        ]
