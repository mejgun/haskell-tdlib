{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ChatJoinRequestsInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data ChatJoinRequestsInfo = -- | Contains information about pending join requests for a chat @total_count Total number of pending join requests @user_ids Identifiers of at most 3 users sent the newest pending join requests
  ChatJoinRequestsInfo
  { -- |
    user_ids :: Maybe [Int],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show ChatJoinRequestsInfo where
  show
    ChatJoinRequestsInfo
      { user_ids = user_ids,
        total_count = total_count
      } =
      "ChatJoinRequestsInfo"
        ++ U.cc
          [ U.p "user_ids" user_ids,
            U.p "total_count" total_count
          ]

instance T.FromJSON ChatJoinRequestsInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatJoinRequestsInfo" -> parseChatJoinRequestsInfo v
      _ -> fail ""
    where
      parseChatJoinRequestsInfo :: A.Value -> T.Parser ChatJoinRequestsInfo
      parseChatJoinRequestsInfo = A.withObject "ChatJoinRequestsInfo" $ \o -> do
        user_ids_ <- o A..:? "user_ids"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatJoinRequestsInfo {user_ids = user_ids_, total_count = total_count_}
  parseJSON _ = fail ""

instance T.ToJSON ChatJoinRequestsInfo where
  toJSON
    ChatJoinRequestsInfo
      { user_ids = user_ids,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "chatJoinRequestsInfo",
          "user_ids" A..= user_ids,
          "total_count" A..= total_count
        ]
