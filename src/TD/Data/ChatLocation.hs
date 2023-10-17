module TD.Data.ChatLocation
  ( ChatLocation(..)    
  , defaultChatLocation 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location
import qualified Data.Text as T

data ChatLocation
  = ChatLocation -- ^ Represents a location to which a chat is connected
    { location :: Maybe Location.Location -- ^ The location
    , address  :: Maybe T.Text            -- ^ Location address; 1-64 characters, as defined by the chat owner
    }
  deriving (Eq, Show)

instance I.ShortShow ChatLocation where
  shortShow ChatLocation
    { location = location_
    , address  = address_
    }
      = "ChatLocation"
        ++ I.cc
        [ "location" `I.p` location_
        , "address"  `I.p` address_
        ]

instance AT.FromJSON ChatLocation where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatLocation" -> parseChatLocation v
      _              -> mempty
    
    where
      parseChatLocation :: A.Value -> AT.Parser ChatLocation
      parseChatLocation = A.withObject "ChatLocation" $ \o -> do
        location_ <- o A..:?  "location"
        address_  <- o A..:?  "address"
        pure $ ChatLocation
          { location = location_
          , address  = address_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatLocation where
  toJSON ChatLocation
    { location = location_
    , address  = address_
    }
      = A.object
        [ "@type"    A..= AT.String "chatLocation"
        , "location" A..= location_
        , "address"  A..= address_
        ]

defaultChatLocation :: ChatLocation
defaultChatLocation =
  ChatLocation
    { location = Nothing
    , address  = Nothing
    }

