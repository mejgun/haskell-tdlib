-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatStatisticsMessageInteractionInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains statistics about interactions with a message
-- 
-- __message_id__ Message identifier
-- 
-- __view_count__ Number of times the message was viewed
-- 
-- __forward_count__ Number of times the message was forwarded
data ChatStatisticsMessageInteractionInfo = 

 ChatStatisticsMessageInteractionInfo { forward_count :: Maybe Int, view_count :: Maybe Int, message_id :: Maybe Int }  deriving (Eq)

instance Show ChatStatisticsMessageInteractionInfo where
 show ChatStatisticsMessageInteractionInfo { forward_count=forward_count, view_count=view_count, message_id=message_id } =
  "ChatStatisticsMessageInteractionInfo" ++ cc [p "forward_count" forward_count, p "view_count" view_count, p "message_id" message_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatStatisticsMessageInteractionInfo where
 toJSON ChatStatisticsMessageInteractionInfo { forward_count = forward_count, view_count = view_count, message_id = message_id } =
  A.object [ "@type" A..= T.String "chatStatisticsMessageInteractionInfo", "forward_count" A..= forward_count, "view_count" A..= view_count, "message_id" A..= message_id ]

instance T.FromJSON ChatStatisticsMessageInteractionInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatStatisticsMessageInteractionInfo" -> parseChatStatisticsMessageInteractionInfo v
   _ -> mempty
  where
   parseChatStatisticsMessageInteractionInfo :: A.Value -> T.Parser ChatStatisticsMessageInteractionInfo
   parseChatStatisticsMessageInteractionInfo = A.withObject "ChatStatisticsMessageInteractionInfo" $ \o -> do
    forward_count <- mconcat [ o A..:? "forward_count", readMaybe <$> (o A..: "forward_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    view_count <- mconcat [ o A..:? "view_count", readMaybe <$> (o A..: "view_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatStatisticsMessageInteractionInfo { forward_count = forward_count, view_count = view_count, message_id = message_id }
 parseJSON _ = mempty
