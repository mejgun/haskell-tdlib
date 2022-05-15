{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatJoinRequest where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatJoinRequest = -- | Describes a user that sent a join request and waits for administrator approval @user_id User identifier @date Point in time (Unix timestamp) when the user sent the join request @bio A short bio of the user
  ChatJoinRequest
  { -- |
    bio :: Maybe String,
    -- |
    date :: Maybe Int,
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatJoinRequest where
  show
    ChatJoinRequest
      { bio = bio_,
        date = date_,
        user_id = user_id_
      } =
      "ChatJoinRequest"
        ++ U.cc
          [ U.p "bio" bio_,
            U.p "date" date_,
            U.p "user_id" user_id_
          ]

instance T.FromJSON ChatJoinRequest where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatJoinRequest" -> parseChatJoinRequest v
      _ -> mempty
    where
      parseChatJoinRequest :: A.Value -> T.Parser ChatJoinRequest
      parseChatJoinRequest = A.withObject "ChatJoinRequest" $ \o -> do
        bio_ <- o A..:? "bio"
        date_ <- o A..:? "date"
        user_id_ <- o A..:? "user_id"
        return $ ChatJoinRequest {bio = bio_, date = date_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatJoinRequest where
  toJSON
    ChatJoinRequest
      { bio = bio_,
        date = date_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "chatJoinRequest",
          "bio" A..= bio_,
          "date" A..= date_,
          "user_id" A..= user_id_
        ]
