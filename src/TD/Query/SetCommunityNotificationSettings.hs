module TD.Query.SetCommunityNotificationSettings
  (SetCommunityNotificationSettings(..)
  , defaultSetCommunityNotificationSettings
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings

-- | Changes notification settings of a community. Returns 'TD.Data.Ok.Ok'
data SetCommunityNotificationSettings
  = SetCommunityNotificationSettings
    { community_id          :: Maybe Int                                               -- ^ Identifier of the community
    , notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings -- ^ New notification settings for the community
    }
  deriving (Eq, Show)

instance I.ShortShow SetCommunityNotificationSettings where
  shortShow
    SetCommunityNotificationSettings
      { community_id          = community_id_
      , notification_settings = notification_settings_
      }
        = "SetCommunityNotificationSettings"
          ++ I.cc
          [ "community_id"          `I.p` community_id_
          , "notification_settings" `I.p` notification_settings_
          ]

instance AT.ToJSON SetCommunityNotificationSettings where
  toJSON
    SetCommunityNotificationSettings
      { community_id          = community_id_
      , notification_settings = notification_settings_
      }
        = A.object
          [ "@type"                 A..= AT.String "setCommunityNotificationSettings"
          , "community_id"          A..= community_id_
          , "notification_settings" A..= notification_settings_
          ]

defaultSetCommunityNotificationSettings :: SetCommunityNotificationSettings
defaultSetCommunityNotificationSettings =
  SetCommunityNotificationSettings
    { community_id          = Nothing
    , notification_settings = Nothing
    }

