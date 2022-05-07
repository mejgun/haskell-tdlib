{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ChatLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Location as Location
import qualified Utils as U

data ChatLocation = -- | Represents a location to which a chat is connected @location The location @address Location address; 1-64 characters, as defined by the chat owner
  ChatLocation
  { -- |
    address :: Maybe String,
    -- |
    location :: Maybe Location.Location
  }
  deriving (Eq)

instance Show ChatLocation where
  show
    ChatLocation
      { address = address,
        location = location
      } =
      "ChatLocation"
        ++ U.cc
          [ U.p "address" address,
            U.p "location" location
          ]

instance T.FromJSON ChatLocation where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatLocation" -> parseChatLocation v
      _ -> mempty
    where
      parseChatLocation :: A.Value -> T.Parser ChatLocation
      parseChatLocation = A.withObject "ChatLocation" $ \o -> do
        address_ <- o A..:? "address"
        location_ <- o A..:? "location"
        return $ ChatLocation {address = address_, location = location_}
  parseJSON _ = mempty

instance T.ToJSON ChatLocation where
  toJSON
    ChatLocation
      { address = address,
        location = location
      } =
      A.object
        [ "@type" A..= T.String "chatLocation",
          "address" A..= address,
          "location" A..= location
        ]
