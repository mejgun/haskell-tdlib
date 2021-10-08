-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatNearby where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes a chat located nearby 
-- 
-- __chat_id__ Chat identifier
-- 
-- __distance__ Distance to the chat location, in meters
data ChatNearby = 

 ChatNearby { distance :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show ChatNearby where
 show ChatNearby { distance=distance, chat_id=chat_id } =
  "ChatNearby" ++ cc [p "distance" distance, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatNearby where
 toJSON ChatNearby { distance = distance, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "chatNearby", "distance" A..= distance, "chat_id" A..= chat_id ]

instance T.FromJSON ChatNearby where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatNearby" -> parseChatNearby v
   _ -> mempty
  where
   parseChatNearby :: A.Value -> T.Parser ChatNearby
   parseChatNearby = A.withObject "ChatNearby" $ \o -> do
    distance <- mconcat [ o A..:? "distance", readMaybe <$> (o A..: "distance" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatNearby { distance = distance, chat_id = chat_id }
 parseJSON _ = mempty
