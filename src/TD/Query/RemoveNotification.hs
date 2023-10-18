module TD.Query.RemoveNotification
  (RemoveNotification(..)
  , defaultRemoveNotification
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes an active notification from notification list. Needs to be called only if the notification is removed by the current user. Returns 'TD.Data.Ok.Ok'
data RemoveNotification
  = RemoveNotification
    { notification_group_id :: Maybe Int -- ^ Identifier of notification group to which the notification belongs
    , notification_id       :: Maybe Int -- ^ Identifier of removed notification
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveNotification where
  shortShow
    RemoveNotification
      { notification_group_id = notification_group_id_
      , notification_id       = notification_id_
      }
        = "RemoveNotification"
          ++ I.cc
          [ "notification_group_id" `I.p` notification_group_id_
          , "notification_id"       `I.p` notification_id_
          ]

instance AT.ToJSON RemoveNotification where
  toJSON
    RemoveNotification
      { notification_group_id = notification_group_id_
      , notification_id       = notification_id_
      }
        = A.object
          [ "@type"                 A..= AT.String "removeNotification"
          , "notification_group_id" A..= notification_group_id_
          , "notification_id"       A..= notification_id_
          ]

defaultRemoveNotification :: RemoveNotification
defaultRemoveNotification =
  RemoveNotification
    { notification_group_id = Nothing
    , notification_id       = Nothing
    }

