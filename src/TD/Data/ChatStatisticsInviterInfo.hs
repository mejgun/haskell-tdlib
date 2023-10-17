module TD.Data.ChatStatisticsInviterInfo
  (ChatStatisticsInviterInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatStatisticsInviterInfo
  = ChatStatisticsInviterInfo -- ^ Contains statistics about number of new members invited by a user
    { user_id            :: Maybe Int -- ^ User identifier
    , added_member_count :: Maybe Int -- ^ Number of new members invited by the user
    }
  deriving (Eq, Show)

instance I.ShortShow ChatStatisticsInviterInfo where
  shortShow ChatStatisticsInviterInfo
    { user_id            = user_id_
    , added_member_count = added_member_count_
    }
      = "ChatStatisticsInviterInfo"
        ++ I.cc
        [ "user_id"            `I.p` user_id_
        , "added_member_count" `I.p` added_member_count_
        ]

instance AT.FromJSON ChatStatisticsInviterInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatStatisticsInviterInfo" -> parseChatStatisticsInviterInfo v
      _                           -> mempty
    
    where
      parseChatStatisticsInviterInfo :: A.Value -> AT.Parser ChatStatisticsInviterInfo
      parseChatStatisticsInviterInfo = A.withObject "ChatStatisticsInviterInfo" $ \o -> do
        user_id_            <- o A..:?  "user_id"
        added_member_count_ <- o A..:?  "added_member_count"
        pure $ ChatStatisticsInviterInfo
          { user_id            = user_id_
          , added_member_count = added_member_count_
          }
  parseJSON _ = mempty

