{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ChatsNearby where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatNearby as ChatNearby
import qualified Utils as U

data ChatsNearby = -- | Represents a list of chats located nearby @users_nearby List of users nearby @supergroups_nearby List of location-based supergroups nearby
  ChatsNearby
  { -- |
    supergroups_nearby :: Maybe [ChatNearby.ChatNearby],
    -- |
    users_nearby :: Maybe [ChatNearby.ChatNearby]
  }
  deriving (Eq)

instance Show ChatsNearby where
  show
    ChatsNearby
      { supergroups_nearby = supergroups_nearby,
        users_nearby = users_nearby
      } =
      "ChatsNearby"
        ++ U.cc
          [ U.p "supergroups_nearby" supergroups_nearby,
            U.p "users_nearby" users_nearby
          ]

instance T.FromJSON ChatsNearby where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatsNearby" -> parseChatsNearby v
      _ -> fail ""
    where
      parseChatsNearby :: A.Value -> T.Parser ChatsNearby
      parseChatsNearby = A.withObject "ChatsNearby" $ \o -> do
        supergroups_nearby_ <- o A..:? "supergroups_nearby"
        users_nearby_ <- o A..:? "users_nearby"
        return $ ChatsNearby {supergroups_nearby = supergroups_nearby_, users_nearby = users_nearby_}
  parseJSON _ = fail ""

instance T.ToJSON ChatsNearby where
  toJSON
    ChatsNearby
      { supergroups_nearby = supergroups_nearby,
        users_nearby = users_nearby
      } =
      A.object
        [ "@type" A..= T.String "chatsNearby",
          "supergroups_nearby" A..= supergroups_nearby,
          "users_nearby" A..= users_nearby
        ]
