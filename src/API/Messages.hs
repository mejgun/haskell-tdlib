-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Messages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Message as Message

-- |
-- 
-- Contains a list of messages 
-- 
-- __total_count__ Approximate total count of messages found
-- 
-- __messages__ List of messages; messages may be null
data Messages = 

 Messages { messages :: Maybe [Message.Message], total_count :: Maybe Int }  deriving (Eq)

instance Show Messages where
 show Messages { messages=messages, total_count=total_count } =
  "Messages" ++ cc [p "messages" messages, p "total_count" total_count ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Messages where
 toJSON Messages { messages = messages, total_count = total_count } =
  A.object [ "@type" A..= T.String "messages", "messages" A..= messages, "total_count" A..= total_count ]

instance T.FromJSON Messages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messages" -> parseMessages v
   _ -> mempty
  where
   parseMessages :: A.Value -> T.Parser Messages
   parseMessages = A.withObject "Messages" $ \o -> do
    messages <- o A..:? "messages"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Messages { messages = messages, total_count = total_count }
 parseJSON _ = mempty
