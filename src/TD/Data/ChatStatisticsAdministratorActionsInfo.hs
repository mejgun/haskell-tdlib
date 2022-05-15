{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatStatisticsAdministratorActionsInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatStatisticsAdministratorActionsInfo = -- | Contains statistics about administrator actions done by a user
  ChatStatisticsAdministratorActionsInfo
  { -- | Number of users restricted by the administrator
    restricted_user_count :: Maybe Int,
    -- | Number of users banned by the administrator
    banned_user_count :: Maybe Int,
    -- | Number of messages deleted by the administrator
    deleted_message_count :: Maybe Int,
    -- | Administrator user identifier
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatStatisticsAdministratorActionsInfo where
  show
    ChatStatisticsAdministratorActionsInfo
      { restricted_user_count = restricted_user_count_,
        banned_user_count = banned_user_count_,
        deleted_message_count = deleted_message_count_,
        user_id = user_id_
      } =
      "ChatStatisticsAdministratorActionsInfo"
        ++ U.cc
          [ U.p "restricted_user_count" restricted_user_count_,
            U.p "banned_user_count" banned_user_count_,
            U.p "deleted_message_count" deleted_message_count_,
            U.p "user_id" user_id_
          ]

instance T.FromJSON ChatStatisticsAdministratorActionsInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatStatisticsAdministratorActionsInfo" -> parseChatStatisticsAdministratorActionsInfo v
      _ -> mempty
    where
      parseChatStatisticsAdministratorActionsInfo :: A.Value -> T.Parser ChatStatisticsAdministratorActionsInfo
      parseChatStatisticsAdministratorActionsInfo = A.withObject "ChatStatisticsAdministratorActionsInfo" $ \o -> do
        restricted_user_count_ <- o A..:? "restricted_user_count"
        banned_user_count_ <- o A..:? "banned_user_count"
        deleted_message_count_ <- o A..:? "deleted_message_count"
        user_id_ <- o A..:? "user_id"
        return $ ChatStatisticsAdministratorActionsInfo {restricted_user_count = restricted_user_count_, banned_user_count = banned_user_count_, deleted_message_count = deleted_message_count_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatStatisticsAdministratorActionsInfo where
  toJSON
    ChatStatisticsAdministratorActionsInfo
      { restricted_user_count = restricted_user_count_,
        banned_user_count = banned_user_count_,
        deleted_message_count = deleted_message_count_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "chatStatisticsAdministratorActionsInfo",
          "restricted_user_count" A..= restricted_user_count_,
          "banned_user_count" A..= banned_user_count_,
          "deleted_message_count" A..= deleted_message_count_,
          "user_id" A..= user_id_
        ]
