{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessagePosition where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data MessagePosition = -- | Contains information about a message in a specific position @position 0-based message position in the full list of suitable messages @message_id Message identifier @date Point in time (Unix timestamp) when the message was sent
  MessagePosition
  { -- |
    date :: Maybe Int,
    -- |
    message_id :: Maybe Int,
    -- |
    position :: Maybe Int
  }
  deriving (Eq)

instance Show MessagePosition where
  show
    MessagePosition
      { date = date_,
        message_id = message_id_,
        position = position_
      } =
      "MessagePosition"
        ++ U.cc
          [ U.p "date" date_,
            U.p "message_id" message_id_,
            U.p "position" position_
          ]

instance T.FromJSON MessagePosition where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messagePosition" -> parseMessagePosition v
      _ -> mempty
    where
      parseMessagePosition :: A.Value -> T.Parser MessagePosition
      parseMessagePosition = A.withObject "MessagePosition" $ \o -> do
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        position_ <- mconcat [o A..:? "position", U.rm <$> (o A..: "position" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ MessagePosition {date = date_, message_id = message_id_, position = position_}
  parseJSON _ = mempty

instance T.ToJSON MessagePosition where
  toJSON
    MessagePosition
      { date = date_,
        message_id = message_id_,
        position = position_
      } =
      A.object
        [ "@type" A..= T.String "messagePosition",
          "date" A..= date_,
          "message_id" A..= message_id_,
          "position" A..= position_
        ]
