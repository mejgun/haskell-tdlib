{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatStatisticsInviterInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatStatisticsInviterInfo = -- | Contains statistics about number of new members invited by a user
  ChatStatisticsInviterInfo
  { -- | Number of new members invited by the user
    added_member_count :: Maybe Int,
    -- | User identifier
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatStatisticsInviterInfo where
  show
    ChatStatisticsInviterInfo
      { added_member_count = added_member_count_,
        user_id = user_id_
      } =
      "ChatStatisticsInviterInfo"
        ++ U.cc
          [ U.p "added_member_count" added_member_count_,
            U.p "user_id" user_id_
          ]

instance T.FromJSON ChatStatisticsInviterInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatStatisticsInviterInfo" -> parseChatStatisticsInviterInfo v
      _ -> mempty
    where
      parseChatStatisticsInviterInfo :: A.Value -> T.Parser ChatStatisticsInviterInfo
      parseChatStatisticsInviterInfo = A.withObject "ChatStatisticsInviterInfo" $ \o -> do
        added_member_count_ <- o A..:? "added_member_count"
        user_id_ <- o A..:? "user_id"
        return $ ChatStatisticsInviterInfo {added_member_count = added_member_count_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatStatisticsInviterInfo where
  toJSON
    ChatStatisticsInviterInfo
      { added_member_count = added_member_count_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "chatStatisticsInviterInfo",
          "added_member_count" A..= added_member_count_,
          "user_id" A..= user_id_
        ]
