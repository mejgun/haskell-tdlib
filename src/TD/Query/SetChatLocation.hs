module TD.Query.SetChatLocation(SetChatLocation(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatLocation as ChatLocation

data SetChatLocation -- ^ Changes the location of a chat. Available only for some location-based supergroups, use supergroupFullInfo.can_set_location to check whether the method is allowed to use
  = SetChatLocation
    { chat_id  :: Maybe Int                       -- ^ Chat identifier
    , location :: Maybe ChatLocation.ChatLocation -- ^ New location for the chat; must be valid and not null
    }
  deriving (Eq)

instance Show SetChatLocation where
  show
    SetChatLocation
      { chat_id  = chat_id_
      , location = location_
      }
        = "SetChatLocation"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "location" `I.p` location_
          ]

instance AT.ToJSON SetChatLocation where
  toJSON
    SetChatLocation
      { chat_id  = chat_id_
      , location = location_
      }
        = A.object
          [ "@type"    A..= AT.String "setChatLocation"
          , "chat_id"  A..= chat_id_
          , "location" A..= location_
          ]
