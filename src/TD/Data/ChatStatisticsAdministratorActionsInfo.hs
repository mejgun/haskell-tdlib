module TD.Data.ChatStatisticsAdministratorActionsInfo
  (ChatStatisticsAdministratorActionsInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatStatisticsAdministratorActionsInfo
  = ChatStatisticsAdministratorActionsInfo -- ^ Contains statistics about administrator actions done by a user
    { user_id               :: Maybe Int -- ^ Administrator user identifier
    , deleted_message_count :: Maybe Int -- ^ Number of messages deleted by the administrator
    , banned_user_count     :: Maybe Int -- ^ Number of users banned by the administrator
    , restricted_user_count :: Maybe Int -- ^ Number of users restricted by the administrator
    }
  deriving (Eq, Show)

instance I.ShortShow ChatStatisticsAdministratorActionsInfo where
  shortShow ChatStatisticsAdministratorActionsInfo
    { user_id               = user_id_
    , deleted_message_count = deleted_message_count_
    , banned_user_count     = banned_user_count_
    , restricted_user_count = restricted_user_count_
    }
      = "ChatStatisticsAdministratorActionsInfo"
        ++ I.cc
        [ "user_id"               `I.p` user_id_
        , "deleted_message_count" `I.p` deleted_message_count_
        , "banned_user_count"     `I.p` banned_user_count_
        , "restricted_user_count" `I.p` restricted_user_count_
        ]

instance AT.FromJSON ChatStatisticsAdministratorActionsInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatStatisticsAdministratorActionsInfo" -> parseChatStatisticsAdministratorActionsInfo v
      _                                        -> mempty
    
    where
      parseChatStatisticsAdministratorActionsInfo :: A.Value -> AT.Parser ChatStatisticsAdministratorActionsInfo
      parseChatStatisticsAdministratorActionsInfo = A.withObject "ChatStatisticsAdministratorActionsInfo" $ \o -> do
        user_id_               <- o A..:?  "user_id"
        deleted_message_count_ <- o A..:?  "deleted_message_count"
        banned_user_count_     <- o A..:?  "banned_user_count"
        restricted_user_count_ <- o A..:?  "restricted_user_count"
        pure $ ChatStatisticsAdministratorActionsInfo
          { user_id               = user_id_
          , deleted_message_count = deleted_message_count_
          , banned_user_count     = banned_user_count_
          , restricted_user_count = restricted_user_count_
          }
  parseJSON _ = mempty

