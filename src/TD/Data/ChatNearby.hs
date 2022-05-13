{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatNearby where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data ChatNearby = -- | Describes a chat located nearby @chat_id Chat identifier @distance Distance to the chat location, in meters
  ChatNearby
  { -- |
    distance :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatNearby where
  show
    ChatNearby
      { distance = distance_,
        chat_id = chat_id_
      } =
      "ChatNearby"
        ++ U.cc
          [ U.p "distance" distance_,
            U.p "chat_id" chat_id_
          ]

instance T.FromJSON ChatNearby where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatNearby" -> parseChatNearby v
      _ -> mempty
    where
      parseChatNearby :: A.Value -> T.Parser ChatNearby
      parseChatNearby = A.withObject "ChatNearby" $ \o -> do
        distance_ <- mconcat [o A..:? "distance", U.rm <$> (o A..: "distance" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatNearby {distance = distance_, chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatNearby where
  toJSON
    ChatNearby
      { distance = distance_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "chatNearby",
          "distance" A..= distance_,
          "chat_id" A..= chat_id_
        ]
