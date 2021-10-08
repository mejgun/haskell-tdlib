-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatStatisticsMessageSenderInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains statistics about messages sent by a user
-- 
-- __user_id__ User identifier
-- 
-- __sent_message_count__ Number of sent messages
-- 
-- __average_character_count__ Average number of characters in sent messages; 0 if unknown
data ChatStatisticsMessageSenderInfo = 

 ChatStatisticsMessageSenderInfo { average_character_count :: Maybe Int, sent_message_count :: Maybe Int, user_id :: Maybe Int }  deriving (Eq)

instance Show ChatStatisticsMessageSenderInfo where
 show ChatStatisticsMessageSenderInfo { average_character_count=average_character_count, sent_message_count=sent_message_count, user_id=user_id } =
  "ChatStatisticsMessageSenderInfo" ++ cc [p "average_character_count" average_character_count, p "sent_message_count" sent_message_count, p "user_id" user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatStatisticsMessageSenderInfo where
 toJSON ChatStatisticsMessageSenderInfo { average_character_count = average_character_count, sent_message_count = sent_message_count, user_id = user_id } =
  A.object [ "@type" A..= T.String "chatStatisticsMessageSenderInfo", "average_character_count" A..= average_character_count, "sent_message_count" A..= sent_message_count, "user_id" A..= user_id ]

instance T.FromJSON ChatStatisticsMessageSenderInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatStatisticsMessageSenderInfo" -> parseChatStatisticsMessageSenderInfo v
   _ -> mempty
  where
   parseChatStatisticsMessageSenderInfo :: A.Value -> T.Parser ChatStatisticsMessageSenderInfo
   parseChatStatisticsMessageSenderInfo = A.withObject "ChatStatisticsMessageSenderInfo" $ \o -> do
    average_character_count <- mconcat [ o A..:? "average_character_count", readMaybe <$> (o A..: "average_character_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    sent_message_count <- mconcat [ o A..:? "sent_message_count", readMaybe <$> (o A..: "sent_message_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatStatisticsMessageSenderInfo { average_character_count = average_character_count, sent_message_count = sent_message_count, user_id = user_id }
 parseJSON _ = mempty
