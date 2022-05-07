{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ChatJoinRequest where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

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
      { bio = bio,
        date = date,
        user_id = user_id
      } =
      "ChatJoinRequest"
        ++ U.cc
          [ U.p "bio" bio,
            U.p "date" date,
            U.p "user_id" user_id
          ]

instance T.FromJSON ChatJoinRequest where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatJoinRequest" -> parseChatJoinRequest v
      _ -> fail ""
    where
      parseChatJoinRequest :: A.Value -> T.Parser ChatJoinRequest
      parseChatJoinRequest = A.withObject "ChatJoinRequest" $ \o -> do
        bio_ <- o A..:? "bio"
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatJoinRequest {bio = bio_, date = date_, user_id = user_id_}
  parseJSON _ = fail ""

instance T.ToJSON ChatJoinRequest where
  toJSON
    ChatJoinRequest
      { bio = bio,
        date = date,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "chatJoinRequest",
          "bio" A..= bio,
          "date" A..= date,
          "user_id" A..= user_id
        ]
