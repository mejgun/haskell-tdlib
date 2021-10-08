-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Chats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Represents a list of chats 
-- 
-- __total_count__ Approximate total count of chats found
-- 
-- __chat_ids__ List of chat identifiers
data Chats = 

 Chats { chat_ids :: Maybe [Int], total_count :: Maybe Int }  deriving (Eq)

instance Show Chats where
 show Chats { chat_ids=chat_ids, total_count=total_count } =
  "Chats" ++ cc [p "chat_ids" chat_ids, p "total_count" total_count ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Chats where
 toJSON Chats { chat_ids = chat_ids, total_count = total_count } =
  A.object [ "@type" A..= T.String "chats", "chat_ids" A..= chat_ids, "total_count" A..= total_count ]

instance T.FromJSON Chats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chats" -> parseChats v
   _ -> mempty
  where
   parseChats :: A.Value -> T.Parser Chats
   parseChats = A.withObject "Chats" $ \o -> do
    chat_ids <- o A..:? "chat_ids"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Chats { chat_ids = chat_ids, total_count = total_count }
 parseJSON _ = mempty
