-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessagePosition where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains information about a message in a specific position 
-- 
-- __position__ 0-based message position in the full list of suitable messages
-- 
-- __message_id__ Message identifier
-- 
-- __date__ Point in time (Unix timestamp) when the message was sent
data MessagePosition = 

 MessagePosition { date :: Maybe Int, message_id :: Maybe Int, position :: Maybe Int }  deriving (Eq)

instance Show MessagePosition where
 show MessagePosition { date=date, message_id=message_id, position=position } =
  "MessagePosition" ++ U.cc [U.p "date" date, U.p "message_id" message_id, U.p "position" position ]

instance T.ToJSON MessagePosition where
 toJSON MessagePosition { date = date, message_id = message_id, position = position } =
  A.object [ "@type" A..= T.String "messagePosition", "date" A..= date, "message_id" A..= message_id, "position" A..= position ]

instance T.FromJSON MessagePosition where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messagePosition" -> parseMessagePosition v
   _ -> mempty
  where
   parseMessagePosition :: A.Value -> T.Parser MessagePosition
   parseMessagePosition = A.withObject "MessagePosition" $ \o -> do
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    position <- mconcat [ o A..:? "position", readMaybe <$> (o A..: "position" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessagePosition { date = date, message_id = message_id, position = position }
 parseJSON _ = mempty
